import os
import batchfile


def test_callstack():
    bat = batchfile.Batchfile(stdout=[])
    bat.chdir(os.path.dirname(__file__))
    bat.CALLSTACK.pop_ = lambda: None
    bat.run(["call test_callstack.bat"])
    assert bat.CALLSTACK == [["test_callstack.bat", 2], ["test.bat", 6]]