import sys
import os
import glob
import random
import logging
from subprocess import call as system_call


LOG = logging.getLogger(__name__)
if os.path.exists("debug.log"):
    try:
        os.remove("debug.log")
    except PermissionError:
        pass
LOG.addHandler(logging.FileHandler("debug.log"))
LOG.setLevel(logging.WARNING)
VARIABLES = {}
STDIN = open(0)


class QuitProgram(Exception):
    ...


if os.name == "nt":

    def clear():
        system_call("cls", shell=True)


else:

    def clear():
        system_call("clear", shell=True)


def write_to_stdout(line="", end="\n"):
    sys.stdout.write(f"{line}{end}")
    sys.stdout.flush()


def line_input(line=""):
    try:
        write_to_stdout(line, end=" ")
        return STDIN.readline().strip()
    except (KeyboardInterrupt, EOFError):
        raise QuitProgram


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


def delete_file(line):
    files = glob.glob(line)
    for item in files:
        os.remove(item)


def move_file(line):
    orig, new = line.split(" ")
    orig = glob.glob(orig)
    dest = new
    for item in orig:
        if new.startswith("*"):
            dest = f"{item}{new[1:]}"
        os.rename(orig, dest)


def conditional_math(first, operation, second):
    first = expand_variables(strip_quotes(first))
    second = expand_variables(strip_quotes(second))
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


def conditional_expr(line):
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
            value = conditional_math(first, math_term, second)
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
            return conditional_expr(statement[3:])
        return statement


def echo(text):
    text = text.split(">")
    for i, token in enumerate(text):
        if len(text) - 1 == i:
            break
        # if a token escapes the next token, merge and delete it
        if token.endswith("^"):
            text[i] = f"{token[:-1]}{text[i+1] if text[i+1] else '>'}"
            del text[i + 1]
    text[0] = expand_variables(text[0])
    if len(text) == 1:
        write_to_stdout(text[0])
    elif len(text) == 2:
        # > creates a new file
        with open(text[1].strip(), "w") as output:
            output.write(f"{text[0]}\n")
    elif len(text) == 3:
        # >> appends to an existing file
        with open(text[2], "a") as output:
            output.write(f"{text[0]}\n")


def colour_print(text):
    while "{" in text:
        text = f"{text[:text.index('{')]}{text[text.index('}')+1:]}"
    text = strip_quotes(text)
    if text:
        echo(text)


def pause(*line):
    if line:
        line_input()
    else:
        line_input("Press ENTER to continue . . .")


def call_bat(line):
    tokens = line.split(" ", 1)
    global VARIABLES
    if len(tokens) > 1:
        VARIABLES["argv"] = tokens[1].split(" ")
    else:
        VARIABLES["argv"] = []
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
                current_line = labels[expand_variables(line[5:]).lower()]
            except KeyError as e:
                LOG.warning(f"<Failed to goto nonexistent label {e}>")
                current_line += 1
            line = None
            continue
        else:
            line = parse_line(line)
            if line is not None:
                # should be for line flow control
                assert line.startswith("goto")
                continue
            else:
                current_line += 1


def nothing(*args):
    pass


def get_player_input(text):
    text = text.replace("%", "")
    text = text.replace("^", "")
    return line_input(f"{text} ")


def expand_variables(line):
    global VARIABLES
    if type(line) is not str:
        return line
    line = line.replace("%random%", str(random.randint(0, 32767)))
    line = line.replace("^", "")  # ^ is the escape char for batch files
    if "%" not in line:
        return line
    elif "%" not in line[line.index("%") + 1 :]:
        # % appears without appearing a second time, which is how argv gets used
        arg_num = line[line.index("%") + 1]
        line = line.replace(f"%{arg_num}", str(VARIABLES["argv"][int(arg_num) - 1]))
        return expand_variables(line)

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
        return expand_variables(
            f"{line[:start]}{str(VARIABLES[var_name])[:int(char_limit)]}{line[end+1:]}"
        )
    except KeyError:
        LOG.warning(f'<Unrecognized variable expansion: "{var_name}">')
        return line


def set_variable_using_math(line):
    if " %% " in line:
        first, second = line.split(" %% ")
        return int(first) % int(second)
    else:
        return eval(line)


def set_variable(line):
    global VARIABLES
    variable, value = line.split("=")
    if variable.startswith("/p"):
        variable = variable[3:]
        new_value = get_player_input(value)
        if new_value:
            value = new_value
        else:
            return
    elif variable.startswith("/a"):
        variable = variable[3:]
        if variable.endswith("+"):
            VARIABLES[variable[:-1]] += int(expand_variables(value))
        elif variable.endswith("-"):
            VARIABLES[variable[:-1]] -= int(expand_variables(value))
        else:
            value = set_variable_using_math(expand_variables(value))
        value = expand_variables(value)
    try:
        VARIABLES[variable] = int(value)
    except ValueError:
        VARIABLES[variable] = expand_variables(value)


def for_loop(line):
    line = line.split(" ", 4)
    filename = line[3][1:-1]
    statement = line[4]
    if statement.startswith("do "):
        statement = statement[3:]
    with open(find_sensitive_path(filename), "r") as input_file:
        for line in input_file:
            parse_line(statement.replace("%%a", line.strip()))


token_interpreters = {
    "cls": clear,
    "for": for_loop,
    "del": delete_file,
    "ren": move_file,
    "@echo": nothing,
    "mode": nothing,
    "title": nothing,
    "color": nothing,
    "": nothing,
    "ctext": colour_print,
    "ctext.exe": colour_print,
    "pause": pause,
    "echo": echo,
    "echo.": write_to_stdout,
    "call": call_bat,
    "if": conditional_expr,
    "set": set_variable,
}


def parse_line(line, extra_line=""):
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
        func = token_interpreters[tokens[0]]
        if len(tokens) > 1:
            if extra_line == "":
                return parse_line(func(tokens[1]))
            else:
                furthermore = parse_line(func(tokens[1]))
                if furthermore is None:
                    return parse_line(extra_line)
                else:
                    return parse_line(furthermore, extra_line)
        else:
            return func()
    except KeyError:
        LOG.error(f'<Unrecognized line: "{tokens}">')
    except QuitProgram:
        STDIN.close()
        quit()


def run(dir, entrypoint):
    os.chdir(dir)
    call_bat(entrypoint)
