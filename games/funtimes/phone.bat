:start
if %love%==4 call closet.bat
if %metdana%==1 goto plandate
if %girl%==1 goto girl

:start1
cls
echo There isn't anyone you want to call at the moment.
echo.
pause
goto end

:: ASKING TO MEET UP
:girl
if %calledgirl%==1 goto katie1
cls
echo You decide to dial that girl's number. The one that you met on
echo your way to mall, that is. The phone rings.
echo.
pause
cls
echo She picks up right away.
echo "Hello?"
echo.
pause
cls
echo "Hey. It's %bran%, the %man% you saw near the mall earlier."
echo "Oh, %bran%! Sorry, I totally forgot to ask your name when we
echo talked. I'm %katie%."
echo.
pause
set calledgirl=1
set flirt=0
goto respond
:katie1
if %meetgirl%==1 goto start1
cls
echo You dial %katie%'s number. She picks up right away.
echo "Hey %katie%, it's %bran%."
echo "Oh! What's up?"
echo.
pause
set flirt=0
goto respond
:respond
cls
echo There's an awkward silence as %katie% waits for you to say something.
echo.
echo a - Flirt awkwardly.
echo b - Ask her to meet you.
echo c - Ask her on a date.
echo d - Hang up.
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
if %flirt%==0 goto 0
if %flirt%==1 goto 1
if %flirt%==2 goto 2
if %flirt%==3 goto 3
if %flirt%==4 goto 4
if %flirt%==5 goto 5
if %flirt%==6 goto 6
if %flirt%==7 goto 7
if %flirt%==8 goto 8
if %flirt%==9 goto 9
:0
cls
echo "Do you babysit?"
echo "No, why do you ask?"
echo "You talked to me because you thought I was a babysitter."
echo "Well, it's not every day that you see someone leading a big group
echo of kids to the mall," she laughs. "So you aren't a babysitter?"
echo.
pause
cls
echo "No, I'm not. Those kids were... my cousins."
echo "Wow," %katie% breathes.
echo She sounds impressed for some reason.
echo.
pause
set /a flirt+=1
goto respond
:1
if "%bran%"=="%katie%" goto 1a
if "%ryan%"=="%katie%" goto 1b
cls
echo "Do you like corn?"
echo "Yeah, I guess."
echo You're not really sure where you were going with that question.
echo.
pause
set /a flirt+=1
goto respond
:1a
cls
echo "We have the same name, huh?"
echo "Yeah, I guess."
echo You're not really sure where you were going with that question.
echo.
pause
set /a flirt+=1
goto respond
:1b
cls
echo "You have the same name as my best friend."
echo "Oh," she says. "Your friend has a girl's name?"
echo "Yeah," you reply. "Not sure why."
echo.
pause
set /a flirt+=1
goto respond
:2
cls
echo "What kind of music do you like?"
echo She tells you. It's the same kind of music you like!
echo (Whatever that is.)
echo.
pause
set /a flirt+=1
goto respond
:3
cls
echo "I really want to have sex with you!" you yell.
echo The line goes totally silent.
echo.
pause
cls
echo After a moment, %katie% replies.
echo "Sorry, my phone cut out for a bit there," she explains. "What did you say?"
echo "Oh n-n-nothing..."
echo.
pause
set /a flirt+=1
goto respond
:4
cls
echo "What do you think about bumbling buns?"
echo "I dunno," she says. "It's okay if both parties consent, obviously,
echo but I still think it's pretty gross, y'know?"
echo "I read a study once that said even wild animals have been observed
echo bumbling buns in nature."
echo.
pause
cls
echo "I'm not denying that it's natural!" she says defensively.
echo "I know what you mean," you assure her. "I'm just talking."
echo "Alright."
echo.
pause
set /a flirt+=1
goto respond
:5
cls
echo "Where do you get your groceries?"
echo She pauses for a moment. "Why do you ask?"
echo "I dunno," you admit. "I'm really searching for things to talk about."
echo %katie% laughs. Whether that's good or bad is beyond you.
echo.
pause
cls
echo "My mother goes to the other side of the city for food," she says.
echo "Ah, right," you say. "I buy groceries at Metro, since it's the only
echo grocery store in this game... I mean, in this part of town."
echo "That's cool."
echo.
pause
set /a flirt+=1
goto respond
:6
cls
echo "Have you ever seen Fight Club?"
echo "No," she replies.
echo "Yeah... me neither."
echo.
pause
set /a flirt+=1
goto respond
:7
cls
echo "Have you ever stolen a gun from Ammu-Nation?"
echo "What?"
echo "Never mind."
echo.
pause
set /a flirt+=1
goto respond
:8
cls
echo "%katie% is a very nice name. I... uh, I used to have a cat named %katie%."
echo "Uh... okay."
echo She giggles a bit. You wipe the sweat from your brow.
echo.
pause
set /a flirt+=1
set love=1
goto respond
:9
cls
echo You can't think of anything else to say.
echo.
pause
goto uplove
:b
if %love% LEQ 0 goto bf
cls
echo "I'm gonna be heading to the mall later."
echo "Again?" She laughs.
echo "Well, without my cousins this time..."
echo "Right on."
echo.
pause
cls
echo "You want to meet me there?"
echo "Uh..." she pauses for a moment. "I guess, yeah."
echo "Cool," you say, sighing in relief. "I'll see you soon."
echo "Bye."
echo.
pause
cls
echo You hang up the phone.
echo.
pause
call level.bat cha 1
set meetgirl=1
goto end
:bf
cls
echo You want to ask if she'll meet up with you, but you're still afraid
echo that she doesn't like you. The words just won't come out.
echo.
pause
goto respond
:c
cls
echo You barely know this girl! There's no way in hell that you're gonna ask
echo her on a date yet. No way.
echo.
pause
goto respond
:d
cls
echo "It was nice talking to you," you say.
echo "Bye."
echo.
pause
goto end
:stats
call stats.bat
goto respond
:save
call save.bat
goto respond

