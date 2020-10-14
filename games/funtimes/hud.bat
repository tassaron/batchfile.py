:: %1 = highness, %2 = wanted, %3 = paranoia
set butt=100
set /a butt-=%1
set poop=0
set /a poop+=%butt%
set /a poop+=%2
set /a poop+=%3
ctext.exe "{1F}"
if %poop% GEQ 50 ctext.exe "{17}" 
if %poop% GEQ 100 ctext.exe "{1E}"
if %poop% GEQ 150 ctext.exe "{16}"
if %poop% GEQ 200 ctext.exe "{1C}"
if %poop% GEQ 250 ctext.exe "{14}"
if %poop% GEQ 275 ctext.exe "{18}"
if %poop% GEQ 300 ctext.exe "{10}"
set health=TONS
if %1 LEQ 75 set health=MOST
if %1 LEQ 50 set health=SOME
if %1 LEQ 25 set health=NO
if %1 LEQ 5 set health=MAYDAY
set pigments=CHLOROPHYLL
if %2 GEQ 25 set pigments=CAROTENOIDS
if %2 GEQ 50 set pigments=ANTHOCYANINS
if %2 GEQ 75 set pigments=XANTHOPHYLLS
if %2 GEQ 95 set pigments=NONE
set terror=NOPE
if %3 GEQ 25 set terror=MEH
if %3 GEQ 50 set terror=MAYBE
if %3 GEQ 75 set terror=ARGH
if %3 GEQ 95 set terror=YES
echo HEALTH: %health%          PIGMENTS: %pigments%           TERRIFIED: %terror%
ctext.exe "{1F}"
echo.