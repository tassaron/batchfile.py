:start
cls
echo You're at Galaxy, the best movie theatre in town. It's still too early
echo to catch a movie, though.
echo.
echo a - Buy popcorn. ($500)
echo b - Leave.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
if %popcorn%==1 goto aff
if %money% LSS 500 goto af
cls
echo You fork over a ludicrous sum of money in exchange for some delicious
echo popcorn! The clerk looks at you like you're crazy. He's probably right.
echo.
ctext.exe "{D4}"
echo The popcorn costs you $500.
ctext.exe "{D0}"
echo.
pause
set /a money-=500
set popcorn=1
goto start
:af
cls
echo You can't afford to buy popcorn at a movie theatre. Honestly, you doubt
echo that anyone can.
echo.
pause
goto start
:aff
cls
echo I know it's hard to resist at THAT price, but you already have popcorn!
echo.
pause
goto start
:b
cls
echo You leave Galaxy.
echo.
pause
goto end
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end