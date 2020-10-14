if %love%==2 goto dana
goto start
:dana
if %metdana%==1 goto start
call dana.bat
:start
set c=0
cls
echo You're at %ryan%'s house. The shingles falling off his roof can't
echo be very safe, can they? Oh well. Here you can hang out with your
echo friend and just have a good time.
if %patience%==1 goto teach
goto options
:teach
if %rpatience%==1 goto options
echo You should probably teach %ryan% the gift of patience, while you're here.
set c=1
:options
echo.
echo a - Go back to the street.
echo b - Hang out with %ryan%.
if %c%==1 echo c - Teach %ryan% the gift of patience.
if %drugs%==1 goto options1
goto options2
:options1
if %outofdrugss%==1 goto options2
if %c%==0 echo c - Do drugs with %ryan%.
if %c%==1 echo d - Do drugs with %ryan%.
:options2
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
cls
echo You leave %ryan%'s house.
echo.
pause
call street.bat
:b
if %energy% LEQ 0 goto bfail
cls
echo You hang out with %ryan% for a few hours doing pretty much nothing.
if %hungout%==1 goto bfail2
echo.
pause
cls
ctext.exe "{D6}"
echo Very productive! Have a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat cha 1
set /a weet+=1
set hungout=1
goto start
:bfail2
echo For a second I almost forgot you were a teenager! (raucous laughter)
echo.
pause
goto start
:bfail
cls
echo You're too tired to hang out.
echo.
pause
goto start
:c
if %c%==0 goto d1
if %energy% LEQ 0 goto cf
cls
echo You whip out your metre stick and slam %ryan% upside the face.
echo "Let's learn you the gift of patience!" you exclaim.
echo %ryan% cringes, but learns the gift anyway. Woot!
echo.
pause
call level.bat int 1
set rpatience=1
goto start
:cf
cls
echo You're too tired to teach %ryan% the gift of patience.
echo.
pause
goto start
:d
if %c%==0 goto choice
:d1
if %outofdrugss%==1 goto choice
if %outofdrugs%==1 goto outofdrugs
if %drugs%==1 goto d2
goto choice
:d2
if %macsdrugs%==1 goto drugscheck1
if %playdrugs%==1 goto drugscheck2
if %homedrugs%==1 goto drugscheck3
:d2a
if %energy% LEQ 0 goto d2af
call drugs.bat
goto start
:d2af
cls
echo You're too tired to do drugs.
echo.
pause
goto start
:outofdrugs
cls
echo Your bag of drugs is empty!
echo %ryan% shakes his head in disappointment.
echo.
pause
set outofdrugss=1
goto start

:: CHECK IF ALL THREE BOREDOM VARIABLES EXIST
:drugscheck1
if %playdrugs%==1 goto drugscheck1a
if %homedrugs%==1 goto drugscheck1b
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck1a
if %homedrugs%==1 set outofdrugs=1
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck1b
if %playdrugs%==1 set outofdrugs=1
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck2
if %macsdrugs%==1 goto drugscheck2a
if %homedrugs%==1 goto drugscheck2b
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck2a
if %homedrugs%==1 set outofdrugs=1
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck2b
if %macsdrugs%==1 set outofdrugs=1
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck3
if %macsdrugs%==1 goto drugscheck3a
if %playdrugs%==1 goto drugscheck3b
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck3a
if %playdrugs%==1 set outofdrugs=1
if %outofdrugs%==0 goto d2a
goto outofdrugs
:drugscheck3b
if %macsdrugs%==1 set outofdrugs=1
if %outofdrugs%==0 goto d2a
goto outofdrugs

:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end