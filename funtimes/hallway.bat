:start
cls
echo You are standing in the hallway. The hardwood floor is cold on your feet.
echo The living room is just over there. Your bedroom is right behind you.
if %picweet%==1 echo There is also a bathroom. & goto options2
echo A picture frame on the wall is crooked.
:options
echo.
echo a - Go into your bedroom.
echo b - Check out the bathroom.
echo c - Enter the living room.
echo d - Tilt the picture frame.
echo.
goto choice
:options2
echo.
echo a - Go into your bedroom.
echo b - Check out the bathroom.
echo c - Enter the living room.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto c
if /i "%choice%"=="c" goto b
if /i "%choice%"=="d" goto d
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
cls
echo You head into your bedroom.
echo.
pause
call bedroom.bat
:b
cls
echo You dash into the living room.
echo.
pause
call livingroom.bat
:c
cls
echo You mosey on down to the bathroom.
echo.
pause
call bathroom.bat
:d
if %picweet%==1 goto choice
cls
echo You tilt the picture frame back into place. It's a photo of you and
echo %ryan% at the local playground, five years ago.
echo.
ctext.exe "{D6}"
echo Have a weet point, cutie!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
set picweet=1
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start