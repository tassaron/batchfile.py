:start
cls
echo You're in the construction lot near %katie%'s house. It looks
echo like the workers are working on the foundation of some building.
if %wrench%==1 goto options
echo There's a wrench lying on the ground next to one of the workers.
:options
echo.
echo a - Leave the construction lot.
echo b - Talk to one of the workers.
echo c - Ask if you can help out.
if %wrench%==1 goto options1
echo d - Grab the wrench.
:options1
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
echo You leave the construction lot.
echo.
pause
goto end
:b

:c

:d
if %wrench%==1 goto choice
if %energy% LEQ 0 goto dff
cls
echo You go to grab the wrench. That oughta come in handy!
echo Just as you get your hands around it, a construction worker spots you.
echo "Oi!" he yells. "That's my wrench!"
echo.
pause
call fight.bat 5
if %hp% LEQ 0 goto df
cls
echo The construction worker tumbles backwards, falling onto the wrench.
echo With great effort, you manage to lift his bulky frame enough to grab it.
ctext.exe "{D6}"
echo You got a wrench!
ctext.exe "{D0}"
echo.
pause
set wrench=1
goto start
:dff
cls
echo That wrench looks awfully heavy. You're too tired to grab it.
echo.
pause
goto start
:df
cls
echo You fall over backwards, completely exhausted. The construction
echo worker brushes the dirt off his hands.
echo "Stay outta here, kid!" he yells.
echo.
pause
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end