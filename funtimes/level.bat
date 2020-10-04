if %1==str goto str
if %1==dex goto dex
if %1==cha goto cha
if %1==int goto int
echo Error 645
echo.
pause
goto end
:str
set /a str+=%2
set /a cha-=%2
goto end
:dex
set /a dex+=%2
set /a int-=%2
goto end
:cha
set /a cha+=%2
set /a str-=%2
goto end
:int
set /a int+=%2
set /a dex-=%2
:end
if %str% LSS 0 set str=0
if %str% GTR 20 set str=20
if %dex% LSS 0 set dex=0
if %dex% GTR 20 set dex=20
if %cha% LSS 0 set cha=0
if %cha% GTR 20 set cha=20
if %int% LSS 0 set int=0
if %int% GTR 20 set int=20