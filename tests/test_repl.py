from batchfile.__main__ import main_loop
from batchfile.replay import Replay
from batchfile import PauseProgram
from pytest import raises
import os


def test_stdin_repl():
    actions = ["set /p input=test", "cat", "echo test%input%"]
    replay = Replay(actions, stdout=[])
    main_loop(2, replay)
    assert replay.stdout[6] == "testcat\n"


def test_call_from_repl():
    actions = ["call test.bat"]
    replay = Replay(actions, stdout=[])
    replay.chdir(os.path.dirname(__file__))
    main_loop(1, replay)
    assert replay.stdout[2] == "This should be 50: 50\n"


def test_pause_exception_occurs():
    actions = [""]
    replay = Replay(actions, stdout=[])
    replay.chdir(os.path.dirname(__file__))
    with raises(PauseProgram):
        main_loop(1, replay)
