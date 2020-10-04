:start
set /p choice=What do you want to do? 
if /i "%choice%"=="weet" goto weet
if /i "%choice%"=="money" goto money
if /i "%choice%"=="str" goto str
if /i "%choice%"=="dex" goto dex
if /i "%choice%"=="cha" goto cha
if /i "%choice%"=="int" goto int
if /i "%choice%"=="lion" goto lion
if /i "%choice%"=="clone" goto clone
if /i "%choice%"=="cyard" goto cyard
goto end
:weet
set /p choice=What do you want to do? 
set /a weet+=%choice%
goto end
:money
set /p choice=What do you want to do? 
set /a money+=%choice%
goto end
:str
set /p choice=What do you want to do? 
call level.bat str %choice%
goto end
:dex
set /p choice=What do you want to do? 
call level.bat dex %choice%
goto end
:cha
set /p choice=What do you want to do? 
call level.bat cha %choice%
goto end
:int
set /p choice=What do you want to do? 
call level.bat int %choice%
goto end
:lion
color 1F
set paranoia=50
set highness=50
set wanted=50
call fight.bat 4
set paranoia=0
set highness=0
set wanted=0
color D0
call bedroom.bat
goto end
:clone
call fight.bat 3
call bedroom.bat
goto end
:cyard
call cyard.bat
call bedroom.bat
goto end
:end