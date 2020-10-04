:start
cls
echo You are standing in your bedroom. Sun streams through the window behind you.
echo To your left is a bed for you to rest in. To your right is your computer.
if not %love%==4 echo You have a cordless phone in here, too.
if %love%==4 echo Your cordless phone is ringing.
echo.
echo a - Go on computer.
if not %love%==4 echo b - Use the phone.
if %love%==4 echo b - Pick up the phone.
echo c - Rest in bed.
echo d - Leave bedroom.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="d" goto d
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
if /i "%choice%"=="debug" goto debug
goto choice
:a
cls
echo You sit down in front of your computer and log in.
echo.
pause
call computer.bat
:b
cls
echo You grab the cordless phone.
echo.
pause
call phone.bat
goto start
:c
if %energy% GEQ 15 goto c2
cls
echo You lie down in your bed for a nap.
echo.
pause
call rest.bat
:c2
cls
echo You're not tired!
echo.
pause
goto start
:d
cls
echo You leave the bedroom and head out into the hallway.
echo.
pause
call hallway.bat
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:debug
set /p choice=What do you want to do? 
if /i %choice%==grace goto debug2
goto choice
:debug2
set /p choice=What do you want to do? 
if /i %choice%==hopper goto debug3
goto choice
:debug3
call debug.bat
goto choice
:end