"""
Example of batchfile module usage
"""
import batchfile


class Page:
    def __init__(self):
        self.page = []

    def append(self, line):
        self.page.append(line)

    def complete(self):
        print("".join(self.page))

    def send_input(self, line=""):
        self.complete()
        # newline counts as the enter key here
        return f"{input()}\n"

    def clear(self):
        self.page.clear()


page = Page()
bat = batchfile.Batchfile(stdin=page.send_input, stdout=page)
bat.run(["cd games/funtimes", "call funtimes.bat"])
