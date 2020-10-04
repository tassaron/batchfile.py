:start
cls
echo You're on the Yudia website. You run this website with %ryan%.
if %posts%==1 echo You have %posts% post on the forum.
if not %posts%==1 echo You have %posts% posts on the forum.
echo.
echo a - Post on the forum.
echo b - Leave Yudia.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
call post.bat
goto start
:b
cls
echo You ditch your website.
echo.
pause
call web.bat
:stats
call stats.bat
goto start
:save
call save.bat
goto start