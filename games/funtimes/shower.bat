cls
if %energy%==0 goto end2
echo You hop into the shower and scrub yourself clean.
echo.
pause
cls
if %showered%==1 goto b
ctext.exe "{D6}"
echo A clean %man% is a weet %man%, so you've gained a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat cha 1
set showered=1
set /a weet+=1
goto end
:b
echo You're a clean freak, aren't you?
echo.
pause
:end
set /a energy-=1
goto end3
:end2
echo You don't have enough energy to take a shower.
echo Go rest in your bedroom.
echo.
pause
:end3