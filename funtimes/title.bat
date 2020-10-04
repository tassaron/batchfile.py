@echo off
title FUNTIMES
mode con: cols=80 lines=21
if not exist *.vr1 goto next
ren *.vr1 *.var
:next
if not exist *.vr2 goto start
del *.vr2
if not exist ctext.exe goto error2
:start
cls
ctext "{DF}"
echo   ####### #     # #     # ####### ### #     # #######  #####  
echo   #       #     # ##    #    #     #  ##   ## #       #     # 
echo   #       #     # # #   #    #     #  # # # # #       #       
echo   #####   #     # #  #  #    #     #  #  #  # #####    #####  
echo   #       #     # #   # #    #     #  #     # #             # 
echo   #       #     # #    ##    #     #  #     # #       #     # 
echo   #        #####  #     #    #    ### #     # #######  #####  
echo                      (hope you have fun!)
ctext "{D0}"
echo.
echo a - Start a new game.
echo b - Continue your old game.
echo c - Read the help file.
echo.
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto create
if /i "%choice%"=="b" goto load
:help
cls
echo Most actions are performed by typing A, B, C, or D, then hitting the enter
echo or return key on your keyboard. Some portions of the game may require different
echo commands, as dictated by the instructions that appear in-game. At any point,
echo you can type "stats" to view your character stats and inventory, or type "save"
echo to save the game. YOU MUST SAVE THE GAME IF YOU WANT TO KEEP YOUR PROGRESS.
echo.
pause
goto start
:create
cls
echo Are you sure you want to start a new game?
echo This will overwrite your old file, if you have one.
echo.
echo a - Overwrite!
echo b - Don't.
echo.
:choicecreate
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto create2
if /i "%choice%"=="b" goto start
goto choicecreate
:create2
call create.bat
goto error
:load
call load.bat
goto start
:error
cls
echo Error 567 occured. Report this to Bran immediately.
echo.
pause >nul
exit
:error2
cls
echo Key files are missing from the source directory. Try downloading and
echo running the game again.
echo.
pause >nul
exit
:end