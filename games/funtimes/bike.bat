:start
cls
echo "How much do you want for the bike?" you ask.
echo She smiles at you. Her teeth are oddly white.
echo "Fifty bucks," she says.
echo.
echo a - Buy the bike.
if %money% LEQ 49 echo b - Too expensive!
if %money% GEQ 50 echo b - Don't bother.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
if %money% LEQ 49 goto af
cls
echo "I'll buy it," you say, holding out fifty bucks in cash.
echo The teenager eyes your money with glee.
if %gun%==1 goto a2
echo.
pause
cls
ctext.exe "{D6}"
echo You got a bike!
ctext.exe "{D4}"
echo But you lost $50.
ctext.exe "{D0}"
echo.
pause
set bike=1
goto end
:a2
echo Before she grabs it, though, she takes a sniff of the air.
goto af2
:af
cls
if not %money%==1 echo "I'll buy it," you say. "But I only have %money% bucks."
if %money%==1 echo "I'll buy it," you say. "But I only have a dollar."
echo The teenager raises her eyebrow.
if %gun%==1 goto af2
echo "Get lost!"
echo.
pause
goto end
:af2
echo "Tell you what..." she whispers. "I'll give you the bike for free if you
echo give me that gun you have."
echo Your eyes widen.
echo.
pause
:af2choice0
cls
echo "How did you know I have a gun on me?"
echo "I can smell it!" she says impatiently. "Are you gonna give me the gun or
echo what?!"
echo.
echo a - Exchange the gun for the bike.
echo b - This looks immoral. No dice.
echo.
:af2choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto af2a
if /i "%choice%"=="b" goto af2b
if /i "%choice%"=="stats" goto af2stats
if /i "%choice%"=="save" goto af2save
goto af2choice
:af2a
cls
echo You pull out your gun and toss it to her. She catches it deftly.
echo "Now can I take the bike?" you ask.
echo She points the gun at you.
echo "Maybe I changed my mind..." she says smoothly.
echo.
pause
cls
echo Luckily, her attempt to kill you is foiled by a lack of bullets.
echo "Damn it!" she swears. "This happens every time!"
echo She sighs.
echo "Just take the bike..." she mutters in defeat.
echo.
pause
cls
ctext.exe "{D6}"
echo You got a bike!
ctext.exe "{D4}"
echo But you lost your gun.
ctext.exe "{D0}"
echo.
pause
set bike=1
set gunsold=1
goto end
:b
:af2b
cls
echo "No can do, buckaroo!" you yell.
echo She just rolls her eyes.
echo.
pause
goto end
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:af2stats
call stats.bat
goto af2choice0
:af2save
call save.bat
goto af2choice0
:end