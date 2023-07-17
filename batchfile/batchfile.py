import sys
import os
import glob
import random
from ._functions import *
from .textfile import TextFileRedirect

try:
    # change working directory to the file this was imported from
    from __main__ import __file__ as calling_file

    os.chdir(os.path.dirname(calling_file))
except (ImportError, FileNotFoundError, NotADirectoryError, OSError):
    calling_file = None


LOG = make_debug_log()


class QuitProgram(Exception):
    ...


class Callstack(list):
    def pop_(self):
        # pop() of standard list is read-only
        # this makes pop overwritable if needed
        return self.pop()


class Batchfile:
    def __init__(self, stdin=None, stdout=None, redirection=None):
        """
        stdin can be set to a callback which triggers when input is requested
        stdout is expected to be a list-like object with append() and clear()
        redirection should be an object with the same interface as TextFileRedirect
        """
        self.SILENCE_STDOUT = False if stdout is None else True
        self.stdout = stdout

        self._WAIT_FOR_STDIN = False if stdin is None else True
        self.stdin = stdin

        self.redirection_target = (
            TextFileRedirect() if redirection is None else redirection
        )

        nothing = lambda *_: None
        self.token_interpreters = {
            "cls": self.clear,
            "for": self.for_loop,
            "del": self.delete_file,
            "ren": self.move_file,
            "@echo": nothing,
            "mode": nothing,
            "title": nothing,
            "color": nothing,
            "": nothing,
            "ctext": self.colour_print,
            "ctext.exe": self.colour_print,
            "pause": self.pause,
            "echo": self.echo,
            "echo.": self.line_output,
            "call": self.call_bat,
            "if": self.conditional_expr,
            "set": self.set_variable,
            "cd": self.chdir,
            "dir": self.echo_dir,
            "ls": self.echo_dir,
            "type": self.echo_file,
        }
        self.VARIABLES = {}
        self.CALLSTACK = Callstack()

    @property
    def WAIT_FOR_STDIN(self):
        return self._WAIT_FOR_STDIN

    @WAIT_FOR_STDIN.setter
    def WAIT_FOR_STDIN(self, new_value):
        """Ensure that 'stdin' callback is removed if waiting is turned off"""
        if new_value == False:
            self.stdin = None
        self._WAIT_FOR_STDIN = new_value

    def clear(self):
        if self.SILENCE_STDOUT:
            self.stdout.clear()
        else:
            clear_console()

    def run(self, lines):
        """
        Execute a batch file line or list of lines
        """
        self.CALLSTACK.clear()
        if type(lines) is str:
            lines = [lines]
        try:
            self.execute_lines(lines)
        except QuitProgram:
            pass

    chdir = lambda self, dir: os.chdir(dir)
    echo_dir = lambda self: self.line_output(os.getcwd())
    echo_file = lambda self, filename: self.line_output(get_textfile_lines(filename))

    def line_output(self, line="", end="\n"):
        """
        If self.stdout is a list, appends to that list.
        Otherwise writes to real stdout
        """
        text = f"{line}{end}"
        if self.SILENCE_STDOUT:
            self.stdout.append(text)
            return
        sys.stdout.write(text)
        sys.stdout.flush()

    def line_input(self, line=""):
        """
        If self.stdin is a callback, trigger it and wait for response
        Otherwise read input from real stdin
        """
        line = line.replace("%", "")
        line = line.replace("^", "")
        self.line_output(line, end=" ")
        try:
            while self.WAIT_FOR_STDIN:
                response = self.stdin()
                if response == "":
                    continue
                return f"{response}\n".strip()
            assert self.stdin is None
            return input().strip()
        except (KeyboardInterrupt, EOFError):
            raise QuitProgram

    def delete_file(self, line):
        files = glob.glob(line)
        for item in files:
            self.redirection_target.remove(item)

    def move_file(self, line):
        orig, new = line.split(" ")
        orig = glob.glob(orig)
        dest = new
        for item in orig:
            if new.startswith("*"):
                dest = f"{item}{new[1:]}"
            self.redirection_target.move(orig, dest)

    def conditional_math(self, first, operation, second):
        first = self.expand_variables(strip_quotes(first))
        second = self.expand_variables(strip_quotes(second))
        try:
            first = int(first)
            second = int(second)
        except ValueError:
            pass
        if operation in ("==", " EQU "):
            return first == second
        elif operation == " NEQ ":
            return first != second
        elif operation == " GTR ":
            return first > second
        elif operation == " GEQ ":
            return first >= second
        elif operation == " LEQ ":
            return first <= second
        elif operation == " LSS ":
            return first < second
        else:
            raise SyntaxError(f'invalid math operation ("{operation}") for conditional')

    def conditional_expr(self, line):
        """
        Starting point to any statement beginning with "if"
        Receives as input: a string with the "if" removed already,
            with an expression that can be compared using math,
            or the keyword "exist " followed by a filename
        """
        if line.startswith("/i"):
            # I think this is supposed to mean 'case insensitive' but whatever
            line = line[3:]
        positive = True
        if line.startswith("not "):
            positive = False
            line = line[4:]
        for math_term in ["==", " GEQ ", " GTR ", " LEQ ", " LSS ", " EQU ", " NEQ "]:
            if math_term in line:
                first, second = line.split(math_term, 1)
                # gotta check for quotations here to make recruitment.bat work
                second, statement = second.split(" ", 1)
                if second.isdigit():
                    second = int(second)
                value = self.conditional_math(first, math_term, second)
                break
        else:
            if "exist " in line:
                _, filename, statement = line.split(" ", 2)
                value = self.redirection_target.exists(filename)
            else:
                raise NotImplementedError("i can't handle that if statement")
        if not positive:
            value = not value
        if value:
            if statement.startswith("if "):
                return self.conditional_expr(statement[3:])
            return statement

    def echo(self, text):
        """
        Normally echo will "print to the screen", either with the real stdout
            or by appending to self.stdout if it is set to a list
        If text ends with >, then redirection_target.create(text) instead
        If text ends with >>, then redirection_target.append(text) instead
        """
        text = text.split(">")
        for i, token in enumerate(text):
            if len(text) - 1 == i:
                break
            # if a token escapes the next token, merge and delete it
            if token.endswith("^"):
                text[i] = f"{token[:-1]}{text[i+1] if text[i+1] else '>'}"
                del text[i + 1]
        text[0] = self.expand_variables(text[0])
        if len(text) == 1:
            self.line_output(text[0])
        elif len(text) == 2:
            # > creates a new file
            self.redirection_target.create(text[1].strip(), text[0])
        elif len(text) == 3:
            # >> appends to an existing file
            self.redirection_target.append(text[2].strip(), text[0])

    def colour_print(self, text):
        """
        Removes colour-tags from text and passes them through to echo
        """
        while "{" in text:
            text = f"{text[:text.index('{')]}{text[text.index('}')+1:]}"
        text = strip_quotes(text)
        if text:
            self.echo(text)

    def pause(self, *line):
        if line:
            self.line_input()
        else:
            self.line_input("Press ENTER to continue . . .")

    def resume(self, callstack: Callstack, variables: dict):
        """
        Defines variables then starts from the tail end of a callstack.
        Used for resuming a dead session from another Batchfile object.
        """
        self.VARIABLES = variables
        self.CALLSTACK = callstack
        filename, lineno = callstack[-1]
        LOG.debug("Resuming into file %s at line %s", filename, lineno)
        self.call_bat(filename, lineno)

    def call_bat(self, line, line_number=None):
        """
        Receives as input: a string with the filename of a batch file,
            optionally followed by its space-separated arguments (argv)
        Output: Puts argv for the current batch file into the global argv,
            replacing any existing argv from a previous batch file.
            Then reads entire file into memory to locate all the labels,
            and passes the lines and labels into execute_lines()
        """
        tokens = line.split(" ", 1)
        if len(tokens) > 1:
            self.VARIABLES["argv"] = tokens[1].split(" ")
        else:
            self.VARIABLES["argv"] = []
        filename = tokens[0]

        LOG.debug(f"\n\n=======\n{filename}\n=======")
        # append this batch file to the callstack if we're on line 0
        if line_number is None:
            line_number = 0
            self.CALLSTACK.append([filename, line_number])

        # get batch file contents
        lines = get_textfile_lines(filename)

        # find labels and register their line numbers
        labels = find_labels(lines)

        self.execute_lines(lines, labels, line_number)
        self.CALLSTACK.pop_()

    def execute_lines(self, lines, labels=None, line_number=0):
        """
        Executes a list of lines by splitting each line on its first space character,
        finding the matching token_interpreter for the first word and passing the rest
        of the line to that interpreter method. If a GOTO is encountered, the label
        should be a key in the labels dict which has the line-number as a value.

        Updates the line number of the last item in self.CALLSTACK during execution
        if `labels` is defined, which means a batch file is being executed
        """
        line = None
        while True:
            if line is None:
                try:
                    line = lines[line_number]
                except IndexError:
                    # reached end of file
                    break

            # update line number in callstack, if executing a batch file
            if labels:
                self.CALLSTACK[-1][1] = line_number

            if line.startswith(":"):
                line_number += 1
                line = None
                continue
            elif line.startswith("goto"):
                try:
                    line_number = labels[self.expand_variables(line[5:]).lower()]
                except (KeyError, TypeError) as e:
                    LOG.warning(f"<Failed to goto nonexistent label {e}>")
                    line_number += 1
                line = None
                continue
            else:
                # execute current line
                line = self.parse_line(line)
                if line is not None:
                    # should be for line flow control
                    assert line.startswith("goto")
                    continue
                else:
                    line_number += 1

    def expand_variables(self, line):
        """
        Replaces %variable_name% with self.VARIABLES[variable_name]
        Replaces %%1 with self.VARIABLES["argv"][1]
        If the value doesn't exist, replaces %variable_name% with nothing
        """
        if type(line) is not str:
            return line
        line = line.replace("%random%", str(random.randint(0, 32767)))
        line = line.replace("^", "")  # ^ is the escape char for batch files
        if "%" not in line:
            return line
        elif "%" not in line[line.index("%") + 1 :]:
            # % appears without appearing a second time, which is how argv gets used
            arg_num = line[line.index("%") + 1]
            try:
                replaced_text = str(self.VARIABLES["argv"][int(arg_num) - 1])
            except IndexError:
                replaced_text = ""
            line = line.replace(f"%{arg_num}", replaced_text)
            return self.expand_variables(line)

        # if % appears twice then expand the variable between those symbols
        start = line.index("%")
        end = line[start + 1 :].index("%") + start + 1
        if end == start + 1:
            return line
        try:
            var_name = f"{line[start+1:end]}"
            char_limit = 32767
            if ":~0," in var_name:
                var_name, char_limit = var_name.split(":~0,")
            return self.expand_variables(
                f"{line[:start]}{str(self.VARIABLES[var_name])[:int(char_limit)]}{line[end+1:]}"
            )
        except KeyError:
            LOG.warning(f'<Unrecognized variable expansion: "{var_name}">')
            return self.expand_variables(f"{line[:start]}{line[end+1:]}")

    def set_variable_using_math(self, line):
        if " %% " in line:
            first, second = line.split(" %% ")
            return int(first) % int(second)
        else:
            return eval(line)

    def set_variable(self, line):
        """
        Without flags, sets a variable in the self.VARIABLES dict
        With /a flag, sets the variable using math (addition, modulo, etc)
        With /p flag, sets variable to user input using self.line_input()
        """
        variable, value = line.split("=")
        if variable.startswith("/p"):
            variable = variable[3:]
            new_value = self.line_input(value)
            if new_value:
                value = new_value
            else:
                return
        elif variable.startswith("/a"):
            variable = variable[3:]
            if variable.endswith("+"):
                self.VARIABLES[variable[:-1]] += int(self.expand_variables(value))
                return
            elif variable.endswith("-"):
                self.VARIABLES[variable[:-1]] -= int(self.expand_variables(value))
                return
            else:
                value = self.set_variable_using_math(self.expand_variables(value))
            value = self.expand_variables(value)
        try:
            self.VARIABLES[variable] = int(value)
        except ValueError:
            self.VARIABLES[variable] = self.expand_variables(value)

    def for_loop(self, line):
        """
        Skeleton interpreter for handling Funtimes load.bat specifically
        Iterates over lines in an input file and runs the statements inside
        """
        line = line.split(" ", 4)
        filename = line[3][1:-1]
        statement = line[4]
        if statement.startswith("do "):
            statement = statement[3:]
        with self.redirection_target.read(filename) as input_file:
            for line in input_file:
                self.parse_line(statement.replace("%%a", line.strip()))

    def parse_line(self, line, extra_line=""):
        """
        Recursively parses a line until it becomes None or a goto is encountered
        extra_line will hold the rest of the line remaining to be parsed
        """
        if line is None:
            return
        LOG.debug(str(line))

        # An if statement implicitly has an extra_line & always returns here
        # otherwise we have to split the line up now into the main part & extra
        if not line.startswith("if "):
            lines = line.split(" & ", 1)
            if len(lines) > 1:
                extra_line = lines[1]
            line = lines[0]
        tokens = line.split(" ", 1)
        if tokens[0] == "goto":
            # return to the call_bat function to change line_number
            return line
        try:
            func = self.token_interpreters[tokens[0]]
            if len(tokens) > 1:
                if extra_line == "":
                    return self.parse_line(func(tokens[1]))
                else:
                    furthermore = self.parse_line(func(tokens[1]))
                    if furthermore is None:
                        return self.parse_line(extra_line)
                    else:
                        return self.parse_line(furthermore, extra_line)
            else:
                return func()
        except KeyError:
            LOG.error(f'<Unrecognized line: "{tokens}">')
