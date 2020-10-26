# Batchfile.py
A Python library to execute simple batch files (.bat) that would normally only work on Windows. After installing, you can get a REPL (live commandline) to test by running `python3 -m batchfile`

When I was in high school I used to write text adventure games using Windows batch files. In October 2020 I wrote a Python script to interpret the batch files. This is a fun experiment to see if I can get unaltered original batch file games to play on Ubuntu using Python without introducing too much complexity.

See my [bat2web](https://github.com/tassaron2/bat2web) repo for an example of how you can use this library to turn a batch file into a website. Something you've always wanted to do, surely :)

# How to play
* Install library by running `pip install .` in the same folder as the `setup.py` file.
* Go in the `/games` directory for python scripts that will launch games.
* So far the only supported game is one I wrote when I was 16, which you can play by running `funtimes.py` using Python 3.6+ on Linux, Windows, or MacOS.
* On Windows you can also play the original game without Python using `FUNTIMES.bat` inside the funtimes directory
* The original game actually works using `wineconsole` in Ubuntu as well, except for rare math problems
* Funtimes can also be played [in a web browser](http://bat.tassaron.com)

# Running other batch files
I definitely don't intend to support every batch file, but it would be nice if similar batch-file-games worked without introducing too much complexity. Another game I wrote in 2010 called "Recruitment" is included as an example, but it doesn't yet work. Ultimately it would be really cool if this library supported [Time Streamer](https://everything2.com/title/Time+Streamer).

The main obstacle to most games working is the lack of support for parentheses and quotation marks. Some hacky solutions are included to deal with the simple cases in Funtimes, but eventually I have to write a tokenizer/lexer to correctly deal with these complex structures. This should greatly increase compatibility once I do that!

Another obstacle is that a lot of batch files use weird .EXE or .COM files that do various tasks, but when I discover these cases I'll try to include them as standard functions. My primary goal is supporting batch file games, so I'm not worried about if something is a "pure" batch file.
