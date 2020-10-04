:cpu1
if %cpu1%==0 goto cpu2
cls
echo You have an Intel 2.0GHz Celeron. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:cpu1choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cpu1a
if /i "%choice%"=="b" goto cpu2
if /i "%choice%"=="stats" goto cpu1stats
if /i "%choice%"=="save" goto cpu1save
goto cpu1choice
:cpu1stats
call stats.bat
goto cpu1
:cpu1save
call save.bat
goto cpu1
:cpu1a
cls
ctext.exe "{D6}"
echo You installed a new processor for your computer!
ctext.exe "{D0}"
echo.
pause
set cpu1=0
set cpu1i=1
set cpu2i=0
set cpu3i=0

:cpu2
if %cpu2%==0 goto cpu3
cls
echo You have an AMD Dual-Core Opteron 875. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:cpu2choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cpu2a
if /i "%choice%"=="b" goto cpu3
if /i "%choice%"=="stats" goto cpu2stats
if /i "%choice%"=="save" goto cpu2save
goto cpu2choice
:cpu2stats
call stats.bat
goto cpu2
:cpu2save
call save.bat
goto cpu2
:cpu2a
cls
ctext.exe "{D6}"
echo You installed a new processor for your computer!
ctext.exe "{D0}"
echo.
pause
set cpu2=0
set cpu1i=0
set cpu2i=1
set cpu3i=0

:cpu3
if %cpu3%==0 goto ram1
cls
echo You have an i7 2.66 GHz Quad-Core. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:cpu3choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cpu3a
if /i "%choice%"=="b" goto ram1
if /i "%choice%"=="stats" goto cpu3stats
if /i "%choice%"=="save" goto cpu3save
goto cpu3choice
:cpu3stats
call stats.bat
goto cpu3
:cpu3save
call save.bat
goto cpu3
:cpu3a
cls
ctext.exe "{D6}"
echo You installed a new processor for your computer!
ctext.exe "{D0}"
echo.
pause
set cpu3=0
set cpu1i=0
set cpu2i=0
set cpu3i=1

:ram1
if %ram1%==0 goto ram2
cls
echo You have a 2GB stick of RAM. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:ram1choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto ram1a
if /i "%choice%"=="b" goto ram2
if /i "%choice%"=="stats" goto ram1stats
if /i "%choice%"=="save" goto ram1save
goto ram1choice
:ram1stats
call stats.bat
goto ram1
:ram1save
call save.bat
goto ram1
:ram1a
cls
ctext.exe "{D6}"
echo Your computer now has 2GB of RAM!
ctext.exe "{D0}"
echo.
pause
set ram1=0
set ram1i=1
set ram2i=0
set ram3i=0

:ram2
if %ram2%==0 goto ram3
cls
echo You have a 4GB stick of RAM. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:ram2choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto ram2a
if /i "%choice%"=="b" goto ram3
if /i "%choice%"=="stats" goto ram2stats
if /i "%choice%"=="save" goto ram2save
goto ram2choice
:ram2stats
call stats.bat
goto ram2
:ram2save
call save.bat
goto ram2
:ram2a
cls
ctext.exe "{D6}"
echo Your computer now has 4GB of RAM!
ctext.exe "{D0}"
echo.
pause
set ram2=0
set ram1i=0
set ram2i=1
set ram3i=0

:ram3
if %ram3%==0 goto wifi
cls
echo You have an 8GB stick of RAM. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:ram3choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto ram3a
if /i "%choice%"=="b" goto wifi
if /i "%choice%"=="stats" goto ram3stats
if /i "%choice%"=="save" goto ram3save
goto ram3choice
:ram3stats
call stats.bat
goto ram3
:ram3save
call save.bat
goto ram3
:ram3a
cls
ctext.exe "{D6}"
echo Your computer now has 8GB of RAM!
ctext.exe "{D0}"
echo.
pause
set ram3=0
set ram1i=0
set ram2i=0
set ram3i=1

:wifi
if %wifi%==0 goto wkam
cls
echo You have a Linksys wi-fi adaptor. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:wifichoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto wifia
if /i "%choice%"=="b" goto wkam
if /i "%choice%"=="stats" goto wifistats
if /i "%choice%"=="save" goto wifisave
goto wifichoice
:wifistats
call stats.bat
goto wifi
:wifisave
call save.bat
goto wifi
:wifia
cls
ctext.exe "{D6}"
echo Your computer can now access wireless internet networks!
ctext.exe "{D0}"
echo.
pause
set wifi=0
set wifii=1

