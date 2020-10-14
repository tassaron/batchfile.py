:start
cls
echo You're in the bathroom. There's not much to do in here.
echo You could take a shower, I guess?
echo.
echo a - Take a shower, you guess.
echo b - Check yourself out in the mirror.
echo c - Get back in the hallway.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
call shower.bat
goto start
:b
cls
echo You take a quick look at yourself in the mirror.
if %man%==boy if %sexy%==0 echo Boys have been uglier, but not by much...
if %man%==stoner if %sexy%==0 echo Your eyes are kind of red.
if %man%==girl if %sexy%==0 echo Girls have been uglier, but not by much...
if %sexy%==1 echo Well, at least you know they like you for your personality...
if %sexy%==2 echo Not too shabby...
if %sexy%==3 echo Who's that %man% looking back? ...That's YOU!
if %sexy%==4 echo %bran% %rainey%: sexiest %man% on Earth.
if %sexy% GEQ 5 echo ERROR 201: Report this to Bran because you shouldn't be this beautiful.
echo.
pause
goto start
:c
cls
echo You retrace your steps into the hallway.
echo.
pause
call hallway.bat
:d
cls
echo Suddenly, a clone of you pops out of nowhere, glowering furiously!
echo You might have to use lethal force...
echo.
pause
call fight.bat 3
if %hp% LEQ 0 goto df
cls
echo Your doppelganger vanishes into a puff of smoke. You wipe some sweat
echo from your brow. What a copycat!
echo.
pause
goto start
:df
cls
echo You collapse backwards, falling against the sink. Your doppelganger
echo crosses his arms, laughing maniacally, before vanishing in a puff of
echo smoke. Talk about sour grapes.
echo.
pause
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start