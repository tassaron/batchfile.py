:start
cls
echo The spotty clerk looks at you vaguely as you stand at the counter. 
if %showered%==1 goto notsmelly
echo He turns up his nose at your horrible stench.
:notsmelly
if %man%==girl echo "What can I get you, ma'am?" he asks awkwardly.
if %man%==boy echo "What can I get you, sir?" he asks awkwardly.
echo.
echo a - Buy a pizza. ($10)
echo b - Buy a flashlight. ($1)
echo c - Leave Pizza Pizza.
if %pppizza%==1 echo d - Sell your pizza.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if %pppizza%==1 if /i "%choice%"=="d" goto d
if /i "%choice%"=="save" goto save
if /i "%choice%"=="stats" goto stats
goto choice
:a
if %pizza%==1 goto a4
if %shifty%==1 goto a0
goto a5
:a0
cls
if %money% LEQ 14 goto a2
if %ppizza%==1 goto a3
echo You order a pizza. That oughta clog the ol' arteries.
ctext.exe "{D4}"
echo You paid $10 for extra grease.
ctext.exe "{D6}"
echo You got a pizza!
ctext.exe "{D0}"
echo.
pause
set /a money-=10
set ppizza=1
goto start
:a2
echo You're too poor to buy a pizza!
echo.
pause
goto start
:a3
echo You already have a pizza!
echo.
pause
goto start
:a4
cls
echo Who needs to buy a pizza when you already know how to make one?
echo.
pause
goto start
:a5
cls
echo You try to order a pizza. The spotty clerk just shrugs.
echo "We don't have any pizzas ready at the moment," he tells you.
echo You'll have to come back later.
echo.
pause
goto start
:b
if %pizzaweet%==1 goto b3
if %shrine%==1 goto b4
if %weet% LEQ 0 goto b2
cls
echo "I'll have a flashlight," you say, trying not to look like an idiot.
echo Unfortunately, ordering a flashlight in a pizzeria is kind of dumb.
ctext.exe "{D4}"
echo You lose a dollar.
ctext.exe "{D6}"
echo You get a flashlight!
ctext.exe "{D0}"
echo.
pause
set /a money-=1
set /a flash+=1
goto start
:b2
cls
echo You're too poor to buy a flashlight!
echo.
pause
goto start
:b3
cls
echo The spotty clerk recognises you as you approach. He hides behind the
echo counter in terror. That makes buying a flashlight rather hard!
echo.
pause
goto start
:b4
cls
echo "I'll have a flashlight," you say, trying not to look like an idiot.
echo The spotty clerk just raises his eyebrow at you.
echo.
pause
goto start
:c
cls
echo You leave Pizza Pizza.
echo.
pause
goto end
:d
if %pizzaweet%==1 goto d2
cls
echo The spotty clerk shifts uncomfortably as you show off your perfect pizza.
echo Trying to appear calm, he asks you for your pizza. You oblige, smirking.
ctext.exe "{D6}"
echo You got $20 for your perfect pizza!
echo You got revenge for the shifty guy. Have a weet point!
ctext.exe "{D0}"
echo.
pause
set pizzaweet=1
if %pppizza%==1 set pppizza=0
call level.bat str 1
set /a weet+=1
set /a money+=20
goto start
:d2
cls
echo The spotty clerk recognises you as you approach. He hides behind the
echo counter in terror. That makes selling your perfect pizza rather hard!
echo.
pause
goto start
:save
call save.bat
goto start
:stats
call stats.bat
goto start
:end