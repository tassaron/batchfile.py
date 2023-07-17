import os
import batchfile
from batchfile.replay import Replay


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
    # resuming now does nothing as we are at the end of the file
    new_bat.resume_from_serialized_state(bat.CALLSTACK, bat.VARIABLES)
    # set loop to 0 so we re-enter the loop at the bottom whilst preserving %junk%
    new_bat.run(["set loop=0", "call test_setp.bat"])
    assert len(new_bat.CALLSTACK) == 5


def test_popping():
    """
    Proves popping off the callstack to go up the stack works after resuming
    """

    def callback(line=""):
        return "skip"

    recorded_callstack = []

    def fake_pop():
        filename, lineno = real_pop()
        recorded_callstack.append([filename, lineno])

    bat = batchfile.Batchfile(stdout=[], stdin=callback)
    bat.chdir(os.path.dirname(__file__))
    real_pop = bat.CALLSTACK.pop_
    bat.CALLSTACK.pop_ = fake_pop

    bat.run(["call test_setp.bat"])
    new_bat = batchfile.Batchfile(stdout=[])
    bat.VARIABLES["loop"] = 0
    bat.VARIABLES["poptest"] = "true"
    bat.CALLSTACK.append(["test_setp.bat", 0])
    new_bat.resume_from_serialized_state(bat.CALLSTACK, bat.VARIABLES)

    # the original 5 from looping through without popping
    # plus 3 more from re-running while popping twice
    print(recorded_callstack)
    assert len(recorded_callstack) == 8


test_popping()
