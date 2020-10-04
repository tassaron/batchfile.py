:start
set cook=0
cls
if %food%==1 goto food
echo You don't have any food to cook.
echo.
pause
call kitchen.bat
:food
echo There's all kinds of food in your fridge.
:: CHECK IF USER CAN COOK ANYTHING
if %bolognasalad%==1 set cook=1
if %pizza%==1 set cook=1
if %cook%==1 goto cooking
echo Unfortunately, you don't know how to cook anything.
echo.
pause
goto end
:cooking
echo The only question is, what should you make?
echo.
if %bolognasalad%==1 echo Type "bolognasalad" to make bologna salad.
if %pizza%==1 echo Type "pizza" to make a pizza.
:cooking
echo Type "stop" to stop cooking.
echo.
:choice
set /p choice=What do you want to cook? 
if /i "%choice%"=="bolognasalad" goto bolognasalad
if /i "%choice%"=="pizza" goto pizza
if /i "%choice%"=="stop" goto stop
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:pizza
if %pizza%==1 goto pizza2
goto choice
:pizza2
if %pppizza%==1 goto pizza3
if %pizzaweet%==1 goto pizza4
cls
echo You use the shifty guy's knowledge to make the perfect pizza!
echo.
pause
set pppizza=1
set food=0
call kitchen.bat
:pizza3
cls
echo You already have the perfect pizza!
echo.
pause
goto start
:pizza4
cls
echo You've already gotten revenge for the shifty guy. There's no need to
echo make another perfect pizza.
echo.
pause
goto start
:bolognasalad
if %bolognasalad%==1 goto bolognasalad2
goto choice
:bolognasalad2
if %bolognaweet%==1 goto bolognasalad3
cls
echo You fry up some bologna salad. Mmmm!
ctext.exe "{D6}"
echo This stuff is delicious. Have a weet point!
ctext.exe "{D0}"
echo.
pause
set food=0
set /a weet+=1
set /a energy-=1
set bolognaweet=1
call kitchen.bat
:bolognasalad3
cls
echo You fry up some bologna salad.
echo It's good, but you're sorta sick of it. Meh.
echo.
pause
set /a energy-=1
call kitchen.bat
:stop
call kitchen.bat
goto start
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:error
cls
echo Error 745. Report this to Bran immediately.
echo.
pause
exit
:end