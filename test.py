"""
Run on Windows to compare outputs
"""
import batchfile
import subprocess


class Page:
    def __init__(self):
        self.page = []

    def append(self, line):
        self.page.append(line)

    def get_line(self, line="", end="\n"):
        self.append(f"{line}{end}")

    def finish_page(self, line=""):
        raise batchfile.QuitProgram


TEST_PAGE = Page()
batchfile.line_input = lambda line: TEST_PAGE.finish_page(line)
batchfile.write_to_stdout = lambda line, end="\n": TEST_PAGE.get_line(line, end)


def test():
    cmd_exe = subprocess.Popen("test.bat", stdout=subprocess.PIPE, encoding="utf-8")
    cmd_output, _ = cmd_exe.communicate()
    batchfile.run(".", "test.bat")
    page = "".join(TEST_PAGE.page)
    print("CMD.exe output:")
    print(cmd_output)
    print("batchfile.py output:")
    print(page, end="")
    assert cmd_output == page


if __name__ == "__main__":
    try:
        test()
        print("\nTEST PASSED")
    except AssertionError:
        print("\nTEST FAILED")
