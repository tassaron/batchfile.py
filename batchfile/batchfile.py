import sys
import os
import glob
import random
import logging
from subprocess import call as system_call


def make_debug_log():
    if os.path.exists("debug.log"):
        try:
            os.remove("debug.log")
        except PermissionError:
            pass
    fh = logging.FileHandler("debug.log")
    fh.setFormatter(
        logging.Formatter("%(relativeCreated)6d %(threadName)s %(message)s")
    )
    log = logging.getLogger(__name__)
    log.addHandler(fh)
    log.setLevel(logging.INFO)
    return log


LOG = make_debug_log()


class QuitProgram(Exception):
    ...


if os.name == "nt":

    def clear():
        system_call("cls", shell=True)


else:

    def clear():
        system_call("clear", shell=True)


def find_sensitive_path(insensitive_path, dir=None):
    """
    Borrowed from https://stackoverflow.com/a/37708342
    Returns a case-sensitive filepath when given a case-insensitive path
    """
    if dir is None:
        dir = os.getcwd()
    insensitive_path = insensitive_path.strip(os.path.sep)

    parts = insensitive_path.split(os.path.sep)
    next_name = parts[0]
    for name in os.listdir(dir):
        if next_name.lower() == name.lower():
            improved_path = os.path.join(dir, name)
            if len(parts) == 1:
                return improved_path
            else:
                return find_sensitive_path(os.path.sep.join(parts[1:]), improved_path)
    # os.path.exists returns False when given an empty string, so...
    return ""


def strip_quotes(line):
    try:
        if line.startswith('"'):
            return line[1:-1]
    except AttributeError:
        pass
    return line


def nothing(*args):
    pass


class Batchfile:
    def __init__(self, stdin=None, stdout=None):
        """
        stdin can be set to a callback which triggers when input is requested
        """
        self.SILENCE_STDOUT = False
        if stdout is not None:
            self.SILENCE_STDOUT = True
            self.stdout = stdout

        self._WAIT_FOR_STDIN = False
        if stdin is None:
            self.WAIT_FOR_STDIN = False
        else:
            self.WAIT_FOR_STDIN = True
            self.stdin = stdin

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
        }
        self.VARIABLES = {}

    @property
    def WAIT_FOR_STDIN(self):
        return self._WAIT_FOR_STDIN

    @WAIT_FOR_STDIN.setter
    def WAIT_FOR_STDIN(self, new_value):
        if new_value == False:
            self.stdin = open(0)
        self._WAIT_FOR_STDIN = new_value

    def clear(self):
        if self.SILENCE_STDOUT:
            self.stdout.clear()
        else:
            clear()

    def run(self, dir, entrypoint):
        os.chdir(dir)
        try:
            self.call_bat(entrypoint)
        except QuitProgram:
            pass
        if not self.WAIT_FOR_STDIN:
            self.stdin.close()

    def line_output(self, line="", end="\n"):
        text = f"{line}{end}"
        if self.SILENCE_STDOUT:
            self.stdout.append(text)
            return
        sys.stdout.write(text)
        sys.stdout.flush()

    def line_input(self, line=""):
        line = line.replace("%", "")
        line = line.replace("^", "")
        self.line_output(line, end=" ")
        try:
            while self.WAIT_FOR_STDIN:
                response = self.stdin()
                if response == "":
                    continue
                return f"{response}\n".strip()
            return self.stdin.readline().strip()
        except (KeyboardInterrupt, EOFError):
            raise QuitProgram

    def delete_file(self, line):
        files = glob.glob(line)
        for item in files:
            os.remove(item)

    def move_file(self, line):
        orig, new = line.split(" ")
        orig = glob.glob(orig)
        dest = new
        for item in orig:
            if new.startswith("*"):
                dest = f"{item}{new[1:]}"
            os.rename(orig, dest)

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
                value = os.path.exists(find_sensitive_path(filename))
            else:
                raise NotImplementedError("i can't handle that if statement")
        if not positive:
            value = not value
        if value:
            if statement.startswith("if "):
                return self.conditional_expr(statement[3:])
            return statement

    def echo(self, text):
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
            with open(text[1].strip(), "w") as output:
                output.write(f"{text[0]}\n")
        elif len(text) == 3:
            # >> appends to an existing file
            with open(text[2], "a") as output:
                output.write(f"{text[0]}\n")

    def colour_print(self, text):
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

    def call_bat(self, line):
        tokens = line.split(" ", 1)
        if len(tokens) > 1:
            self.VARIABLES["argv"] = tokens[1].split(" ")
        else:
            self.VARIABLES["argv"] = []
        filename = tokens[0]
        LOG.info(f"\n\n=======\n{filename}\n=======")
        # put all lines of the file into memory
        with open(find_sensitive_path(filename), "r") as f:
            lines = [line.strip() for line in f]

        labels = {}
        current_line = 0
        line = None
        # register all the line numbers for the labels
        while True:
            try:
                line = lines[current_line]
            except IndexError:
                break
            if line.startswith(":"):
                if line.startswith("::"):
                    current_line += 1
                    continue
                labels[line[1:].lower()] = current_line
            current_line += 1

        current_line = 0
        line = None
        # execute everything that isn't a label
        while True:
            if line is None:
                try:
                    line = lines[current_line]
                except IndexError:
                    break
            if line.startswith(":"):
                current_line += 1
                line = None
                continue
            elif line.startswith("goto"):
                try:
                    current_line = labels[self.expand_variables(line[5:]).lower()]
                except KeyError as e:
                    LOG.warning(f"<Failed to goto nonexistent label {e}>")
                    current_line += 1
                line = None
                continue
            else:
                line = self.parse_line(line)
                if line is not None:
                    # should be for line flow control
                    assert line.startswith("goto")
                    continue
                else:
                    current_line += 1

    def expand_variables(self, line):
        if type(line) is not str:
            return line
        line = line.replace("%random%", str(random.randint(0, 32767)))
        line = line.replace("^", "")  # ^ is the escape char for batch files
        if "%" not in line:
            return line
        elif "%" not in line[line.index("%") + 1 :]:
            # % appears without appearing a second time, which is how argv gets used
            arg_num = line[line.index("%") + 1]
            line = line.replace(
                f"%{arg_num}", str(self.VARIABLES["argv"][int(arg_num) - 1])
            )
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
            elif variable.endswith("-"):
                self.VARIABLES[variable[:-1]] -= int(self.expand_variables(value))
            else:
                value = self.set_variable_using_math(self.expand_variables(value))
            value = self.expand_variables(value)
        try:
            self.VARIABLES[variable] = int(value)
        except ValueError:
            self.VARIABLES[variable] = self.expand_variables(value)

    def for_loop(self, line):
        line = line.split(" ", 4)
        filename = line[3][1:-1]
        statement = line[4]
        if statement.startswith("do "):
            statement = statement[3:]
        with open(find_sensitive_path(filename), "r") as input_file:
            for line in input_file:
                self.parse_line(statement.replace("%%a", line.strip()))

    def parse_line(self, line, extra_line=""):
        if line is None:
            return
        LOG.info(str(line))
        if not line.startswith("if "):
            lines = line.split(" & ", 1)
            if len(lines) > 1:
                extra_line = lines[1]
            line = lines[0]
        tokens = line.split(" ", 1)
        if tokens[0] == "goto":
            # return to the call_bat function to change current_line
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
