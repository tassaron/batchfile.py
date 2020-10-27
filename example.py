"""
Example of advanced batchfile module usage where the stdout is captured,
and the state is initialized with a Replay() and then set to a callback
"""
from batchfile import Batchfile
from batchfile.replay import Replay


class Page:
    def __init__(self):
        self.page = []

    def append(self, line):
        self.page.append(line)
        print(line, end="")

    def send_input(self, line=""):
        # newline counts as the enter key here
        return f"{input()}\n"

    def clear(self):
        self.page.clear()


def main():
    actions = (
        "a",
        "a",
        " ",
        " ",
        "Brianna",
    )
    page = Page()
    bat = Replay(
        actions=actions,
        sleep_duration=0.5,
        stdin=page.send_input,
        stdout=page,
    )
    bat.run(["cd games/funtimes", "call funtimes.bat"])


main()
