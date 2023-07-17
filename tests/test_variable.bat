echo The variable is %junk%
if "%poptest%"=="" goto call
goto pop
:call
call test_setp.bat
:pop
