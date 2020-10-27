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

    def __init__(
        self,
        actions: Tuple[str, ...],
        sleep_duration=0,
        stdin=True,
        stdout=None,
        redirection=None,
    ):
        self.bat = batchfile.Batchfile(
            stdin=self.auto_input, stdout=stdout, redirection=redirection
        )
        self.actions = actions
        self.stdin = stdin
        self.sleep = (
            partial(sleep, sleep_duration) if sleep_duration != 0 else lambda: None
        )
        self.i = 0

    def auto_input(self, line=""):
        try:
            action = self.actions[self.i]
            if self.bat.SILENCE_STDOUT:
                self.bat.stdout.append(line)
            else:
                print(line, end="")
                sys.stdout.flush()
            self.sleep()
        except IndexError:
            action = "[Replay Finished] "
        if not self.bat.SILENCE_STDOUT:
            print(action, end="")
            sys.stdout.flush()
        sleep(0.5)
        self.i += 1
        if len(self.actions) < self.i:
            if self.stdin == True:
                self.bat.WAIT_FOR_STDIN = False
            elif self.stdin is not None:
                self.bat.stdin = self.stdin
                self.bat.WAIT_FOR_STDIN = True
            return ""
        else:
            return self.actions[self.i - 1]

    def run(self, lines):
        self.bat.run(lines)
