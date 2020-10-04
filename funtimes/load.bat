if not exist file.sav goto error
for /F %%a in (file.sav) do set %%a
call start.bat
goto end
:error
cls
echo You have to create a character before you can load it!
echo.
pause
:end