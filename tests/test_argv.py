import pytest
from batchfile import Batchfile
from batchfile.replay import Replay
import os


def test_bat_with_argv():
    bat = Batchfile(stdout=[])
    bat.chdir(os.path.dirname(__file__))
    bat.run("call test_variables.bat")
    assert bat.stdout == [
        "You want 50% of the good times.\n",
        "You'll accept 100the% great times.\n",
    ]
