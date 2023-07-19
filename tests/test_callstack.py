import os
import batchfile
from batchfile.replay import Replay


def test_callstack():
    bat = batchfile.Batchfile(stdout=[])
    bat.chdir(os.path.dirname(__file__))

    recorded_callstack = []

    real_pop = bat.CALLSTACK.pop_

    def fake_pop():
        filename, lineno = real_pop()
        recorded_callstack.append([filename, lineno])

    bat.CALLSTACK.pop_ = fake_pop
    bat.run(["call test_callstack.bat"])

    # callstack here is backwards since it's recorded in order of being removed...
    assert recorded_callstack == [["test.bat", 6], ["test_callstack.bat", 4]]
