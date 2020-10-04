:start
if %gun%==1 goto start2
if %girls%==1 goto start3
cls
echo This is Ammu-Nation, your one-stop shop for legal firearms. A burly man watches
echo you from behind the counter. He doesn't look happy.
if %nogun%==1 goto flavour
goto options
:flavour
if %robquest%==1 echo You'll need to distract him if you want to steal a gun.
:options
echo.
echo a - Buy a gun. ($300)
echo b - Leave the store.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
if %nogun%==1 goto af
cls
echo You walk up to the burly man and try to buy a gun. He snorts derisively.
echo "I can't sell a gun to a sixteen-year-old %man%!" he says.
echo.
pause
set nogun=1
goto start
:af
cls
if %man%==boy echo You try putting on a fake moustache, but he still won't sell to you.
if %man%==girl echo The burly man shakes his head.
echo.
pause
goto start
:start2
cls
echo The burly man who works there kicks you out of the store immediately.
echo.
pause
goto end
:start3
cls
echo "Let loose, my minions!" you yell dramatically. The little girls swarm from
echo behind you, spreading out all over Ammu-Nation.
echo "No! My precious store!" the burly man behind the counter yells. He leaves his
echo post to run frantically around after the little girls.
echo Now's your chance to steal the gun you need!
echo.
echo a - Steal that gun pronto!
echo b - Have second thoughts.
echo.
:choice3
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a3
if /i "%choice%"=="b" goto b3
if /i "%choice%"=="stats" goto stats3
if /i "%choice%"=="save" goto save3
goto choice3
:a3
call level.bat str 1
cls
echo You take advantage of the chaos to swipe a pistol from the store. The burly man
echo starts pounding towards you just after you hide the gun.
echo "Get out!" he screams. "NOW!"
echo.
pause
cls
echo You have been kicked out of Ammu-Nation for good.
echo The little girls file back to the playground, one by one. They shoot you dirty
echo looks as they go by.
echo.
pause
cls
echo You walk back to the playground, keeping your gun out of sight.
echo.
pause
set gun=1
call playground.bat
:b3
cls
echo You start to have second thoughts about this whole ordeal. Stealing isn't
echo right, is it? Maybe you should just apologize to the burly man.
echo.
echo a - Apologize to the man and leave the store.
echo b - Screw morality! Steal that damn gun!
echo.
:choice4
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a4
if /i "%choice%"=="b" goto a3
if /i "%choice%"=="stats" goto stats4
if /i "%choice%"=="save" goto save4
goto choice4
:a4
call level.bat int 1
cls
echo You decide to apologize to the burly man for any trouble you may have caused
echo him or his gun shop. What made you think this was a good idea?
echo Before you can get the words out, though, he screams at you. "Get out! NOW!"
echo.
pause
cls
echo You have been kicked out of Ammu-Nation for good.
echo The little girls file back to the playground, one by one. They shoot you dirty
echo looks as they go by.
echo.
pause
cls
echo Before she leaves, one girl hands you a pistol and winks. You're speechless.
echo She follows her friends back to the playground, leaving you there.
echo.
ctext.exe "{D6}"
echo You did the right thing AND corrupted the youth. Have a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
set gun=1
cls
echo You walk back to the playground, keeping your gun out of sight.
echo.
pause
call playground.bat
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:stats3
call stats.bat
goto start3
:save3
call save.bat
goto start3
:stats4
call stats.bat
goto b3
:save4
call save.bat
goto b3
:end