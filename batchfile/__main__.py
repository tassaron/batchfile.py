import sys
import logging
import os
from .batchfile import Batchfile

log = logging.getLogger(__package__)
log.setLevel(logging.INFO)
handler = logging.StreamHandler(sys.stdout)
formatter = logging.Formatter("%(message)s")
handler.setFormatter(formatter)
log.addHandler(handler)

bat = Batchfile()

if len(sys.argv) > 1:
    bat.run(sys.argv)

print("\nBatchfile.py REPL")
print("Type EXIT to quit, or use Ctrl+C")
while True:
    print(f"{os.getcwd()}> ", end="")
    try:
        ch = input().strip().lower()
        if ch == "exit":
            break
        try:
            bat.run(ch)
        except (EOFError, KeyboardInterrupt):
            raise
        except Exception as e:
            print(f'<Fatal error: "{e}">')
    except (EOFError, KeyboardInterrupt):
        break
