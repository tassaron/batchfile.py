:start
cls
if %fixedtv%==1 goto fixedtv
echo You're in the living room. The TV is broken.
goto main
:fixedtv
echo You're in the living room. The TV is on, playing some show.
:main
echo From here you can head into the kitchen or outside.
echo.
echo a - Back into the hallway.
echo b - Go to the kitchen.
echo c - Leave the house to venture outdoors.
if %fixedtv%==1 goto watchtv
echo d - Attempt to repair the TV.
echo.
goto choice
:watchtv
echo d - Watch some quality television.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="d" goto d
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
cls
echo You backtrack into the hallway.
echo.
pause
call hallway.bat
goto end
:b
cls
echo You walk into your kitchen.
echo.
pause
call kitchen.bat
goto start
:c
cls
echo You put on a jacket and head outside.
echo.
pause
call outside.bat
goto start
:d
if %fixedtv%==1 goto watchtv2
call fixtv.bat
goto start
:watchtv2
call watchtv.bat
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end