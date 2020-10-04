:start1
if %oldlady%==1 goto start
set oldlady=1
cls
echo As you approach the building, you see an old lady struggling to put groceries
echo in her car. She really looks like she could use some help from a young %man%
echo like yourself.
echo.
echo a - %bran% to the rescue!
echo b - Ignore her.
echo.
:choice1
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a1
if /i "%choice%"=="b" goto b1
if /i "%choice%"=="stats" goto stats1
if /i "%choice%"=="save" goto save1
goto choice1
:a1
if %energy% LEQ 0 goto a1f
cls
echo You walk over to the old lady and ask her if she needs any help with her
echo groceries. She's a bit apprehensive, but accepts your offer.
echo.
ctext.exe "{D6}"
echo She gave you $5 for helping her!
echo You also got a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
set /a money+=5
call level.bat cha 1
goto start
:a1f
cls
echo You walk over to the old lady and ask her if she needs any help with her
echo groceries. She's a bit apprehensive, but accepts your offer. After several
echo minutes of trying, you realise that you're just way too tired to help. The
echo grocery bags feel like they're full of bricks.
echo.
pause
cls
echo The old lady fails to stifle her laughter as you walk away in shame.
echo.
pause
goto start
:b1
cls
echo You decide to ignore the old lady. She's probably a crabby old bat anyway.
echo While you're at it, you kick a puppy and take a bite out of someone's baby.
echo.
pause

:: NORMAL CARPARK STARTS HERE
:start
:start2
cls
echo You are just outside the mall. There are a ton of cars in the parking lot.
if %bike%==1 goto nobike
echo A teenager stands near the outskirts of the lot, trying to sell her bike.
:nobike
if %love% LEQ 2 goto nokatie
echo %katie%'s street is just next to here.
:nokatie
echo.
:options1
echo a - Continue into the mall.
echo b - Make your way home.
if %bike%==1 goto options3
goto options2
:options2
echo c - Talk to the teenager.
:options3
if %love% GTR 2 goto options4
goto options7
:options4
if %bike%==1 goto options6
goto options5
:options5
echo d - Go down %katie%'s street.
goto options7
:options6
echo c - Go down %katie%'s street.
:options7
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto C
if /i "%choice%"=="d" goto d
if /i "%choice%"=="save" goto save
if /i "%choice%"=="stats" goto stats
:a
cls
echo You continue into the mall.
echo.
pause
call mall.bat
goto start
:b
cls
if %bike%==1 goto bikehome
echo You walk back home.
goto b2
:bikehome
echo You hop on your bike and ride back home.
:b2
echo.
pause
call outside.bat
:c
if %bike%==1 goto c2
cls
echo You walk over to the teenager.
echo.
pause
call bike.bat
goto start
:c2
if %love% LEQ 2 goto choice
cls
echo You walk down %katie%'s street.
echo.
pause
call slums.bat
goto start
:d
if %bike%==1 goto choice
if %love% GTR 2 goto d2
goto choice
:d2
cls
echo You walk down %katie%'s street.
echo.
pause
call slums.bat
goto start
:save
call save.bat
goto start2
:stats
call stats.bat
goto start2
:end