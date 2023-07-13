if "%junk%"=="" goto start
goto loopzone
:start
set loop=0
set /p junk=What is the input? 
echo %junk%
:loopzone
if %loop% GEQ 2 goto end
set /a loop+=1
call test_variable.bat
goto loopzone
:end
