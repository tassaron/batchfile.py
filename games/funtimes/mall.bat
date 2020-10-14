:start
if %meetgirl%==1 goto meetgirl
:starta
cls
echo You're at the mall. There are a lot of things to buy here, if you have the
echo money. Near you is Metro and Pizza Pizza. There are more shops if you keep
echo walking down this corridor.
echo.
echo a - Keep walking down this corridor.
echo b - Go to Metro. (supermarket)
echo c - Go to Pizza Pizza. (restaurant)
echo d - Leave the mall.
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
echo You walk through the front of the mall.
echo.
pause
goto start2
:b
cls
echo You walk into Metro.
echo.
pause
call metro.bat
goto start
:c
cls
echo You stroll into Pizza Pizza.
echo.
pause
call pizza.bat
goto start
:d
cls
echo You go back to the parking lot.
echo.
pause
call carpark.bat
:meetgirl
if %metgirl%==1 goto starta
call meeting.bat
goto starta
:start2
cls
echo You're in the back of the mall. There are a lot of things to buy here, if you
echo have the money. Near you is The Source, Galaxy, and an Ammu-Nation.
echo.
echo a - Go to The Source. (electronics)
echo b - Go to Galaxy. (theatre)
echo c - Go to Ammu-Nation. (guns)
echo d - Walk back to the front of the mall.
echo.
:choice2
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a2
if /i "%choice%"=="b" goto b2
if /i "%choice%"=="c" goto c2
if /i "%choice%"=="d" goto d2
if /i "%choice%"=="stats" goto stats2
if /i "%choice%"=="save" goto save2
goto choice2
:a2
cls
echo You walk into the Source.
echo.
pause
call source.bat
goto start2
:b2
cls
echo You enter Galaxy Cinemas.
echo.
pause
call galaxy.bat
goto start2
:c2
cls
echo You decide to check out the gun shop. I didn't know there were gun shops
echo in whatever country this is!
echo.
pause
call guns.bat
goto start2
:d2
cls
echo You walk back to the front of the mall.
echo.
pause
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:stats1
call stats.bat
goto start1
:save1
call save.bat
goto start1
:stats2
call stats.bat
goto start2
:save2
call save.bat
goto start2