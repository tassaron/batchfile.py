:start
cls
echo The supermarket is spotlessly clean from top to bottom. There are rows upon
echo rows of food on display. In fact, that's the only thing they sell.
if %shiftyy%==1 goto noshifty
echo There is a shifty guy lurking in one of the aisles.
goto shifty
:noshifty
echo.
echo a - Buy food. ($10)
echo b - Leave Metro.
echo.
:choice
set /p choice=What do you want to do? 
if /i %choice%==a goto a
if /i %choice%==b goto c
if /i %choice%==stats goto stats
if /i %choice%==save goto save
goto choice
:shifty
echo.
echo a - Buy food. ($10)
echo b - Talk to the shifty guy.
echo c - Leave Metro.
echo.
:shifty1
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto shifty1
:a
if %food%==1 goto a2
if %money% LSS 10 goto nomoney
cls
echo You pick out a wide selection of food and bring it to the cashier.
echo The employee looks you up and down as you make your purchase.
ctext.exe "{D4}"
echo The food cost you $10.
ctext.exe "{D0}"
set /a money-=10
set food=1
echo.
pause
goto start
:a2
cls
echo You have no more room in your fridge for food.
echo.
pause
goto start
:nomoney
cls
echo You don't have enough money!
echo.
pause
goto start
:b
if %shifty%==1 goto alreadyshifty
cls
echo You walk down the aisle, heading towards the shifty guy.
echo I mean, what could possibly go wrong? It's not like this
echo guy is really shifty or anything...
echo.
pause
goto start2
:alreadyshifty
if %ppizza%==1 goto b2
if %pizzaweet%==1 goto shiftycongrats
cls
echo You walk down the aisle, heading towards the shifty guy. He looks
echo up as you approach.
echo "Don't keep coming back here, man," he says, frightened. "You'll
echo draw unwanted attention."
echo You frown and walk away.
echo.
pause
goto start
:shiftycongrats
cls
echo You walk down the aisle, heading towards the shifty guy. He looks
echo up as you approach. You nod in triumph and he smiles at you.
echo "I knew you could do it, man! I knew it!"
echo Before you can react, the shifty guy gives you a huge bear hug.
echo.
pause
cls
echo As he rubs the back of your head, he cries silently.
if %man%==boy echo "I'm so proud. You're like the son I never had," he sobs.
if %man%==girl echo "I'm so proud. You're like the daughter I never had," he sobs.
echo You want to tell him how silly he's being, but it just won't
echo come out. A tear comes to your eye as he lets go of you.
echo.
pause
cls
if %man%==boy echo "I have to leave now, son. There are hundreds of pizzerias in
if %man%==girl echo "I have to leave now. There are hundreds of pizzerias in
echo this country, and they're not going to blackmail themselves."
echo He gives you one last fatherly look before turning around and
echo walking out of your life forever.
echo.
pause
set shiftyy=1
goto start
:start2
cls
echo The shifty guy looks up as you approach.
echo "You here for some information?"
echo You nod, unsure of this guy's intentions.
echo "I'm a former employee of Pizza Pizza," he explains. "They laid me
echo off a few days ago. I'd do anything to get back at them."
echo.
echo a - Help him get revenge.
echo b - Politely decline.
echo.
:choice2
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a1
if /i "%choice%"=="b" goto b1
if /i "%choice%"=="save" goto save1
if /i "%choice%"=="stats" goto stats1
goto choice2
:a1
cls
echo You agree to help the shifty guy get revenge on his former
echo employer. Seems like a responsible thing to do, right?
echo "Bring me a pizza from Pizza Pizza," he says. "I can use that
echo to show you how to make the perfect pizza. Then, you can use
echo your pizzas to blackmail those sleezeballs!"
echo That seems like a sound plan to you.
echo Now go get this guy a pizza!
echo.
pause
set shifty=1
goto start
:b1
cls
echo You politely decline to help the shifty guy.
echo Vengeance accomplishes nothing, right? Right.
echo.
pause
goto start
:b2
cls
echo As you approach the shifty guy, his nostrils flare.
echo "Is that a pizza I smell?!" he asks.
echo Before you can react, the shifty guy starts disassembling your
echo pizza right before your eyes. Before eating each slice, he shows
echo you the intricacies of its creation.
echo.
pause
cls
ctext.exe "{D4}"
echo The bad news is, you've lost your pizza.
ctext.exe "{D6}"
echo The good news is, now you know how to make your own pizza!
ctext.exe "{D0}"
echo.
pause
if %ppizza%==1 set ppizza=0
set pizza=1
goto start
:c
cls
echo You exit the supermarket.
echo.
pause
goto end
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
:end