import os
from ._functions import find_sensitive_path


class TextFileReader:
    def __init__(self, name):
        self.obj = open(find_sensitive_path(name), "r")

    def __enter__(self):
        return self.obj

    def __exit__(self, type, value, traceback):
        self.obj.close()


class TextFileRedirect:
    def create(self, name, text):
        with open(name, "w") as output:
            output.write(f"{text}\n")

    def append(self, name, text):
        with open(name, "a") as output:
            output.write(f"{text}\n")

    def move(self, orig, dest):
        os.rename(orig, dest)

    def remove(self, item):
        os.remove(item)

    def read(self, name):
        return TextFileReader(name)

    def exists(self, name):
        return os.path.exists(find_sensitive_path(name))