:wkam
if %wkam%==0 goto monitor
cls
echo You have a wireless keyboard and mouse. Do you want to install them?
echo.
echo a - Yes.
echo b - No.
echo.
:wkamchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto wkama
if /i "%choice%"=="b" goto monitor
if /i "%choice%"=="stats" goto wkamstats
if /i "%choice%"=="save" goto wkamsave
goto wkamchoice
:wkamstats
call stats.bat
goto wkam
:wkamsave
call save.bat
goto wkam
:wkama
cls
ctext.exe "{D6}"
echo Now you can type from the comfort of your bed and only lse half th lettrs!
ctext.exe "{D0}"
echo.
pause
set wkam=0
set wkami=1

:monitor
if %monitor%==0 goto power
cls
echo You have a 30" HD monitor. Do you want to install it?
echo.
echo a - Yes.
echo b - No.
echo.
:monitorchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto monitora
if /i "%choice%"=="b" goto power
if /i "%choice%"=="stats" goto monitorstats
if /i "%choice%"=="save" goto monitorsave
goto monitorchoice
:monitorstats
call stats.bat
goto monitor
:monitorsave
call save.bat
goto monitor
:monitora
cls
ctext.exe "{D6}"
echo Now you can use your monitor to beat goats to death!
ctext.exe "{D0}"
echo.
pause
set monitor=0
set monitori=1

:: DETERMINE POWER LEVEL
:power
set power=1
set extras=0
set cpu=486SX
set ram=1GB
if %cpu1i%==1 set /a power+=1
if %cpu1i%==1 set cpu=Intel 2.0GHz Celeron
if %cpu2i%==1 set /a power+=2
if %cpu2i%==1 set cpu=AMD Dual-Core Opteron 875
if %cpu3i%==1 set /a power+=3
if %cpu3i%==1 set cpu=i7 2.66 GHz Quad-Core
if %ram1i%==1 set /a power+=1
if %ram1i%==1 set ram=2GB
if %ram2i%==1 set /a power+=2
if %ram2i%==1 set ram=4GB
if %ram3i%==1 set /a power+=3
if %ram3i%==1 set ram=8GB
if %wifii%==1 set /a power+=1
if %wifii%==1 set /a extras+=1
if %wkami%==1 set /a power+=1
if %wkami%==1 set /a extras+=1
if %monitori%==1 set /a power+=1
if %monitori%==1 set /a extras+=1
goto start

:: DISPLAY
:start
cls
if "%cpu%"=="486SX" echo You're running a 486SX with %ram% of RAM.
if not "%cpu%"=="486SX" echo You're running an %cpu% with %ram% of RAM.
if %extras% GTR 0 goto extras
goto powerlevel
:extras
if %extras%==1 goto 1extra
if %extras%==2 goto 2extra
if %extras%==3 echo You also have a Linksys wi-fi adaptor, a wireless keyboard and mouse,
if %extras%==3 echo and a 30" HD monitor.
goto powerlevel
:1extra
if %wifii%==1 echo You also have a Linksys wi-fi adaptor.
if %wkami%==1 echo You also have a wireless keyboard and mouse.
if %monitori%==1 echo You also have a 30" HD monitor.
goto powerlevel
:2extra
if %wifii%==1 goto 2extra1
if %wkami%==1 goto 2extra2
if %monitori%==1 goto 2extra3
:2extra1
if %wkami%==1 echo You also have  a Linksys wi-fi adaptor and a wireless keyboard and mouse.
if %monitori%==1 echo You also have a Linksys wi-fi adaptor and a 30" HD monitor.
goto powerlevel
:2extra2
if %wifii%==1 echo You also have a Linksys wi-fi adaptor and a wireless keyboard and mouse.
if %monitori%==1 echo You also have a 30" HD monitor and a wireless keyboard and mouse.
goto powerlevel
:2extra3
if %wifii%==1 echo You also have a Linksys wi-fi adaptor and a 30" HD monitor.
if %wkami%==1 echo You also have a 30" HD monitor and a wireless keyboard and mouse.
goto powerlevel

:powerlevel
if %power%==1 echo Your computer is terrible. (System rating %power%.)
if %power%==2 echo Your computer is really bad. (System rating %power%.)
if %power%==3 echo Your computer is pretty bad. (System rating %power%.)
if %power%==4 echo Your computer is mediocre. (System rating %power%.)
if %power%==5 echo Your computer is okay. (System rating %power%.)
if %power%==6 echo Your computer is decent. (System rating %power%.)
if %power%==7 echo Your computer is pretty good. (System rating %power%.)
if %power%==8 echo Your computer is quite good. (System rating %power%.)
if %power%==9 echo Your computer is great. (System rating %power%.)
if %power%==10 echo Your computer is legendary. (System rating %power%.)
if %power% GTR 10 echo Error 102. (System rating %power%.) Report this to Bran immediately.
echo.
pause
if not %power%==10 goto end
if %powerweet%==1 goto end
cls
ctext.exe "{D6}"
echo You have a legendary computer! Have yourself a weet point!
ctext.exe "{D0}"
echo.
pause
set powerweet=1
set /a weet+=1
call level.bat int 2
:end