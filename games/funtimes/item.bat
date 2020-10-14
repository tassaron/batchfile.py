:: DOES USER HAVE ANY ITEMS?
if %1==1 set useditem=0
set havegun=0
set havedrugs=0
set items=0
set item=0
if %gun%==1 goto guncheck
goto nogun
:guncheck
if %gunsold%==1 goto nogun
set /a items+=1
set havegun=1
:nogun
if %drugs%==1 goto drugscheck
goto nodrugs
:drugscheck
if %outofdrugs%==1 goto nodrugs
set /a items+=1
set havedrugs=1
:nodrugs
if %1==1 goto bite
:: the rest of this is skipped by the shortcut loop
if %flash% GTR 0 set /a items+=%flash%
if %ppizza%==1 set /a items+=1
if %pppizza%==1 set /a items+=1
if %popcorn%==1 set /a items+=1
if %wrench%==1 set /a items+=1
if %slushie%==1 set /a items+=1
if %cpu1%==1 set /a items+=1
if %cpu2%==1 set /a items+=1
if %cpu3%==1 set /a items+=1
if %ram1%==1 set /a items+=1
if %ram2%==1 set /a items+=1
if %ram3%==1 set /a items+=1
if %wifi%==1 set /a items+=1
if %wkam%==1 set /a items+=1
if %monitor%==1 set /a items+=1
if %items% GTR 0 goto use
echo You have no items to use!
echo.
pause
goto end

:: USER DOES HAVE SOME ITEMS
:use
if %items%==1 echo You have 1 item on hand.
if %items% GTR 1 echo You have %items% items on hand.
if %flash% GTR 1 echo Type "flashlight" to use one of your %flash% flashlights.
if %flash%==1 echo Type "flashlight" to use your flashlight.
if %ppizza%==1 echo Type "pizza" to throw your pizza.
if %pppizza%==1 echo Type "pizza" to throw your pizza.
if %wrench%==1 echo Type "wrench" to wield your wrench.
if %slushie%==1 echo Type "slushie" to give your slushie.
if %popcorn%==1 echo Type "popcorn" to throw some popcorn.
if %havegun%==1 echo Type "gun" to fire your gun at %nme%.
if %havedrugs%==1 echo Type "drugs" to give %nme% some drugs.
if %cpu1%==1 echo Type "intel" to bludgeon with your Intel 2.0GHz Celeron.
if %cpu2%==1 echo Type "amd" to bludgeon with your AMD Dual-Core Opteron 875.
if %cpu3%==1 echo Type "i7" to bludgeon with your i7 2.66 GHz Quad-Core.
if %ram1%==1 echo Type "2gb" to hit %nme% with 2GB of RAM.
if %ram2%==1 echo Type "4gb" to hit %nme% with 4GB of RAM.
if %ram3%==1 echo Type "8gb" to hit %nme% with 8GB of RAM.
if %wifi%==1 echo Type "wifi" to pummel with your wi-fi adaptor.
if %wkam%==1 echo Type "keyboard" to smack %nme% with your keyboard.
if %monitor%==1 echo Type "monitor" to throw your 20" HD monitor.
echo Type "stop" to go back.
echo.
:choice
if %1==1 goto end
set /p choice=Which do you want to use? 
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
if /i "%choice%"=="stop" goto stop
if /i "%choice%"=="ketchup" goto ketchup
:bite
if /i "%choice%"=="flashlight" goto flashlight
if /i "%choice%"=="pizza" goto pizza
if /i "%choice%"=="wrench" goto wrench
if /i "%choice%"=="slushie" goto slushie
if /i "%choice%"=="popcorn" goto popcorn
if /i "%choice%"=="gun" goto gun
if /i "%choice%"=="drugs" goto drugs
if /i "%choice%"=="intel" goto intel
if /i "%choice%"=="amd" goto amd
if /i "%choice%"=="i7" goto i7
if /i "%choice%"=="2gb" goto 2gb
if /i "%choice%"=="4gb" goto 4gb
if /i "%choice%"=="8gb" goto 8gb
if /i "%choice%"=="wifi" goto wifi
if /i "%choice%"=="keyboard" goto keyboard
if /i "%choice%"=="monitor" goto monitor
if %1==1 goto end
goto choice
:stats
call stats.bat
goto use
:save
call save.bat
goto use
:ketchup
cls
echo You briefly consider throwing your trust pack of ketchup at
echo %nme%, but decide not to. It has too much sentimental value.
echo.
goto use

:flashlight
if %flash% LEQ 0 goto choice
set item=5
cls
if %flash%==1 goto flashlight1
if %flash% GTR 1 goto flashlight2
:flashlight1
set /a flash-=1
echo You shine your flashlight in %nme%'s eyes!
goto stong
:flashlight2
set /a flash-=1
echo You shine one of your flashlights in %nme%'s eyes!
goto stong

