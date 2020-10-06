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


def get_line(line="", end="\n"):
    page.append(f"{line}{end}")


def send_input(line=""):
    page.complete()
    print(line)
    return input()


page = Page()
batchfile.line_input = send_input
batchfile.write_to_stdout = get_line
batchfile.run("funtimes", "funtimes.bat")