:: PLANNING THE FIRST DATE
:plandate
if %dateplanned%==1 goto start1
cls
echo You dial %katie%'s number. She picks up right away.
echo "Hey %katie%, it's %bran%."
echo "Oh! What's up?"
echo.
pause
set flirt=0
:respond1
cls
echo There's an awkward silence as %katie% waits for you to say something.
echo.
echo a - Flirt awkwardly.
echo b - Ask her to meet you.
echo c - Ask her on a date.
echo d - Hang up.
echo.
:choice1
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a1
if /i "%choice%"=="b" goto b1
if /i "%choice%"=="c" goto c1
if /i "%choice%"=="d" goto d1
if /i "%choice%"=="stats" goto stats1
if /i "%choice%"=="save" goto save1
goto choice1
:a1
if %flirt%==0 goto 0a
if %flirt%==1 goto 1a
if %flirt%==2 goto 2a
if %flirt%==3 goto 3a
if %flirt%==4 goto 4a
if %flirt%==5 goto 5a
if %flirt%==6 goto 6a
if %flirt%==7 goto 7a
if %flirt%==8 goto 8a
if %flirt%==9 goto 9a
:0a
cls
echo "So, what are you up to?" you ask.
echo "Not much, really," %katie% replies, sounding bored. "I
echo just came over to my friend's place a few minutes ago."
echo "Ah," you say. "Dana?"
echo.
pause
cls
echo "How do you know Dana?"
echo "She was hanging out with my friend %ryan% earlier."
echo "Oh," %katie% laughs. "Yeah, she's had a bit of a crush on
echo him for a while now."
echo.
pause
set /a flirt+=1
goto respond1
:1a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:2a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:3a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:4a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:5a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:6a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:7a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:8a
cls
echo FLIRT FLIRT
pause
set /a flirt+=1
goto respond1
:9a
cls
echo You can't think of anything else to say.
echo.
pause
goto respond1
:b1
cls
echo No more time-wasting. You need to ask this girl on a date before your
echo head explodes.
echo.
pause
goto respond1
:c1
cls
if %flirt%==9 goto c1a
echo You try to ask %katie% out for a date, but the words just won't come
echo out. It's too intimidating.
echo.
pause
goto respond1
:c1a
echo "So, um, %katie%?" you stutter out.
echo "Yeah?"
echo Your throat sticks. You can't breathe.
echo.
pause
cls
echo "Do you, uh..." you start. "You wanna meet up at the playground?"
echo "The playground?" she says uncertainly.
echo "I know it's near Dana's house."
echo "Oh, right," she says.
echo.
pause
cls
echo "Yeah..." you say, trying to fill up the silence that's settling.
echo You can hear Dana saying something in the background. %katie% puts
echo her hand over the phone receiver.
echo.
pause
cls
echo "I just figured we could, um--"
echo "You want Dana to come too?" %katie% interrupts.
echo Your heart drops a few straight inches. This isn't going well.
echo.
pause
cls
echo "I thought it could just be the two of us," you say.
echo In the millisecond before she answers, you're scrunching up your face,
echo arching your feet, breathing through your teeth in a sheer display
if %man%==boy echo of manly self-consciousness.
if %man%==girl echo of girlish nervousness.
echo.
pause
cls
echo Dana says something indistinct. %katie% sounds happy when she responds,
echo "Yeah, alright."
echo You let out a breath.
echo "Meet you at the playground in a few?" she asks.
echo "Yeah," you say.
echo.
pause
cls
echo "Can't wait," she says. "See you later, %bran%."
echo "See you."
echo The line goes dead.
echo.
pause
call level.bat cha 1
set dateplanned=1
goto end
:d1
cls
echo "It was nice talking to you," you say.
echo "Bye."
echo.
pause
goto end
:stats1
call stats.bat
goto respond1
:save1
call save.bat
goto respond1

:end