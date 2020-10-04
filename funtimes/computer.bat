:start
cls
echo You are at your computer. Your "My Little Pony" desktop is beautiful today.
echo There are thousands of programs on your computer, but only a few of them are
echo useful.
echo.
echo a - Open your web browser.
echo b - Check specs and upgrade the computer.
echo c - Play FUNTIMES.
echo d - Log out and get up.
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
echo You open up your web browser.
echo.
pause
call web.bat
:b
if %energy% LEQ 0 goto bf
call upgrade.bat
goto start
:bf
cls
echo You're too tired to upgrade your computer.
echo.
pause
goto start
:c
if %funweet%==1 goto cf
cls
ctext.exe "{D6}"
echo Very meta. Have a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
set funweet=1
goto start
:cf
cls
echo That game gets boring quickly.
echo.
pause
goto start
:d
cls
echo You log out of your computer and stand up.
echo.
pause
call bedroom.bat
:stats
call stats.bat
goto start
:save
call save.bat
goto start