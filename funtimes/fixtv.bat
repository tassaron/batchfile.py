cls
if %tvskill%==1 goto win
goto fail
:win
echo You use your TV-fixing know-how to smack the top of the set.
echo It buzzes into life. You've fixed the TV!
ctext.exe "{D6}"
echo Repairmen are pretty cool, so have yourself a weet point.
ctext.exe "{D0}"
echo.
pause
set fixedtv=1
set /a weet+=1
set /a energy-=1
call level.bat int 1
goto end
:fail
echo You don't know how to fix the TV.
echo Try looking up "television" on Wikipedia.
echo.
pause
:end