:start
cls
echo You're just down the street from your house. %ryan%'s house is around
echo here. Other attractions include a Mac's convenience store and a playground.
echo.
echo a - Visit %ryan%.
echo b - Go into Mac's.
echo c - Check out the playground.
echo d - Head back home.
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
echo You decide to pay %ryan% a visit.
echo.
pause
call friend.bat
goto start
:b
cls
echo You enter Mac's. The bell over the door tings as you do so.
echo.
pause
call macs.bat
goto start
:c
cls
echo You walk to the playground.
echo.
pause
call playground.bat
goto start
:d
cls
if %bike%==1 goto d2
echo You walk back down the street to your house.
echo.
pause
call outside.bat
:d2
echo You hop on your bike and ride back to your house.
echo.
pause
call outside.bat
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end