cls
echo "You got the gun yet?" the teen whispers when you approach. You nod
echo your head and he smirks. "Follow my lead."
echo.
pause
cls
echo He pulls his hoodie over his head and throws it on you. You struggle to
echo put the filthy thing over your head as he runs to the front of the store.
echo "This is a robbery!" he yells. The woman behind the counter raises an
echo eyebrow.
echo.
pause
cls
echo You finally manage to get the hoodie over your head. The hood droops down,
echo effectively hiding your face. Just as the woman behind the counter is
echo reaching for the phone, you pull out your gun and point it at her.
echo "Don't even think about it!" you yell.
echo And you used to be such a nice person...
echo.
pause
cls
echo The robbery goes off without a hitch. The woman behind the counter empties
echo the cash register of $200 and gives it all to the teenager you're working
echo with.
echo "Thanks, bitch," he says to her as the two of you leave the store. You think
echo this is a bit unnecessarily rude, but you say nothing.
echo.
pause
:start
cls
echo Outside the store, you give the teen his hoodie. He pulls it back on and
echo puts $100 in his pocket. He holds the other $100 out towards you.
echo "Here's your share, man," he says. "Thanks a lot."
echo You're about to take the money when you realise that you're still holding
echo the gun in your hand. Maybe you want more than 50% after all...
echo.
echo a - Try to threaten the teen.
echo b - Take your share peacefully.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
call level.bat str 1
cls
echo You pull out your gun and point it between the teen's eyes. He looks
echo thoroughly unimpressed.
echo "You don't have the balls to shoot me, man," he says, rolling his eyes.
echo You pull the trigger.
echo.
pause
cls
echo Nothing happens.
echo "Look, man, you didn't even buy ammo!" the teen laughs. "What a moron!"
echo You hastily stow the gun away and try to stutter out an apology, but
echo the teenager holds out his hand.
echo "Nah, man, don't even bother," he says. "I should've known you'd try
if %man%==boy echo something stupid like that. You guys are all the same in this city."
if %man%==girl echo something stupid like that. You girls are all the same in this city."
echo.
pause
cls
echo The teenager walks away with all the money.
echo You shouldn't have gotten greedy!
echo.
pause
set robquestt=1
goto end
:b
cls
echo "Thanks," you say, taking the money. The teen gives you one last wave
echo before turning away and exiting your life forever. What a trip.
echo.
ctext.exe "{D6}"
echo You got $100!
ctext.exe "{D0}"
echo.
pause
set robquestt=1
set /a money+=100
goto end
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end