:start
cls
echo You're outside your house. The fresh air burns your delicate skin.
echo Down the street is %ryan%'s house. Across the road is the mall.
if %bike%==1 goto havebike
echo Since you don't have a bike, you'll have to walk everywhere.
goto choice1
:havebike
echo You have a bike, so travelling will be a breeze.
goto choice2
:choice1
echo.
echo a - Go back inside.
echo b - Walk down the street.
echo c - Head to the mall.
echo d - Creep down the dark alleyway.
echo.
goto choice
:choice2
echo.
echo a - Go back inside.
echo b - Ride down the street.
echo c - Head to the mall.
echo d - Creep down the dark alleyway.
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
echo You walk back into the living room of your house.
echo.
pause
call livingroom.bat
:b
cls
if %bike%==1 goto b1
if %energy% GEQ 3 goto b0a
:b0
echo You don't have enough energy. Go rest first.
echo.
pause
goto start
:b0a
echo You walk down the street.
echo.
pause
set /a energy-=3
call street.bat
:b1
if %energy% GEQ 1 goto b1a
goto b0
:b1a
echo You jump on your bike and ride down the street.
echo.
pause
set /a energy-=1
call street.bat
:c
cls
if %bike%==1 goto c1
if %energy% GEQ 5 goto c0a
:c0
echo You don't have enough energy. Go rest first.
echo.
pause
goto start
:c0a
echo You walk to the mall.
echo.
pause
set /a energy-=5
call carpark.bat
:c1
if %energy% GEQ 1 goto c1a
goto c0
:c1a
echo You jump on your bike and ride to the mall.
echo.
pause
set /a energy-=1
call carpark.bat
:d
cls
echo Throwing caution to the wind, you creep down the creepy alley between
echo your house and the neighbour's. What could possibly go wrong?
echo.
pause
call alley.bat
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start