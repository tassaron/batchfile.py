import pytest
from batchfile import Batchfile
from batchfile.replay import Replay


@pytest.fixture
def bat_with_variables():
    bat = Batchfile(stdout=[])
    bat.run("set test=1")
    yield bat


def test_set_variable():
    bat = Batchfile()
    bat.run("set test=1")
    assert bat.VARIABLES["test"] == 1


def test_set_p_variable():
    replay = Replay(("test string\n",), stdin=None)
    replay.run("set /p test=")
    assert replay.bat.VARIABLES["test"] == "test string"


def test_conditional_expr(bat_with_variables):
    bat_with_variables.run("if %test%==1 echo success")
    assert bat_with_variables.stdout == ["success\n"]


def test_random():
    bat = Batchfile(stdout=[])
    for i in range(3):
        bat.run("echo %random%")
    assert len(set(bat.stdout)) > 1
