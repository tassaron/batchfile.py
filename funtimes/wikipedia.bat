:start
cls
echo You're on Wikipedia, the free encyclopedia that even your grandma can edit.
echo There's a lot of information here.
echo.
echo Type in the keyword of what you want to research.
echo Type "stop" to leave Wikipedia.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="television" goto television
if /i "%choice%"=="mysql" goto mysql
if /i "%choice%"=="slushie" goto slushies
if /i "%choice%"=="slushies" goto slushies
if /i "%choice%"=="strength" goto str
if /i "%choice%"=="charisma" goto cha
if /i "%choice%"=="dexterity" goto dex
if /i "%choice%"=="intelligence" goto int
if /i "%choice%"=="yudia" goto yudia
if /i "%choice%"=="stop" goto stop
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:stop
cls
echo You leave Wikipedia.
echo.
pause
call web.bat
:mysql
cls
if %mysql%==1 goto mysql2
echo You read about MySQL and its use on the Yudia forum.
echo Man, this stuff is easy. You've got it down.
echo.
pause
set mysql=1
goto start
:mysql2
echo You already know all about MySQL.
echo.
pause
goto start
:television
cls
if %tvskill%==1 goto television2
echo You read up on how to repair TVs.
echo Seems simple enough...
echo.
pause
set tvskill=1
goto start
:television2
echo You already know how to repair the TV.
echo.
pause
goto start
:yudia
cls
echo You're not notable enough to have a Wikipedia article!
echo.
pause
goto start
:str
cls
echo You check the page on strength:
echo A person's strength determines how much force they can put into
echo physical attacks. A person with high dexterity has a greater
echo defensive advantage over a person with high strength.
echo Higher levels of strength naturally lower a person's charisma.
echo.
pause
goto start
:dex
cls
echo You check the page on dexterity:
echo A person's dexterity is a measure of their agility, affecting
echo their resistance to physical attacks. A person with high dexterity
echo has a good defensive advantage over a person with high strength.
echo Higher levels of dexterity naturally lower a person's intelligence.
echo.
pause
goto start
:cha
cls
echo You check the page on charisma:
echo A person's charisma determines how forceful their personality is.
echo Force of personality contributes to mental attacks such as negotiation
echo or telekinesis. A person with high intelligence has a greater defensive
echo advantage over a person with high charisma. Higher levels of charisma
echo naturally lower a person's strength.
echo.
pause
goto start
:int
cls
echo You check the page on intelligence:
echo A person's intelligence is a measure of how smart they are, which
echo affects their resistance to mental attacks. A person with high
echo intelligence has a good defensive advantage over a person with
echo high charisma. Higher levels of intelligence naturally lower a person's
echo dexterity.
echo.
pause
goto start
:slushies
if %slushskill%==1 goto slushies1
cls
echo You read up on the inner workings of slushie machines...
echo Fixing a slushie machine should be a breeze if you have a wrench.
echo.
pause
set slushskill=1
goto start
:slushies1
cls
echo You already know how to fix a slushie machine.
echo.
pause
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start