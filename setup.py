from setuptools import setup, find_packages
from os import path

try:
    with open(
        path.join(path.abspath(path.dirname(__file__)), "readme.md"), encoding="utf-8"
    ) as f:
        long_description = f.read()
except FileNotFoundError:
    long_description = "No readme.md found"

setup(
    author="tassaron",
    name="batchfile.py",
    packages=find_packages(),
    version=0.6,
    url="https://github.com/tassaron2/batchfile.py",
    license="MIT",
    description="Run Windows batch files (.bat) using Python",
    long_description=long_description,
    long_description_content_type="text/markdown",
    keywords="batchfile batch",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Interpreters",
        "Topic :: Terminals",
        "Topic :: System :: Shells",
        "Topic :: Games/Entertainment",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3.6",
    ],
)
