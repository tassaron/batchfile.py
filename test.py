"""
Run on Windows to compare outputs
"""
import batchfile
from subprocess import call


div = f"\n[{'-' * 10}]"


print(div)
print("CMD.exe output:", end="")
print(div)
call("test.bat")
print(div)
print("batchfile.py output:", end="")
print(div)
batchfile.run(".", "test.bat")
