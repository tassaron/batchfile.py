:start
cls
echo You're in The Source, the most expensive electronics shop in the
if %man%==boy echo whole city. Here you can buy parts to upgrade your computer.
if %man%==girl echo whole city. Here you can buy parts to upgrade your computer. All
if %man%==girl echo the nerds are staring at you, which is a bit awkward.
echo.
echo a - Browse the CPUs.
echo b - Check out the RAM.
echo c - Look at other hardware.
echo d - Leave.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="d" goto d
if /i "%choice%"=="stats" goto stats
if /i "%choice%"=="save" goto save
goto choice
:a
cls
echo You walk down into the CPU aisle.
echo.
pause
:cpus
cls
echo Brand new processors cover the shelves, glistening expensively and
echo clouding your vision with capitalist lust. What should you buy?
echo.
echo a - Intel 2.0GHz Celeron ($40)
echo b - AMD Dual-Core Opteron 875 ($150)
echo c - i7 2.66 GHz Quad-Core ($300)
echo d - Get out of this aisle.
echo.
:cpuchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto cpua
if /i "%choice%"=="b" goto cpub
if /i "%choice%"=="c" goto cpuc
if /i "%choice%"=="d" goto cpud
if /i "%choice%"=="stats" goto cpustats
if /i "%choice%"=="save" goto cpusave
goto cpuchoice
:cpua
if %money% LSS 40 goto cpuf
if %cpu1%==1 goto cpuff
cls
echo You grab the Intel 2.0GHz Celeron out of a dusty old crate near the
echo end of the aisle.
ctext.exe "{D4}"
echo Your new processor costs you $40!
ctext.exe "{D0}"
echo.
pause
set /a money-=40
set cpu1=1
goto start
:cpub
if %money% LSS 150 goto cpuf
if %cpu2%==1 goto cpuff
cls
echo You grab the AMD Dual-Core Opteron 875 off the shelf.
ctext.exe "{D4}"
echo Your new processor costs you $150!
ctext.exe "{D0}"
echo.
pause
set /a money-=150
set cpu2=1
goto start
:cpuc
if %money% LSS 300 goto cpuf
if %cpu3%==1 goto cpuff
cls
echo You grab the i7 2.66 GHz Quad-Core off its golden pedestal.
ctext.exe "{D4}"
echo Your new processor costs you $300!
ctext.exe "{D0}"
echo.
pause
set /a money-=300
set cpu3=1
goto start
:cpud
cls
echo You back out of the CPU aisle.
echo.
pause
goto start
:cpustats
call stats.bat
goto cpus
:cpusave
call save.bat
goto cpus
:cpuf
cls
echo You can't afford that!
echo.
pause
goto cpus
:cpuff
cls
echo You already own one of those!
echo.
pause
goto cpus
:b
cls
echo You decide to check out the RAM.
echo.
pause
:ram
cls
echo Various sticks of RAM litter the shelves of Memory Lane. Your computer
echo can only take one stick at a time, so your mix-and-match options are
echo pretty much nil.
echo.
echo a - 2GB ($50)
echo b - 4GB ($90)
echo c - 8GB ($150)
echo d - Get out of this aisle.
echo.
:ramchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto rama
if /i "%choice%"=="b" goto ramb
if /i "%choice%"=="c" goto ramc
if /i "%choice%"=="d" goto ramd
if /i "%choice%"=="stats" goto ramstats
if /i "%choice%"=="save" goto ramsave
goto ramchoice
:rama
if %money% LSS 50 goto ramf
if %ram1%==1 goto ramff
cls
echo You grab a 2GB RAM stick off the shelf.
ctext.exe "{D4}"
echo Your new RAM costs you $50!
ctext.exe "{D0}"
echo.
pause
set /a money-=50
set ram1=1
goto start
:ramb
if %money% LSS 90 goto ramf
if %ram2%==1 goto ramff
cls
echo You grab a 4GB RAM stick off the shelf.
ctext.exe "{D4}"
echo Your new RAM costs you $90!
ctext.exe "{D0}"
echo.
pause
set /a money-=90
set ram2=1
goto start
:ramc
if %money% LSS 150 goto ramf
if %ram3%==1 goto ramff
cls
echo You grab an 8GB RAM stick off the shelf.
ctext.exe "{D4}"
echo Your new RAM costs you $150!
ctext.exe "{D0}"
echo.
pause
set /a money-=150
set ram3=1
goto start
:ramd
cls
echo You back out of Memory Lane.
echo.
pause
goto start
:ramstats
call stats.bat
goto ram
:ramsave
call save.bat
goto ram
:ramf
cls
echo You can't afford that!
echo.
pause
goto ram
:ramff
cls
echo You already own one of those!
echo.
pause
goto ram
:c
cls
echo You flit down a few aisles, looking for anything worthwhile...
echo.
pause
:misc
cls
echo There aren't a lot of useful things for sale at the moment. What
echo should you buy?
echo.
echo a - Linksys wi-fi adaptor ($20)
echo b - Wireless keyboard and mouse ($30)
echo c - 20" HD monitor ($200)
echo d - Don't buy anything.
echo.
:miscchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto misca
if /i "%choice%"=="b" goto miscb
if /i "%choice%"=="c" goto miscc
if /i "%choice%"=="d" goto miscd
if /i "%choice%"=="stats" goto miscstats
if /i "%choice%"=="save" goto miscsave
goto miscchoice
:misca
if %money% LSS 20 goto miscf
if %wifi%==1 goto miscff
cls
echo You pick up the Linksys wi-fi adaptor. This should come in handy.
ctext.exe "{D4}"
echo The adaptor costs you $20!
ctext.exe "{D0}"
echo.
pause
set /a money-=20
set wifi=1
goto start
:miscb
if %money% LSS 30 goto miscf
if %wkam%==1 goto miscff
cls
echo You pick up a wireless keyboard and mouse combo.
ctext.exe "{D4}"
echo It costs you $30!
ctext.exe "{D0}"
echo.
pause
set /a money-=30
set wkam=1
goto start
:miscc
if %money% LSS 200 goto miscf
if %monitor%==1 goto miscff
cls
echo You can barely lift the twenty-inch high-def monitor. Oof!
ctext.exe "{D4}"
echo This monster costs you $200!
ctext.exe "{D0}"
echo.
pause
set /a money-=200
set monitor=1
goto start
:miscd
cls
echo You decide not to buy anything.
echo.
pause
goto start
:miscstats
call stats.bat
goto misc
:miscsave
call save.bat
goto misc
:miscf
cls
echo You can't afford that!
echo.
pause
goto misc
:miscff
cls
echo You already own that!
echo.
pause
goto misc
:d
cls
echo You leave The Source.
echo.
pause
goto end
:stats
call stats.bat
goto start
:save
call save.bat
goto start
:end