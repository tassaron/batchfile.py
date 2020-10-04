:start
cls
echo The playground is pretty much deserted at the moment, like most playgrounds.
if %dateplanned%==1 goto datestart
echo There are some little girls on the swings and an obvious drug dealer
echo sitting in that cone thingy.
echo.
echo a - Talk to the little girls.
goto options
:datestart
echo %katie% is standing by the swings with some little girls. There's an obvious
echo drug dealer sitting in that cone thingy.
echo.
echo a - Talk to %katie%.
:options
echo b - Go down the slide.
echo c - Buy some drugs.
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
if %dateplanned%==1 goto a1
cls
echo Bracing yourself, you walk over to the little girls.
echo.
pause
call girls.bat
goto start
:a1
if %showered%==1 goto a1a
cls
echo You quickly sniff your armpits to check stench status.
echo Ugh! You should really take a shower before going on that
echo date with %katie%.
echo.
pause
goto start
:a1a
cls
echo You quickly blow into your hand to check breath status.
echo It's all clear, so you walk over to %katie%.
echo.
pause
call dating.bat
goto start
:b
if %energy% LEQ 0 goto bf
if %slideweet%==1 goto b2
cls
echo That slide is literally the best thing man has ever created.
echo You run to it and slide down, screaming like a maniac.
echo.
pause
cls
ctext.exe "{D6}"
echo You put away childish things, including the fear of childishness
echo and the desire to be very grown up. Have a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat dex 1
call level.bat str 1
set /a weet+=1
set /a energy-=1
set slideweet=1
goto start
:b2
cls
echo You go down the slide again, but the squeaking of your skin against
echo the steel has gotten worse.
echo.
pause
set /a energy-=1
goto start
:bf
cls
echo You're too tired to go down the slide.
echo.
pause
goto start
:c
if %energy% LEQ 0 goto cf
if %boughtdrugs%==1 goto cf2
if %cheapdrugs%==1 goto cfcheap
if %nodrugs%==1 goto cf3
if %nnodrugs%==1 goto cf4
if %bike%==1 goto cc
cls
echo You walk over to that cone thingy.
echo "Anything for sale?" you ask.
echo The obvious drug dealer raises an eyebrow at you.
echo "I don't do deals in broad daylight," he says slowly.
echo.
pause
goto start
:cf
cls
echo Talking to a drug dealer when you have no energy?
echo Baaaad idea, man. Seriously.
echo.
pause
goto start
:cf2
cls
echo You walk over to that cone thingy.
echo "Anything for sale?" you ask.
echo The obvious drug dealer laughs.
echo "You took the last of my drugs, man!" he says.
echo.
pause
goto start
:cf3
:: IF USER SAID NO TO DRUGS
cls
echo You walk over to that cone thingy.
echo "Anything for sale?" you ask.
echo The obvious drug dealer rolls his eyes.
echo "I thought you were too cool for drugs?" he says.
echo.
echo a - I changed my mind.
echo b - Oh, right. Oops.
echo.
:cf3choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cf3a
if /i "%choice%"=="b" goto cf3b
if /i "%choice%"=="stats" goto cf3stats
if /i "%choice%"=="save" goto cf3save
goto cf3choice
:cf3a
cls
echo "Well, I changed my mind," you say. The drug dealer smiles.
if %man%==boy echo "Good man," he says. He reaches into one of his pockets
if %man%==girl echo "Strong woman," he says. He reaches into one of his pockets
echo to pull out a huge bag of drugs. You were expecting a baggie, but this
echo is more of a garbage bag.
echo.
pause
cls
echo "That'll be fifty bucks," he says.
echo "That seems absurdly cheap for a bag that size," you observe.
echo "Well, the bag is like 99%% broken glass," he shrugs.
echo.
pause
if %money% GEQ 50 goto cf3a1
cls
echo "I don't have fifty bucks," you say.
echo The drug dealer shrugs. "Hey, man, you gotta pay the reaper."
echo You walk away sadly. Damn, you really wanted those drugs!
echo.
pause
set cheapdrugs=1
goto start
:cf3a1
cls
ctext.exe "{D4}"
echo You hand over $50.
ctext.exe "{D6}"
echo You get a garbage bag of drugs!
ctext.exe "{D0}"
echo.
pause
set /a money-=50
set boughtdrugs=1
set drugs=1
goto start
:cf3b
cls
echo "Oh, right," you say. "Sorry."
echo The drug dealer just sighs in exasperation as you walk away.
echo.
pause
goto start
:cf3stats
call stats.bat
goto cf3
:cf3save
call save.bat
goto cf3
:cf4
cls
echo You're about to walk over to that cone thingy when you realize,
echo that obvious drug dealer has a gun! Why the hell are you walking
echo over to talk to him?!
echo.
pause
goto start
:cfcheap
cls
echo You walk over to that cone thingy. The obvious drug dealer looks
echo up as you approach. "You got the money now?" he asks.
echo.
pause
if %money% GEQ 50 goto cfcheap1
cls
echo You check your pockets.
echo "No," you say sadly. The drug dealer rolls his eyes.
echo You walk away, blushing in embarrassment.
echo.
pause
goto start
:cfcheap1
cls
echo You pull fifty bucks out of your pocket and throw it to him.
echo He stuffs the money into one of his innumerable pockets, pulls out
echo the garbage bag of drugs, and hands it to you.
echo.
pause
cls
ctext.exe "{D4}"
echo You lost $50.
ctext.exe "{D6}"
echo But you got a garbage bag of drugs!
ctext.exe "{D0}"
echo.
pause
set /a money-=50
set boughtdrugs=1
set drugs=1
goto start
:cc
cls
echo As you approach that cone thingy, you see the girl from outside
echo the mall hanging out with the obvious drug dealer. She's waving
if %gunsold%==1 goto cc2
echo around the fifty bucks you gave her.
goto cc3
:cc2
echo around the gun you gave her.
:cc3
echo You pause on your way there, reluctant to get all up in their business.
echo.
pause
cls
echo The girl from the mall eventually trades her ill-gotten gains to
echo the obvious drug dealer in exchange for some drugs produced from the
echo depths of seemingly-bottomless pockets.
echo "Thanks, man," she says. She walks away, ignoring you on her way by.
if %gunsold%==1 goto cc3a
echo The obvious drug dealer pockets your fifty.
goto cc3b
:cc3a
echo The obvious drug dealer pockets the gun you stole earlier.
:cc3b
echo.
pause
cls
echo You walk up to that cone thingy to confront the drug dealer.
echo "Anything for sale?" you ask. The obvious drug dealer looks you over.
echo "I don't do deals in broad daylight," he says slowly.
echo.
pause
cls
echo "That's horsepoop!" you say, gesturing behind you. "I just saw you
echo deal to that girl."
:: IF THE OBVIOUS DRUG DEALER CAN THREATEN USER WITH GUN
if %gunsold%==1 goto cc3b1
echo The obvious drug dealer shakes his head. "Alright, man, what you want?"
echo.
pause
goto cc3choice
:cc3b1
echo The obvious drug dealer shakes his head. Reaching into his jacket, he
echo pulls out the gun he just acquired and points it square at your head.
echo.
pause
:cc3choice1
cls
echo "Maybe..." he growls, "I just don't wanna deal to preppy motherlovers
echo like you."
echo "Motherlovers? Don't you mean motherf--" The drug dealer cocks his gun
echo to shut you up. He frowns.
echo.
echo a - Tell him to "love" off!
echo b - Back away slowly.
echo.
:cc3choice1c
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cc3choice1a
if /i "%choice%"=="b" goto cc3choice1b
if /i "%choice%"=="stats" goto cc3choice1stats
if /i "%choice%"=="save" goto cc3choice1save
goto cc3choice1c
:cc3choice1a
cls
echo "Love off!" you yell. "All I want is some drugs!"
echo The drug dealer lowers his gun. "You really wanna love with me?"
echo "What?"
echo "Never mind," he says, putting his gun away. "That was just a bit
if %man%==boy echo of fun for me, dude. What you want?"
if %man%==girl echo of fun for me. What you want?"
echo.
pause
goto cc3choice
:cc3choice1b
cls
echo You hastily throw up your hands. "Not the face!" you yell.
echo The obvious drug dealer laughs, putting his gun away.
echo "Get the love outta here!" he says.
echo.
pause
cls
echo You wander back to the playground proper, blushing in embarrassment.
echo.
pause
set nnodrugs=1
goto start
:cc3choice1stats
call stats.bat
goto cc3choice1
:cc3choice1save
call save.bat
goto cc3choice1
:cc3choice
:: IF THE OBVIOUS DRUG DEALER DOES NOT HAVE A GUN
cls
echo "I want your drugs," you say. "Obviously."
echo "All of them?" he asks, raising an eyebrow. When you don't answer
echo right away, he reaches behind him and pulls out a giant garbage bag
echo full of drugs. He pats the bag on the side.
echo.
pause
:cc3choice2
cls
echo "I was expecting maybe a baggie..." you start uncertainly.
echo "I don't sell baggies anymore," he says. "Too much of a hassle. I'll
echo give you this bad boy for fifty bucks."
echo "That seems cheap."
echo "Well, it's something like 99%% broken glass."
echo.
echo a - Buy the broken glass/drug combo.
echo b - Say no to drugs!!!
echo.
:cc3choice2c
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cc3choice2a
if /i "%choice%"=="b" goto cc3choice2b
if /i "%choice%"=="stats" goto cc3choice2stats
if /i "%choice%"=="save" goto cc3choice2save
goto cc3choice2c
:cc3choice2a
if %money% GEQ 50 goto cc3choice2a1
cls
echo You reach into your pockets, but you only have $%money%!
echo "Not enough," the drug dealer says. "Sorry."
echo You walk away from the cone thingy, blushing in embarrassment.
echo.
pause
set cheapdrugs=1
goto start
:cc3choice2a1
cls
echo "I'll take it!" you exclaim.
ctext.exe "{D4}"
echo The drug dealer takes fifty bucks from you.
ctext.exe "{D6}"
echo You got a garbage bag of drugs!
ctext.exe "{D0}"
echo.
pause
set /a money-=50
set boughtdrugs=1
set drugs=1
goto start
:cc3choice2b
cls
echo "No," you say. "Drugs aren't cool!"
echo You walk away from the cone thingy. The obvious drug
echo dealer just watches you in bewilderment.
echo.
pause
set nodrugs=1
goto start
:cc3choice2stats
call stats.bat
goto cc3choice2
:cc3choice2save
call save.bat
goto cc3choice2
:d
cls
echo You leave the playground.
echo.
pause
call street.bat
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end