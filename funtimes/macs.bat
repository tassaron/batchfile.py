:start
if %robquestt%==1 goto start2
cls
echo Mac's convenience store is a great place to buy slushies, meet people,
echo and shoplift. Not that you'd ever do that. The woman behind the counter
echo eyes you suspiciously. There's an older teenager in a black hoodie near
echo one of the freezers.
echo.
echo a - Buy a slushie. ($3)
echo b - Shoplift something.
echo c - Talk to the teen.
echo d - Leave.
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
if %fixedslush%==1 goto a3
if %slushskill%==1 goto a1
cls
echo You try to buy a slushie, but the machine is broken.
echo Maybe you could try looking up slushies on Wikipedia.
echo.
pause
if %robquestt%==1 goto start2
goto start
:a1
if %wrench%==1 goto a2
cls
echo You try to buy a slushie, but the machine is broken.
echo Fortunately, you know how to fix a slushie machine.
echo Unfortunately, you don't have a wrench to do so.
echo.
pause
goto start
:a2
cls
echo You try to buy a slushie, but the machine is broken.
echo Good thing you brought your wrench! You repair the slushie
echo machine in a matter of seconds.
echo.
pause
cls
ctext.exe "{D6}"
echo Repairmen are pretty cool, so have yourself a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
cls
echo The woman behind the counter is relieved that you've fixed the
echo slushie machine. "Now the stoners that always come here can stop
echo bugging me about it!" she says.
ctext.exe "{D6}"
echo In exchange for your kindness, she gives you a free slushie!
ctext.exe "{D0}"
echo.
pause
set slushie=1
set fixedslush=1
goto start
:a3
if %slushie%==1 goto a3f
if %money% GEQ 3 goto a3a
cls
echo You don't have enough money!
echo.
pause
goto start
:a3f
cls
echo This slushie is cold enough on your hands as it is. There's no
echo way you could hold another one.
echo.
pause
goto start
:a3a
cls
echo You pour yourself an ice-cold slushie from the machine.
ctext.exe "{D4}"
echo It costs you $3.
ctext.exe "{D0}"
echo.
pause
set /a money-=3
set slushie=1
goto start
:b
cls
echo You'd never do that!
echo.
pause
if %robquestt%==1 goto start2
goto start
:c
if %robquest%==1 goto c2
if %robthink%==1 goto ac2a
cls
echo The teenager smirks as you approach him.
echo "What's up, my man?" he asks.
echo "Not a lot," you reply casually. The teen laughs.
echo "I got a job for you, man," he whispers.
echo It seems likely that this guy is drunk, or on drugs. Maybe you
echo shouldn't talk to him...
echo.
echo a - Keep talking to him.
echo b - Walk away.
echo.
:choicec
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto ac
if /i "%choice%"=="b" goto bc
if /i "%choice%"=="stats" goto statsc
if /i "%choice%"=="save" goto savec
goto choicec
:ac
cls
echo "What kind of job?" you ask.
echo "Well, I'm gonna be skipping town real soon," he says. "So I figure,
echo what's my rep worth anymore, y'know?"
echo You nod uncertainly.
echo.
pause
cls
echo "I don't want to get myself into any real danger, though, so I need
echo your help. Go get a gun from the Ammu-Nation at the mall and help me
echo rob this place."
echo Your eyes widen.
echo "I'll take the fall for you, man, promise," he continues. "You just got
echo to do the dirty work for me. We'll split profits 50/50."
echo.
pause
goto ac2
:ac2a
cls
echo "Change your mind?" the teen asks as you approach.
echo.
pause
:ac2
cls
echo You're a bit conflicted. You could really use the money, but do you really
echo want to trust a person like this?
echo.
echo a - Of course I do!
echo b - Definitely not.
echo.
:choiceac
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto aca
if /i "%choice%"=="b" goto acb
if /i "%choice%"=="stats" goto statsac
if /i "%choice%"=="save" goto saveac
goto choiceac
:aca
cls
echo "Yeah, I'll help you," you say.
echo The teen gives you a high five and leans back against the freezer.
echo "Come talk to me when you get the gun, alright?" he tells you.
echo.
pause
set robquest=1
goto start
:acb
cls
echo "I'll think about you," you say.
echo The teen just rolls his eyes and leans back against the freezer.
echo.
pause
set robthink=1
goto start
:bc
cls
echo You decide to walk away before the teen can get you in any trouble.
echo.
pause
goto start
:c2
if %gun%==1 goto c3
:c4
cls
echo "You got the gun yet?" the teen whispers when you approach. You shake
echo your head and he just frowns. "Then what are you wasting my time for?"
echo he asks. "Get to work!"
echo.
pause
goto start
:c3
if %gunsold%==1 goto c4
call robbery.bat
goto end
:d
cls
echo You leave Mac's convenience store.
echo.
pause
goto end
:start2
cls
echo Mac's convenience store is a great place to buy slushies, meet people,
echo and shoplift. Not that you'd ever do that. The woman behind the counter
echo doesn't recognize you, thankfully.
echo.
echo a - Buy a slushie.
echo b - Shoplift something.
echo c - Leave.
echo.
:choice2
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto d
if /i "%choice%"=="stats" goto stats1
if /i "%choice%"=="save" goto save1
goto choice2
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:stats1
call stats.bat
goto start2
:save1
call save.bat
goto start2
:statsc
call stats.bat
goto c
:savec
call save.bat
goto c
:statsac
call stats.bat
goto ac2
:saveac
call save.bat
goto ac2
:end