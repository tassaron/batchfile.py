:start
cls
echo The little girls look at you when you approach, like you're
echo some kind of freak. One of them has mud running down her dress.
if %gun%==1 goto options
if %robquest%==1 goto options2
:options
echo.
echo a - Ask them if you can play with them.
echo b - Leave them alone.
echo.
goto choice
:options2
echo.
echo a - Ask them if you can play with them.
echo b - Tell them to follow you to Ammu-Nation.
echo c - Leave them alone.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if %robquest%==1 if /i "%choice%"=="c" goto c
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
cls
echo You're about to ask the girls if you can play with them, but
echo then you realise how creepy and weird that would sound.
echo.
pause
goto start
:b
if %gun%==1 goto c2
if %robquest%==1 goto b2
goto c
:b2
cls
echo Clearing your throat, you give these girls a stern command.
echo "Follow me to the gun shop!" you tell them. They look thoroughly
echo confused.
echo.
pause
cls
echo Despite this, they decide to follow you. One girl drags a generic
echo teddy bear along the ground as she walks. You would feel guilty if
echo it weren't so freakin' cute.
echo.
pause
cls
echo As you walk to the mall, a girl around your age catches your eye.
echo She looks somewhat familiar, but you can't quite remember her name.
echo "Babysitting?" she asks lightly. You smile and nod at her. The two
echo of you talk for a bit, but the little girls start tugging on your
echo shirt before you can get anywhere.
echo.
pause
cls
echo Before leaving, she gives you her phone number.
if %man%==stoner goto stoner
ctext.exe "{D6}"
if %man%==boy echo Hot damn! Have a weet point, playa!
if %man%==girl echo Good thing you're a lesbian! Have a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
:stoner
if %man%==stoner echo Not bad. Someone to "adore" when using drugs.
set girl=1
cls
echo You enter the mall and walk to Ammu-Nation.
echo.
pause
set girls=1
call guns.bat
goto end
:c
if %gun%==1 goto choice
:c2
cls
echo You decide to leave them alone after all. Talking to them makes
echo you feel creepy anyway.
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