"""
Replay a sequence of inputs to batchfile.py
"""

import batchfile
from time import sleep
import sys
from typing import *
from functools import partial


class Replay:
    """
    Initialize with a tuple of strings to auto-input into a Batchfile instance
    Include a newline at the end of the string to actually "press enter" after input.
    If `resume` is True, input will switch back to stdin (either a callback or real stdin) afterward
    """

    def __init__(self, actions: Tuple[str, ...], resume=True, stdin=None):
        self.bat = batchfile.Batchfile(stdin=self.auto_input)
        self.actions = actions
        self.resume = resume
        self.stdin = stdin
        self.sleep = partial(sleep, 0.5) if self.resume else lambda: None
        self.i = 0

    def auto_input(self, line=""):
        try:
            action = self.actions[self.i]
            print(line, end="")
            sys.stdout.flush()
            self.sleep()
        except IndexError:
            action = "[Replay Finished] "
        print(action, end="")
        sys.stdout.flush()
        sleep(0.5)
        self.i += 1
        if len(self.actions) < self.i:
            if self.resume and self.stdin is not None:
                self.bat.stdin = self.stdin
                self.bat.WAIT_FOR_STDIN = True
            elif self.resume:
                self.bat.WAIT_FOR_STDIN = False
            return ""
        else:
            return self.actions[self.i - 1]

    def run(self, lines):
        self.bat.run(lines)
