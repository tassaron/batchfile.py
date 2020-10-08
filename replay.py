"""
Replay a sequence of inputs to batchfile.py
"""

import batchfile
from time import sleep
import sys


i = 0


def auto_input(line=""):
    global i
    try:
        action = actions[i]
        print(line, end="")
        sys.stdout.flush()
        sleep(0.5)
    except IndexError:
        action = "[Replay Finished] "
    print(action, end="")
    sys.stdout.flush()
    sleep(0.5)
    i += 1
    if len(actions) < i:
        bat.WAIT_FOR_STDIN = False
        return ""
    else:
        return actions[i - 1]


def run(actions_, *args):
    global actions
    global bat
    actions = actions_
    bat = batchfile.Batchfile(stdin=auto_input)
    bat.run("funtimes", "funtimes.bat")
    