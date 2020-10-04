:: FUNTIMES BATTLE SYSTEM
:: written by Bran Rainey, 18 July 2010
:: revised for items and improved AI, 19 July 2010
:: 
:: str = power of user's stong attacks
:: dex = user's physical defence
:: cha = power of user's smart attacks
:: int = user's mental defence
:: 
:: nmo = opening enemy (nme) name
:: nme = normal nme name
:: sex = sex of the nme
:: atk# = name of attack #
:: atk#t = attack type of attack # (smart/stong)
:: atk#d = damage of attack #
:: 
:: STONG ATTACKS dmg=%atk#d%-(%dex%/2)
:: SMART ATTACKS dmg=%atk#d%-(%int%/2)
:: Each nme has 5 attacks. 1-2 are stong, 3-4 are smart
:: Attack 5 is always the strongest attack in pure damage
:: Always use attack 5 if it will result in a one-hit KO
:: If user is using more stong attacks (lvl>4), randomly use
:: attacks 1 and 2 only, with 5 as a finisher
:: If user is using more smart attacks (lvl<-4), randomly use
:: attacks 2 and 4 only, with 5 as a finisher
:: 
:: love attack = only accessible if love>=4, triggers
:: the attack type the nme is weakest to, +4 dmg
:: 
:: Attacking with stong increases %lvl%
:: Attacking with smart decreases %lvl%
:: Lvl is added to nmedmg for smart attacks
:: Lvl is subtracted from nmedmg for stong attacks
:: Meaning that more uses of a certain attack type by the user
:: will make them more susceptible to that attack type and less
:: susceptible to the opposite attack type
:: This is a temporary dmg boost/penalty, only affecting one fight
:: 
:: The lvl value also affects which stat is increased afterwards
:: Winning with +lvl: +str, -cha
:: Winning with -lvl: +cha, -str
:: Losing with +lvl: +dex, -int
:: Losing with -lvl: +int, -dex

:start
set hp=100
set atk=1
set lvl=0
set open=0
set fight=%1
:: is the user on drugs?
set ondrugs=0
if %fight%==1 set ondrugs=1
if %fight%==4 set ondrugs=1
if %ondrugs%==1 set loopclear=0
if %ondrugs%==1 set endcls=endcls
goto fight%fight%

:fight1
set nmo=Lenny
set nme=Lenny
set sex=boy
set nmehp=50
set nmedex=8
set nmeint=2
set atk1=gives you an Irish slap
set atk1t=stong
set atk1d=8
if %man%==boy set atk2=uses his stoutness of frame to headbutt your testicles
if %man%==girl set atk2=uses his stoutness of frame to punch you in the stomach
set atk2t=stong
set atk2d=6
set atk3=tries to lure you with his Lucky Charms
set atk3t=smart
set atk3d=4
set atk4=swears himself hoarse with a string of incomprehensible Irishness
set atk4t=smart
set atk4d=2
set atk5=picks up his cauldron spaceship and throws it at you
set atk5t=stong
set atk5d=25
goto fight

:fight2
set nmo=The psychic hobo
set nme=the psychic hobo
set sex=boy
set nmehp=40
set nmedex=2
set nmeint=8
set atk1=levitates a garbage pail into your face
set atk1t=stong
set atk1d=10
set atk2=uses telekinesis to throw a stray cat in your face
set atk2t=stong
set atk2d=15
set atk3=invades your mind with his psychic powers
set atk3t=smart
set atk3d=15
set atk4=gives you a headache
set atk4t=smart
set atk4d=10
set atk5=telepaths an erotic Star Trek fanfic into your mind
set atk5t=smart
set atk5d=30
goto fight

:fight3
set nmo=Your doppelganger
set nme=your doppelganger
set sex=%man%
set nmehp=100
set /a nmedex=%dex%
set /a nmeint=%int%
if %man%==boy set atk1=throws a manly punch
if %man%==girl set atk1=throws a punch
set atk1t=stong
set /a atk1d=%str%-%dex%+5
set atk2=kicks you in the shins
set atk2t=stong
set /a atk2d=%str%-%dex%+5
set atk3=tries to negotiate with you
set atk3t=smart
set atk3d=%cha%-%int%+5
set atk4=insults %ryan%
if %love% GEQ 2 set atk4=insults %katie%
set atk4t=smart
set atk4d=%cha%-%int%+5
set atk5=goes in for the kill
set atk5t=jesus
set atk5d=20
goto fight

:fight4
set nmo=The mountain lion
set nme=the mountain lion
set sex=it
set nmehp=40
set nmedex=0
set nmeint=50
set atk1=claws at you
set atk1t=stong
set atk1d=20
set atk2=bites you
set atk2t=stong
set atk2d=22
set atk3=bides its time
set atk3t=smart
set atk3d=-50
set atk4=doesn't do anything
set atk4t=smart
set atk4d=-50
set atk5=lunges at you viciously
set atk5t=stong
set atk5d=40
goto fight

