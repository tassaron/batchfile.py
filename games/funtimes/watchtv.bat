cls
if %energy%==0 goto fail
if %energy% LEQ 15 goto nap
echo You try to watch TV, but it's just so damn boring. Ugh.
echo.
pause
goto end
:fail
echo You're too tired to watch TV. No, seriously.
echo Go to bed, %man%.
echo.
pause
goto end
:nap
echo You sit down in front of the television to watch whatever's
echo on at the time. It's mildly entertaining and doesn't take
echo effort on your part.
echo.
ctext.exe "{D6}"
echo Half an hour later, you wake from your daze with fifteen extra
echo energy points! That's pretty weet.
ctext.exe "{D0}"
echo.
pause
set /a energy+=15
:end