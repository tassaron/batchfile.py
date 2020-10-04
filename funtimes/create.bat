set bran=1
set rainey=1
set ryan=1
set money=0
set /a choice=%random% %% 18
set katie=Error227
if %choice%==0 set katie=Jocelyn
if %choice%==1 set katie=Megan
if %choice%==2 set katie=Sarah
if %choice%==3 set katie=Jill
if %choice%==4 set katie=Jasmine
if %choice%==5 set katie=Wendy
if %choice%==6 set katie=Faye
if %choice%==7 set katie=Rachel
if %choice%==8 set katie=Laura
if %choice%==9 set katie=Kayla
if %choice%==10 set katie=Marissa
if %choice%==11 set katie=Hope
if %choice%==12 set katie=Stephanie
if %choice%==13 set katie=Katie
if %choice%==14 set katie=Anna
if %choice%==15 set katie=Casey
if %choice%==16 set katie=Julia
if %choice%==17 set katie=Courtney
:start
cls
echo Your best friend sits across from you at Pizza Pizza, picking
echo at his teeth idly. He glances up at the spotty clerk behind the
echo counter.
echo.
pause
cls
echo "Alright," he says. "You gonna go order, or should I?"
echo This is the third time he's asked you this.
echo Making sure to roll your eyes as visibly as possible, you stand
echo up from your table and walk up to the counter.
echo.
pause
:firstname
cls
echo "Medium pepperoni." The spotty clerk takes your money.
echo "Name?"
echo "What do you need that for?"
echo "We don't do numbers anymore," he says dully. "I'll call you up to
echo the counter when your pizza is ready."
echo.
set /p bran=What is your name? 
if "%bran%"=="1" goto firstname
set bran=%bran:~0,12%
:lastname
cls
echo "%bran%."
echo The spotty clerk just rolls his eyes.
echo "LAST name?"
echo.
set /p rainey=What is your LAST name? 
if "%rainey%"=="1" goto lastname
set rainey=%rainey:~0,12%
cls
echo "%rainey%."
echo "Thank you," he says. He turns over his shoulder and yells to someone
echo in the back, "%bran% %rainey% is in dire need of a pepperoni!
echo Thick and juicy if possible! Thank you."
echo He turns back and winks at you.
echo.
pause
:sex
cls
echo The spotty clerk's sudden advance turns your stomach. Before heading
echo back to your table, you make a detour to the washrooms.
echo.
echo a - Go into the women's room.
echo b - Go into the men's room.
echo.
:sexchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto sexa
if /i "%choice%"=="b" goto sexb
goto sexchoice
:sexa
set man=girl
goto bathroomf
:sexb
set man=boy
:bathroomm
cls
echo You stumble into the washroom, trying to hold in the puke. The only
echo stall is occupied, so you throw up in the nearest urinal instead.
echo "Ugh," you mutter, wiping your mouth with some paper towel. "What a
echo way to start the game!"
echo.
pause
cls
echo Before you can wash your hands, the stall opens. Out comes the imposing
echo figure of a Pizza Pizza janitor! He takes one look at the urinal you
echo desecrated. A single tear runs down his cheek as you hastily make your
echo way towards the exit.
echo.
pause
goto leaving
:bathroomf
cls
echo You stumble into the washroom, trying to hold in the puke. The first
echo stall is occupied, so you run into the second one. Unfortunately, this
echo slight delay causes you to miss the toilet entirely and throw up all over
echo the already-filthy tiled floor.
echo.
pause
cls
echo "Ugh," you mutter, wiping your mouth with some toilet paper. "What a way
echo to start the game!"
echo On your way out of the bathroom, you see a janitor come out of the first stall.
echo A single tear runs down her cheek when she sees the mess you made.
echo.
pause
:leaving
cls
echo You're feeling a bit better now, soothed by the hideous fluorescent lighting
echo of Pizza Pizza, and the fact that you can breathe out of your nose again.
echo You're about to go back to your table when a girl walks up to you.
echo.
pause
cls
echo She looks endlessly embarrassed, biting her lip between every other word and
echo glancing back at a table on the other side of the room before she clears her
echo throat in your general direction.
echo.
pause
cls
echo "Hey," she says awkwardly.
echo You return the greeting.
echo "%katie% wanted me to come talk to you," she says. You look over to where she
echo keeps glancing to look at who you assume to be %katie%. She's actually pretty
if %man%==boy echo cute.
if %man%==girl echo cute. When did you become a lesbian?
echo.
pause
cls
echo %katie%'s friend bites her lip. "Is that your friend?"
echo You stop looking at %katie% to look back at your friend, to whom the girl is
echo pointing. He picks his nose idly.
echo "Yeah, I guess," you say.
echo.
pause
:ryanname
cls
echo "What his name?" she asks, trying to sound casual.
echo.
set /p ryan=What's his name? 
if "%ryan%"=="1" goto ryanname
set ryan=%ryan:~0,12%
cls
echo "%ryan%," you answer. %katie%'s friend nods.
echo Before the conversation can get any more awkward, the spotty clerk calls
echo your name. The girl in front of you starts to walk back to her table.
echo "See you later," she says.
echo Somehow, you feel like there was more to that than knowing the name of your
echo best friend. But a missed opportunity is better than no opportunity, right?
echo.
pause
cls
echo The rest of the day goes by as normal. You and %ryan% split up and you
echo head back home for an early night. It's a good thing, too, because tomorrow
echo will be the longest day ever...
echo.
pause
if "%bran%"=="Harry" goto cheat
:save
call hardsave.bat
cls
set energy=15
echo You wake up the next morning feeling refreshed. You're a sixteen-year-old
echo %man% named %bran% %rainey%. You live in a small bungalow with your
echo mother, but she's never home.
echo Your best friend %ryan% lives down the street.
echo.
pause
call load.bat
call bedroom.bat
cls
echo Error 455 - Report this to Bran immediately.
pause >nul
exit
:cheat
if not "%rainey%"==Potter goto save
if not "%ryan%"==Bran goto save
if not "%man%"==boy goto save
set money=500
goto save