:fight5
set nmo=The construction worker
set nme=the construction worker
set sex=boy
set nmehp=60
set nmedex=10
set nmeint=4
set atk1=pushes you backwards
set atk1t=stong
set atk1d=15
set atk2=punches you in the face
set atk2t=stong
set atk2d=22
set atk3=yells at you
set atk3t=smart
set atk3d=10
set atk4=tries to bore you by talking about WHMS
set atk4t=smart
set atk4d=12
set atk5=calls his supervisor
set atk5t=smart
set atk5d=30
goto fight

:fight
if %ondrugs%==1 set endcls=endcls
if %ondrugs%==1 goto cls
:endcls
:: if it's the user's turn, skip the AI decisions
if %atk%==2 goto atk
if %atk%==4 goto atk
if %atk%==6 goto atk
if %atk%==8 goto atk
if %atk%==10 goto atk
:: can the AI decide what type to use?
if %lvl% GTR 5 goto smartai
if %lvl% LSS -5 goto stongai
goto skipai
:stongai
:: user is more susceptible to stong attacks, so use those
set /a atk=%random% %% 100
if %atk% LSS 50 set atk=1
if %atk% GTR 50 set atk=3
goto skipai
:smartai
:: user is more susceptible to smart attacks, so use those
set /a atk=%random% %% 100
if %atk% LSS 50 set atk=5
if %atk% GTR 50 set atk=7
goto skipai
:skipai
:: if the amount of damage done by the fifth attack would be
:: enough to kill the user, make sure to use that attack
if %atk5t%==stong set /a aitest=%atk5d%-(%dex%/2)-%lvl%
if %atk5t%==smart set /a aitest=%atk5d%-(%int%/2)+%lvl%
if %atk5t%==jesus set aitest=%atk5d%
if %aitest% GEQ %hp% set atk=9
:atk
if %hp% LEQ 0 set atk=0
goto atk%atk%

:atk1
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
if %open%==0 echo %nmo% goes hostile. You brace yourself for a fight.
set open=1
if %sex%==boy echo He %atk1%!
if %sex%==girl echo She %atk1%!
if %sex%==it echo It %atk1%!
if %atk1t%==stong set /a dmg=%atk1d%-(%dex%/2)
if %atk1t%==smart set /a dmg=%atk1d%-(%int%/2)
if %atk1t%==jesus set dmg=%atk1d%
if %atk1t%==stong set /a dmg-=%lvl%
if %atk1t%==smart set /a dmg+=%lvl%
set /a atk+=1
goto nmedmg
:atk2
set /a atk+=1
goto useratk
:atk3
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
if %sex%==boy echo He %atk2%!
if %sex%==girl echo She %atk2%!
if %sex%==it echo It %atk2%!
if %atk2t%==stong set /a dmg=%atk2d%-(%dex%/2)
if %atk2t%==smart set /a dmg=%atk2d%-(%int%/2)
if %atk2t%==jesus set dmg=%atk2d%
if %atk2t%==stong set /a dmg-=%lvl%
if %atk2t%==smart set /a dmg+=%lvl%
set /a atk+=1
goto nmedmg
:atk4
set /a atk+=1
goto useratk
:atk5
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
if %sex%==boy echo He %atk3%!
if %sex%==girl echo She %atk3%!
if %sex%==it echo It %atk3%!
if %atk3t%==stong set /a dmg=%atk3d%-(%dex%/2)
if %atk3t%==smart set /a dmg=%atk3d%-(%int%/2)
if %atk3t%==jesus set dmg=%atk3d%
if %atk3t%==stong set /a dmg-=%lvl%
if %atk3t%==smart set /a dmg+=%lvl%
set /a atk+=1
goto nmedmg
:atk6
set /a atk+=1
goto useratk
:atk7
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
if %sex%==boy echo He %atk4%!
if %sex%==girl echo She %atk4%!
if %sex%==it echo It %atk4%!
if %atk4t%==stong set /a dmg=%atk4d%-(%dex%/2)
if %atk4t%==smart set /a dmg=%atk4d%-(%int%/2)
if %atk4t%==jesus set dmg=%atk4d%
if %atk4t%==stong set /a dmg-=%lvl%
if %atk4t%==smart set /a dmg+=%lvl%
set /a atk+=1
goto nmedmg
:atk8
set atk=1
:: don't let atk be >8 without AI decisions
goto useratk
:atk9
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
if %sex%==boy echo He %atk5%!
if %sex%==girl echo She %atk5%!
if %sex%==it echo It %atk5%!
if %atk5t%==stong set /a dmg=%atk5d%-(%dex%/2)
if %atk5t%==smart set /a dmg=%atk5d%-(%int%/2)
if %atk5t%==jesus set dmg=%atk5d%
if %atk5t%==stong set /a dmg-=%lvl%
if %atk5t%==smart set /a dmg+=%lvl%
set /a atk+=1
goto nmedmg
:atk10
set atk=1
goto useratk

:nmedmg
if %dmg% GTR 0 set /a hp-=%dmg%
if %dmg% GTR 0 echo You take %dmg% damage. You're down to %hp% health.
if %dmg% LEQ 0 echo You take no damage.
echo.
pause
goto fight

