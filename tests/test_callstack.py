import os
import batchfile


def test_callstack():
    bat = batchfile.Batchfile(stdout=[])
    bat.chdir(os.path.dirname(__file__))
    bat.CALLSTACK.pop_ = lambda: None
    bat.run(["call test_callstack.bat"])
    assert bat.CALLSTACK == [["test_callstack.bat", 2], ["test.bat", 6]]


def test_callstack_variable():
    """
    Proves that a variable is preserved after resuming the batchfile
    """

    def callback(line=""):
        return "skip"

    bat = batchfile.Batchfile(stdout=[], stdin=callback)
    bat.chdir(os.path.dirname(__file__))
    bat.CALLSTACK.pop_ = lambda: None
    bat.run(["call test_setp.bat"])
    assert len(bat.CALLSTACK) == 5

    # new_bat doesn't need stdin because %junk% variable is already set
    new_bat = batchfile.Batchfile(stdout=[])
    new_bat.resume(bat.CALLSTACK, bat.VARIABLES)
    # resuming now does nothing as we are at the end of the file

    # set loop to 0 so we re-enter the loop at the bottom whilst preserving %junk%
    new_bat.run(["set loop=0", "call test_setp.bat"])
    assert len(new_bat.CALLSTACK) == 10
