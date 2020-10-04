:start
cls
echo You're in the kitchen. It's a real good place to bumble a bun.
echo To your left is the fridge. In front of you is a cookbook.
echo To the right is the oven, stove, microwave, and toaster.
echo.
echo a - Back into the living room.
echo b - Attempt to cook food.
echo c - Read the cookbook.
echo d - Bumble a bun.
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
echo You walk into the living room.
echo.
pause
call livingroom.bat
goto start
:b
if %energy%==0 goto b2
cls
echo You open the fridge to get some food to cook.
echo.
pause
call cook.bat
goto start
:b2
cls
echo You are too tired to cook food.
echo.
pause
goto start
:c
if %energy%==0 goto c2
cls
echo You ruffle through the cookbook, looking at the recipes.
echo.
pause
call cookbook.bat
goto start
:c2
cls
echo You are too tired to read the cookbook.
echo.
pause
goto start
:d
if %energy%==0 goto d3
cls
echo You grab a bun and bumble it like it's never been bumbled before!
echo.
pause
if %bumbled%==1 goto d2
cls
echo "How sweet of you to think of me," says the bun.
ctext.exe "{D6}"
echo For this act of kindness, you receive a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat cha 1
call level.bat dex 1
set bumbled=1
set /a energy-=1
set /a weet+=1
goto start
:d2
cls
echo Your enthusiasm scares the bun slightly.
echo Maybe you should leave it alone.
echo.
pause
set /a energy-=1
goto start
:d3
cls
echo You're way too tired to bumble that bun.
echo.
pause
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start