"""
Automatically starts a new game of FUNTIMES.bat
"""
from batchfile.replay import Replay


actions = [
    "a",
    "a",
    " ",
    " ",
    "Brianna",
    "Tassaron",
    " ",
    "a",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    "Muffin",
    " ",
    " ",
    " ",
]

replay = Replay(actions)
replay.run(["cd funtimes", "call funtimes.bat"])
