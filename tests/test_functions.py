import os
from batchfile._functions import find_sensitive_path


def test_case_insensitivity():
    basepath = os.path.dirname(__file__) + os.path.sep
    assert find_sensitive_path("TeST.bAt", dir=basepath) == f"{basepath}test.bat"