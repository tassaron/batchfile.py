:: FUNTIMES VAMPIRE GAME
:: written by Bran Rainey, 23 July 2010
::
:: 20 NPCs in the game, 5 of them vampires
:: players 19 and 20 are %ryan% and Dana
:: if %love%>2, %katie% is player 18
::
:: there are four types of votes:
:: jumpy, experienced, quiet, or stupid
:: anytime a player votes, the vote type
:: determines which aura variable goes up
:: the aura variables are the names of the
:: vote types
::
:: each player has a personality type
:: jumpy, experienced, quiet, or stupid
:: the personality type determines the
:: frequency with which they use different
:: vote types. vampires will ALWAYS vote
:: in accordance with their vote type,
:: while humans will just USUALLY do so
::
:: the attack pattern is like this:
:: j>e>q>s - so jumpy votes for experienced
:: but they don't vote based on personality type
:: they vote based on aura, which is related
:: to personality, but not as definite
:: so voting in early game is more random and
:: can screw up the whole game, as it should
::
:: anytime the player votes for a vampire,
:: the accuracy variable goes up. this affects the
:: voting from the human players only
:: experienced players will vote with the player
:: if accuracy is >1
:: quiet players need >2
:: jumpy players need >3
:: stupid players don't ever use accuracy


:start
@echo off
for /F %%a in (file.sav) do set %%a
set accuracy=0


:: randomize names/roles
:playerloop
set /a player=(%random% %% 17) + 1
set p%player%=Allan
set p%player%sex=boy
call :playerloop1
set p%player%=Shannon
set p%player%sex=girl
call :playerloop1
set p%player%=Colin
set p%player%sex=boy
call :playerloop1
set p%player%=Eric
set p%player%sex=boy
call :playerloop1
set p%player%=Anya
set p%player%sex=girl
call :playerloop1
set p%player%=Jennifer
set p%player%sex=girl
call :playerloop1
set p%player%=Caitlin
set p%player%sex=girl
call :playerloop1
set p%player%=Steve
set p%player%sex=boy
call :playerloop1
set p%player%=Paul
set p%player%sex=boy
call :playerloop1
set p%player%=David
set p%player%sex=boy
call :playerloop1
set p%player%=Bailey
set p%player%sex=girl
call :playerloop1
set p%player%=Nanda
set p%player%sex=girl
call :playerloop1
set p%player%=Evan
set p%player%sex=boy
call :playerloop1
set p%player%=Brett
set p%player%sex=boy
call :playerloop1
set p%player%=Ashley
set p%player%sex=girl
call :playerloop1
set p%player%=Tara
set p%player%sex=girl
call :playerloop1
set p%player%=Joel
set p%player%sex=boy
call :playerloop1
set p%player%=Kallie
set p%player%sex=girl
call :playerloop1
if %love% GTR 2 set p18=%katie%
if %love% GTR 2 set p18sex=girl
set p19=%ryan%
set p19sex=boy
set p20=Dana
set p20sex=girl
goto typeloop
:playerloop1
if p%player%sex==boy if %bran%==p%player% set p%player%=Henry
if p%player%sex==girl if %bran%==p%player% set p%player%=Rena
if %ryan%==p%player% set p%player%=Francis
set /a player+=1
if %player% GTR 18 set player=1
goto end

:typeloop
set p18t=quiet
set p19t=stupid
set p20t=experienced
set typeloop=0
:typeloop1
set /a type=(%random% %% 99) + 1
if %type% GTR 0 set p%typeloop%t=experienced
if %type% GTR 25 set p%typeloop%t=jumpy
if %type% GTR 50 set p%typeloop%t=quiet
if %type% GTR 75 set p%typeloop%t=stupid
set /a typeloop+=1
if %typeloop% GTR 17 goto roleloop
goto typeloop1

:roleloop
set p1r=human
set p2r=human
set p3r=human
set p4r=human
set p5r=human
set p6r=human
set p7r=human
set p8r=human
set p9r=human
set p10r=human
set p11r=human
set p12r=human
set p13r=human
set p14r=human
set p15r=human
set p16r=human
set p17r=human
set p18r=human
set p19r=human
set p20r=human
set roleloop=0
:roleloop1
if %roleloop% GTR 5 goto living
set /a type=(%random% %% 19) + 1
set p%type%r=vampire
set /a roleloop+=1
goto roleloop1

:living
set p1l=1
set p2l=1
set p3l=1
set p4l=1
set p5l=1
set p6l=1
set p7l=1
set p8l=1
set p9l=1
set p10l=1
set p11l=1
set p12l=1
set p13l=1
set p14l=1
set p15l=1
set p16l=1
set p17l=1
set p18l=1
set p19l=1
set p20l=1

:intro
cls
echo There are twenty people at the table, excluding yourself. %p8% nods
if %p8sex%==girl echo her head at you when you sit down. The game can now begin.
if %p8sex%==boy echo his head at you when you sit down. The game can now begin.
echo.
pause

:day1

:debug
cls
echo %p1% - %p1t% %p1r% %p1sex%
echo %p2% - %p2t% %p2r% %p2sex%
echo %p3% - %p3t% %p3r% %p3sex%
echo %p4% - %p4t% %p4r% %p4sex%
echo %p5% - %p5t% %p5r% %p5sex%
echo %p6% - %p6t% %p6r% %p6sex%
echo %p7% - %p7t% %p7r% %p7sex%
echo %p8% - %p8t% %p8r% %p8sex%
echo %p9% - %p9t% %p9r% %p9sex%
echo %p10% - %p10t% %p10r% %p10sex%
echo %p11% - %p11t% %p11r% %p11sex%
echo %p12% - %p12t% %p12r% %p12sex%
echo %p13% - %p13t% %p13r% %p13sex%
echo %p14% - %p14t% %p14r% %p14sex%
echo %p15% - %p15t% %p15r% %p15sex%
echo %p16% - %p16t% %p16r% %p16sex%
echo %p17% - %p17t% %p17r% %p17sex%
echo %p18% - %p18t% %p18r% %p18sex%
echo %p19% - %p19t% %p19r% %p19sex%
echo %p20% - %p20t% %p20r% %p20sex%
echo.
pause
goto end










:end































