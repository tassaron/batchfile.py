"""
Replay a sequence of inputs to batchfile.py
"""

from .batchfile import Batchfile
from time import sleep
import sys
from typing import Tuple
from functools import partial


class Replay(Batchfile):
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
        super().__init__(stdin=self.auto_input, stdout=stdout, redirection=redirection)
        self.replay_actions = actions
        self.replay_stdin = stdin
        self.sleep = (
            partial(sleep, sleep_duration) if sleep_duration != 0 else lambda: None
        )
        self.replay_i = 0

    def auto_input(self, line=""):
        try:
            action = self.replay_actions[self.replay_i]
            if self.SILENCE_STDOUT:
                self.stdout.append(line)
            else:
                print(line, end="")
                sys.stdout.flush()
            self.sleep()
        except IndexError:
            action = "[Replay Finished] "
        if not self.SILENCE_STDOUT:
            print(action, end="")
            sys.stdout.flush()
        sleep(0.5)
        self.replay_i += 1
        if len(self.replay_actions) < self.replay_i:
            if self.replay_stdin == True:
                self.WAIT_FOR_STDIN = False
            elif self.replay_stdin is not None:
                self.stdin = self.replay_stdin
                self.WAIT_FOR_STDIN = True
            return ""
        else:
            return self.replay_actions[self.replay_i - 1]
