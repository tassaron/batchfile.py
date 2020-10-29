import sys
import logging
import os
from .batchfile import Batchfile, QuitProgram


def main_loop(loops=-1, bat=None):
    log = logging.getLogger(__package__)
    log.setLevel(logging.INFO)
    handler = logging.StreamHandler(sys.stdout)
    formatter = logging.Formatter("%(message)s")
    handler.setFormatter(formatter)
    log.addHandler(handler)

    bat = bat if bat is not None else Batchfile()

    if len(sys.argv) > 1:
        bat.run(sys.argv)

    print("\nBatchfile.py")
    print("Type EXIT to quit, or use Ctrl+C")
    
    while loops != 0:
        try:
            ch = bat.line_input(f"{os.getcwd()}>")
            if ch == "exit":
                break
            try:
                bat.run(ch)
            except (EOFError, KeyboardInterrupt):
                raise
            except Exception as e:
                print(f'<{type(e).__name__}: "{e}">')
        except (EOFError, KeyboardInterrupt, QuitProgram):
            break
        loops -= 1


if __name__ == "__main__":
    main_loop()