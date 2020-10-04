:start
cls
echo As you approach %ryan%'s house, you see that %ryan% is already
echo outside! He's sitting on the steps to his house, arm around
echo the girl you met yesterday at Pizza Pizza. It suddenly occurs to
echo you that this girl is %katie%'s friend, who you'd previously
echo forgotten about.
echo.
pause
cls
echo "Hey %bran%!" %ryan% calls. You wave vaguely.
echo "Who's this?"
echo "This is Dana," he says.
echo.
pause
if %man%==girl goto girloption
if %man%==boy goto boyoption
:girloption
cls
echo You can't help but feel somewhat betrayed as Dana gives you an overly-
echo suspicious look. You're the one who told her %ryan%'s name, after
echo all; there's clearly no ill will from your side.
echo.
pause
cls
echo "We're just friends," you say.
echo %ryan% snorts. "I wouldn't go near %bran% with a six-inch pole,"
echo he says. "If you know what I mean."
echo You can't help but remember that one drunken party the two of you
echo had last year, and how inaccurate %ryan%'s jokes could really be.
echo.
pause
cls
echo Dana smiles and leans into %ryan%; clearly the girl is a fan of
echo dick jokes. Can't blame her, really.
echo "How did you two meet?" you ask.
echo.
pause
cls
echo "I googled for %ryan% and found your Yudia site," Dana says. "Nice
echo forum there, by the way."
echo "Thanks."
echo "She added me on MSN and we got to talking," %ryan% says. "She lives
echo nearby so I just told her to come over."
echo.
pause
cls
echo "Nice," you say with a certain degree of uncertainty. Dana to %katie%,
echo like %ryan% to you, seems to be a bit more socially lubricated. If you
echo know what I mean.
echo.
pause
cls
echo "What've you been up to?" says %ryan%.
echo "Not much," you understate. "I was just hanging out with %katie% earlier,
echo actually." You direct this to Dana, who raises her eyebrows.
echo.
pause
cls
echo "You know %katie% is, uh..." she says.
echo Your heart lurches. "Yeah?"
echo "Yeah," she says.
echo "...Yeah?"
echo.
pause
:shelikesgirls
cls
echo "She likes girls," Dana says.
echo %ryan%'s eyes widen inappropriately, but thankfully Dana doesn't notice.
echo You're not sure how to respond.
echo.
echo a - "I know."
echo b - "It's not your place to tell me something like that."
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="save" goto save
if /i "%choice%"=="stats" goto stats
goto choice
:save
call save.bat
goto shelikesgirls
:stats
call stats.bat
goto shelikesgirls
:a
cls
echo "I know," you say. "At least, I guessed."
echo Dana rolls her eyes. "Well, she's not exactly subtle."
echo.
pause
goto quest
:b
cls
echo "It's not your place to tell me something like that."
echo Dana blinks. "What?"
echo "I mean, it's completely insensitive. She should be able to tell me something
echo like that on her own terms. It's not something you should bandy about like a
echo warning. That just makes you sound like a homophobe, if you think people need
echo to be warned of something so irrelevant."
echo.
pause
call level.bat str 1
cls
echo %ryan% points towards your feet.
echo "You're standing on a soapbox, %bran%," he laughs. You look down and see that
echo you are, indeed, standing on a discarded box of soap.
if %donedrugs%==1 goto drugs
echo "Must've thrown it out the window one time when I was bored," %ryan% says.
goto drugs2
:drugs
echo "Must've thrown it out the window when we were on drugs," %ryan% says.
:drugs2
echo "Right," you say, blushing slightly. "Sorry about the rant, Dana."
echo.
pause
cls
echo Dana just looks stunned.
echo "I already know she's gay," you say. "Well, I guessed."
echo Dana nods. "Sorry if I gave you the wrong impression," she says.
echo "No, no," you say. "I'm just being sensitive."
echo.
pause
goto quest
:boyoption
cls
echo "How did you two meet?" you ask.
echo "I googled for %ryan% and found your Yudia site," Dana says. "Nice
echo forum there, by the way."
echo "Thanks."
echo "She added me on MSN and we got to talking," %ryan% says. "She lives
echo nearby so I just told her to come over."
echo.
pause
cls
echo "Nice," you say with a certain degree of uncertainty. Dana to %katie%,
echo like %ryan% to you, seems to be a bit more socially lubricated. If you
echo know what I mean.
echo.
pause
cls
echo "What've you been up to?" asks %ryan%.
echo "Not much," you understate. "I was just hanging out with %katie% earlier,
echo actually." You direct this to Dana, who raises her eyebrows.
echo.
pause
:quest
cls
echo "Are you, uh," Dana smirks, "interested in her?"
echo You're not sure what to say. Dana laughs.
echo "You know what %katie% likes?" she says. You raise an eyebrow. "She likes %man%s
echo who can work with computers. She likes nerds."
echo.
echo a - "I don't know if I'd call myself a nerd."
echo b - "Does this apply to Dungeons & Dragons?!"
echo.
:choicequest
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto questa
if /i "%choice%"=="b" goto questb
if /i "%choice%"=="save" goto questsave
if /i "%choice%"=="stats" goto queststats
goto choicequest
:questsave
call save.bat
goto quest
:queststats
call stats.bat
goto quest
:questa
cls
echo "I don't know if I'd call myself a nerd," you say uncertainly.
echo "You operate a website with a forum," Dana says sternly.
echo She's got a point.
echo.
pause
goto questc
:questb
cls
echo "Does this apply to Dungeons & Dragons?!" you say excitedly.
echo "No."
echo "Damn it!"
echo.
pause
if %man%==boy call level.bat str 1
:questc
cls
echo "If you really want to impress her," Dana says, "buy her something nice from
echo The Source. She never wants to go in there because all the nerds stare at her."
echo You consider this for a moment. It doesn't sound unreasonable.
echo.
pause
cls
echo %ryan% hugs Dana closer, very obviously trying to wrench her attention
echo back to him. Dana pulls away, frowning.
echo "Sorry %ryan%, I actually have to get going. My dad's gonna want me
echo home soon," she says.
echo "Already?" %ryan% whines. Dana rolls her eyes, smiling.
echo.
pause
cls
echo She gives him a peck on the cheek and leaves, walking further down
echo %ryan%'s street. As soon as she's out of range, %ryan% gives you the
echo look of death like you're the world's most oblivious cockblock.
echo.
pause
set metdana=1
:end