:useratk
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
echo How should you retaliate?
echo.
if %man%==boy echo a - Throw a manly punch.
if %man%==girl echo a - Throw a punch.
echo b - Try to negotiate with %nme%.
echo c - Use an item.
if %love% GEQ 4 echo d - Channel the power of love.
echo.
:choice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto a
if /i "%choice%"=="b" goto b
if /i "%choice%"=="c" goto c
if /i "%choice%"=="d" goto d
if /i "%choice%"==stats goto stats
if /i "%choice%"==save goto save
call item.bat 1
if %nmehp% LEQ 0 goto end
if %useditem%==1 goto fight
goto choice

:: use a stong attack
:a
set /a lvl+=1
set /a dmg=%str%-%nmedex%
if %dmg% LSS 0 set dmg=0
set /a nmehp-=%dmg%
if %ondrugs%==1 set endcls=a1
if %ondrugs%==1 goto cls
:a1
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
if %man%==boy echo You throw a manly punch at %nme%!
if %man%==girl echo You throw a punch at %nme%!
if %dmg%==0 echo It doesn't seem to make a mark!
if %sex%==boy goto boy
if %sex%==it goto it
if not %dmg%==0 echo She recoils in pain, taking %dmg% damage.
goto notboy
:boy
if not %dmg%==0 echo He recoils in pain, taking %dmg% damage.
goto notboy
:it
if not %dmg%==0 echo It recoils in pain, taking %dmg% damage.
:notboy
echo.
pause
if %nmehp% LEQ 0 goto end
goto fight

:: use a smart attack
:b
set /a lvl-=1
set /a dmg=%cha%-%nmeint%
if %dmg% LSS 0 set dmg=0
set /a nmehp-=%dmg%
if %nmehp% LEQ 0 goto end
if %ondrugs%==1 set endcls=b1
if %ondrugs%==1 goto cls
:b1
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
echo You try to negotiate with %nme%.
if %sex%==boy goto boy1
if %sex%==it goto it1
if %dmg%==0 echo She's too smart to fall for your attempt.
if not %dmg%==0 echo She seems a little convinced, taking %dmg% damage.
goto notboy1
:boy1
if %dmg%==0 echo He's too smart to fall for your attempt.
if not %dmg%==0 echo He seems a little convinced, taking %dmg% damage.
goto notboy1
:it1
if %dmg%==0 echo It's too smart to fall for your attempt.
if not %dmg%==0 echo It seems a little convinced, taking %dmg% damage.
:notboy1
echo.
pause
if %nmehp% LEQ 0 goto end
goto fight

:: use the love attack
:d
if %love% LSS 4 goto choice
if %ondrugs%==1 set endcls=d1
if %ondrugs%==1 goto cls
:d1
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
echo Channeling your undying love for %katie%, with a sprinkle of undying
echo friendship for %ryan%...
ctext.exe "{D6}"
echo BLAM!!
ctext.exe "{D0}"
if %ondrugs%==1 ctext.exe "{1F}"
echo You unleash a powerful LOVE BEAM at %nme%!
if %sex%==boy echo He's violently slammed backwards, almost falling flat on his ass!
if %sex%==girl echo She's violently slammed backwards, almost falling flat on her ass!
if %sex%==it echo It's violently slammed backwards, almost falling flat on its ass!
:: if the nme is more susceptible to cha, attack with that instead
if %nmedex% GEQ %nmeint% goto dstong
set /a dmg=%str%-%nmedex%
set /a dmg+=%love%
set /a nmehp-=%dmg%
echo.
pause
if %nmehp% LEQ 0 goto end
goto fight
:dstong
set /a dmg=%cha%-%nmeint%
set /a dmg+=%love%
set /a nmehp-=%dmg%
echo.
pause
if %nmehp% LEQ 0 goto end
goto fight

:stats
call stats.bat
goto useratk
:save
call save.bat
goto useratk

:: use an item
:c
if %ondrugs%==1 set endcls=c1
if %ondrugs%==1 goto cls
:c1
cls
if %ondrugs%==1 call hud.bat %highness% %wanted% %paranoia%
call item.bat 0
if %items% GTR 0 if %nmehp% LEQ 0 goto end
if %ondrugs%==1 goto lennycheck
if %items%==0 goto useratk
goto fight
:lennycheck
set endcls=endcls
if %items%==0 set endcls=useratk
goto cls

:atk0
goto end

:: use this when user is on drugs
:cls
if %loopclear%==0 goto loopclear
goto loop
:loopclear
set loop=0
set /a paranoia+=1
set loopclear=1
:loop
echo.
set /a loop+=1
if %loop%==21 goto loopend
goto cls
:loopend
set loopclear=0
goto %endcls%

:end
if %hp% LEQ 0 goto def
set /a energy-=1
if %lvl% GTR 0 call level.bat str 1
if %lvl% LSS 0 call level.bat cha 1
goto end2
:def
set energy=0
if %lvl% GTR 0 call level.bat dex 1
if %lvl% LSS 0 call level.bat int 1
:end2