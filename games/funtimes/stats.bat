if %weet% LSS 0 set weet=0
if %money% LSS 0 set money=0
if %flash% LSS 0 set flash=0
if %energy% LSS 0 set energy=0
color D0
cls
ctext.exe "{1F}CHARACTER STATS:{D0}{\n}"
echo You are a %man% named %bran% %rainey%.
if %weet%==1 echo You currently have %weet% weet point.
if not %weet%==1 echo You currently have %weet% weet points.
echo You have $%money% in your pocket.
if %energy%==1 echo You have %energy% energy point left.
if not %energy%==1 echo You have %energy% energy points left.
if %str% GEQ 15 echo You are quite strong.
if %cha% GEQ 15 echo You have a lot of charisma.
if %dex% GEQ 15 echo You are highly dextrous.
if %int% GEQ 15 echo You are very intelligent.
if %love% LEQ 1 goto nocrush
if %love%==2 echo You have a crush on %katie%.
if %love%==3 echo You're dating %katie%.
if %love% GEQ 4 echo You're in love with %katie%.
:nocrush
echo.
ctext.exe "{1F}ITEMS ON HAND:{D0}{\n}"
echo a pack of ketchup
if %girl%==1 goto girl
goto nogirl
:girl
if %calledgirl%==1 goto girl2
echo a girl's phone number
goto nogirl
:girl2
if %metgirl%==1 goto nogirl
echo %katie%'s phone number
:nogirl
if %outofdrugs%==1 goto skipdrugs
if %drugs%==1 goto drugs
goto skipdrugs
:drugs
if %donedrugs%==1 goto drugsleft
goto notdonedrugs
:drugsleft
echo some drugs
goto skipdrugs
:notdonedrugs
echo some drugs ^(you should probably go share these with %ryan%^)
:skipdrugs
if %bike%==1 echo a bicycle
if %wrench%==1 echo a wrench
if %slushie%==1 echo a slushie from Mac's
if %cpu1%==1 echo an Intel 2.0GHz Celeron
if %cpu2%==1 echo an AMD Dual-Core Opteron 875
if %cpu3%==1 echo an i7 2.66 GHz Quad-Core
if %ram1%==1 echo 2GB of RAM
if %ram2%==1 echo 4GB of RAM
if %ram3%==1 echo 8GB of RAM
if %wifi%==1 echo a Linksys wi-fi adaptor
if %wkam%==1 echo a wireless keyboard and mouse
if %monitor%==1 echo a 20" HD monitor
if %gun%==1 goto gun
goto skipgun
:gun
if %gunsold%==1 goto skipgun
echo a gun
:skipgun
if %ppizza%==1 echo a pizza
if %pppizza%==1 echo a perfect pizza
if %popcorn%==1 echo popcorn
if %flash%==1 echo one flashlight
if %flash% GTR 1 echo %flash% flashlights
echo.
pause