:pizza
if %ppizza%==1 goto pizza1
if %pppizza%==1 goto pizza1
goto choice
:pizza1
set item=10
if %ppizza%==1 set ppizza=0
if %pppizza%==1 set pppizza=0
cls
echo You throw your pizza in %nme%'s face!
goto stong

:wrench
if %wrench%==1 goto wrench1
goto choice
:wrench1
set item=10
cls
echo You hit %nme% with your wrench!
goto stong

:slushie
if %slushie%==1 goto slushie1
goto choice
:slushie1
set item=10
if %slushie%==1 set slushie=0
cls
if %sex%==boy echo You offer %nme% your slushie. He drinks it down quickly,
if %sex%==boy echo giving himself a brainfreeze! What a tasty vengeance!
if %sex%==girl echo You offer %nme% your slushie. She drinks it down quickly,
if %sex%==girl echo giving herself a brainfreeze! What a tasty vengeance!
if %sex%==it echo You offer %nme% your slushie. It drinks it down quickly,
if %sex%==it echo giving itself a brainfreeze! What a tasty vengeance!
goto smart

:popcorn
if %popcorn%==1 goto popcorn1
goto choice
:popcorn1
set item=50
if %popcorn%==1 set popcorn=0
cls
echo You throw some popcorn at %nme%!
goto stong

:gun
if %havegun%==1 goto gun1
goto choice
:gun1
set item=100
cls
ctext.exe "{D6}"
echo BLAM!!
ctext.exe "{D0}"
if %ondrugs%==1 ctext.exe "{1F}"
goto jesus

:drugs
if %havedrugs%==1 goto drugs1
goto choice
:drugs1
set item=10
cls
if %sex%==boy echo You offer %nme% some drugs. He accepts graciously.
if %sex%==girl echo You offer %nme% some drugs. She accepts graciously.
if %sex%==it echo You offer %nme% some drugs. It accepts graciously.
goto smart

:intel
if %cpu1%==1 goto intel1
goto choice
:intel1
set item=5
cls
echo You smack %nme% over the head with your Intel 2.0GHz Celeron!
goto stong

:amd
if %cpu2%==1 goto amd1
goto choice
:amd1
set item=10
cls
echo You bludgeon %nme% with your AMD Dual-Core Opteron 875!
goto stong

:i7
if %cpu3%==1 goto i71
goto choice
:i71
set item=15
cls
echo You bludgeon %nme% with your i7 2.66 GHz Quad-Core! Ouch!
goto stong

:2gb
if %ram1%==1 goto 2gb1
goto choice
:2gb1
set item=2
cls
echo You smack %nme% with a 2GB stick of RAM!
goto stong

:4gb
if %ram2%==1 goto 4gb1
goto choice
:4gb1
set item=4
cls
echo You smack %nme% with a 4GB stick of RAM!
goto stong

:8gb
if %ram3%==1 goto 8gb1
goto choice
:8gb1
set item=8
cls
echo You smack %nme% with an 8GB stick of RAM!
goto stong

:wifi
if %wifi%==1 goto wifi1
goto choice
:wifi1
set item=2
cls
echo You pummel %nme% with your Linksys wi-fi adaptor! SMACK! BAM!
goto stong

:keyboard
if %wkam%==1 goto keyboard1
goto choice
:keyboard1
set item=4
cls
echo You hit %nme% over the head with your wireless keyboard!
goto stong

:monitor
if %monitor%==1 goto monitor1
goto choice
:monitor1
if %monitor%==1 set monitor=0
set item=20
cls
echo You throw your 20" HD monitor at %nme%. It flies into the air
if %sex%==boy echo and knocks him over the head with a sickening CRACK!
if %sex%==girl echo and knocks her over the head with a sickening CRACK!
if %sex%==it echo and knocks it over the head with a sickening CRACK!
echo Your monitor has been destroyed.
goto stong

:stop
set items=0
goto end

:stong
set /a lvl+=1
set /a dmg=(%str%-%nmedex%)+%item%
goto dmg

:smart
set /a lvl-=1
set /a dmg=(%cha%-%nmeint%)+%item%
goto dmg

:jesus
set dmg=%item%
goto dmg

:dmg
if %dmg% LSS 0 set dmg=0
set /a nmehp-=%dmg%
if %dmg%==0 set dmg=no
if %sex%==boy echo He takes %dmg% damage!
if %sex%==girl echo She takes %dmg% damage!
if %sex%==it echo It takes %dmg% damage!
echo.
pause
if %1==1 set useditem=1
goto end

:end