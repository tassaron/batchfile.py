import os
import logging
from subprocess import call as system_call


def make_debug_log():
    try:
        if os.path.exists("debug.log"):
            os.remove("debug.log")
        fh = logging.FileHandler("debug.log")
    except PermissionError:
        fh = logging.StreamHandler()
    fh.setFormatter(
        logging.Formatter("%(relativeCreated)6d %(threadName)s %(message)s")
    )
    log = logging.getLogger(__package__)
    log.addHandler(fh)
    log.setLevel(logging.INFO)
    return log


if os.name == "nt":

    def clear_console():
        system_call("cls", shell=True)

else:

    def clear_console():
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


def get_textfile_lines(filename):
    with open(find_sensitive_path(filename), "r") as f:
        return [line.strip() for line in f]


def find_labels(lines):
    labels = {}
    current_line = 0
    line = None
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
    return labels
