# How to cheat in FUNTIMES
* Unfortunately there isn't enough money in the game to get everything without cheating.
* **Start the game with $500**: use `Harry` as your first name and `Potter` as your last name
* **Enter secret invisible debug menu**: in the bedroom, type `debug`, then `grace`, then `hopper`. The game will react as if you're making invalid selections but you will actually be inside the debug menu after these commands.
 * **Change any character stat**: in the debug menu, type `weet`, `money`, `str`, `int`, `cha`, or `dex` and press enter to choose which value to increase, then type a number and press enter.
 * **Fight unfinished enemies**: in the debug menu, type `lion` or `clone`. The lion is a drug-induced hallucination so it's a bit weird, and the clone has your character's stats.
 * **Teleport to unfinished area**: in the debug menu, type `cyard` to teleport to the construction yard. Here you can fight a worker to get the wrench for fixing the slushie machine. The wrench is a finished item you can use anywhere.

# Differences from original game
* You must press ENTER to proceed instead of any key. I might change this later.
* Ctrl+C or Ctrl+D exits the game cleanly
* I haven't yet implemented any colours. I might do that later.

# Binaries within original game
The `ctext.exe` file remains for compatibility in case you want to run the original game on Windows without Python. It is _not_ used by the Python version whatsoever. However the game files do check to ensure it exists, so you can't delete it. `ctext.exe` is from https://dennisbareis.com/software.htm (incredible that this website is still online!) `FUNTIMES.bat` was originally converted to an exe file using [bat2exe from ComputerHope](https://www.computerhope.com/dutil.htm). I decided to un-convert this back into FUNTIMES.bat because antivirus programs detected it as a trojan.
