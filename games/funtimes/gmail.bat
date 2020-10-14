:start
cls
echo You're on Gmail, the free email service Google uses to spy on you.
echo There's way more storage space than necessary, so don't delete.
echo.
echo a - Check your inbox.
echo b - Check thank-you emails.
echo c - Leave Gmail.
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
cls
echo You check your inbox, excluding thank-you emails.
echo.
pause
cls
echo Nothing comes up.
echo.
pause
goto start
:b
cls
echo You do a search for emails filed under "thanks".
echo.
pause
if %bumbled%==1 goto thanks
cls
echo No emails exist. What an anticlimax!
echo.
pause
goto start
:thanks
cls
echo The bun from your kitchen sent you an email.
if %shiftyy%==1 echo The shifty guy from Metro sent you an email.
if %robquestt%==1 echo The teenager who helped you rob Mac's sent you an email.
if %bike%==1 echo The girl you bought your bike from sent you an email.
echo.
pause
goto start
:c
cls
echo You leave Gmail in the digital dust.
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