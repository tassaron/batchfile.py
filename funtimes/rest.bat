cls
set energy=15
echo You wake up a few hours later, though it's still sunny outside.
echo How long does this day last, anyway? Jeez.
echo.
ctext.exe "{D6}"
echo (Your energy points have been restored!)
ctext.exe "{D0}"
echo.
pause
call bedroom.bat