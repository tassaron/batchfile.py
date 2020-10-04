:start
cls
echo There are millions of websites to visit, but only some of them are useful.
echo. 
echo a - Yudia
echo b - Gmail
echo c - Wikipedia
echo d - Exit web browser.
echo.
:choice
set /p choice=Where do you want to go? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="d" goto d
if "%choice%"=="www.ryanandbran.com" goto rab
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
cls
echo You go to the website you run with %ryan%.
echo.
pause
call rab.bat
goto start
:b
cls
echo You log in to Gmail.
echo.
pause
call gmail.bat
goto start
:d
cls
echo You close your web browser and return to the desktop.
echo.
pause
call computer.bat
:c
cls
echo You go to Wikipedia.
echo.
pause
call wikipedia.bat
goto start
:rab
if %rab%==1 goto choice
cls
echo You go to www.ryanandbran.com
echo ...wait, what? Well, looks like you found a secret.
echo.
pause
set rab=1
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start