"""
Replay a sequence of inputs to batchfile.py
"""

import batchfile
from time import sleep
import sys


class Replay:
    def __init__(self, actions):
        self.bat = batchfile.Batchfile(stdin=self.auto_input)
        self.actions = actions
        self.i = 0

    def auto_input(self, line=""):
        try:
            action = self.actions[self.i]
            print(line, end="")
            sys.stdout.flush()
            sleep(0.5)
        except IndexError:
            action = "[Replay Finished] "
        print(action, end="")
        sys.stdout.flush()
        sleep(0.5)
        self.i += 1
        if len(self.actions) < self.i:
            self.bat.WAIT_FOR_STDIN = False
            return ""
        else:
            return self.actions[self.i - 1]

    def run(self, lines):
        self.bat.run(lines)
