:start
cls
echo Before you know it, the darkness grows too thick to see through.
echo You can easily carry onwards in search of... something... but it's
echo going to be tough.
echo.
echo a - Venture to the left.
echo b - Venture to the right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice1
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto choice2
if /i "%choice%"=="b" goto end
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash1
if /i "%choice%"=="save" call save.bat & goto start
if /i "%choice%"=="stats" call stats.bat & goto start
goto choice1
:flash1
if %flash% LEQ 0 goto choice1
echo Your flashlight reveals that LEFT is the best direction, then burns out.
set /a flash-=1
goto choice1


:choice2
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice2a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto choice3
if /i "%choice%"=="b" goto end
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash2
if /i "%choice%"=="save" call save.bat & goto choice2
if /i "%choice%"=="stats" call stats.bat & goto choice2
goto choice2a
:flash2
if %flash% LEQ 0 goto choice2a
echo Your flashlight reveals that LEFT is the best direction, then burns out.
set /a flash-=1
goto choice2a


:choice3
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice3a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto choice4
if /i "%choice%"=="b" goto end
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash3
if /i "%choice%"=="save" call save.bat & goto choice3
if /i "%choice%"=="stats" call stats.bat & goto choice3
goto choice3a
:flash3
if %flash% LEQ 0 goto choice3a
echo Your flashlight reveals that LEFT is the best direction, then burns out.
set /a flash-=1
goto choice3a


:choice4
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice4a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto end
if /i "%choice%"=="b" goto choice4b
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash4
if /i "%choice%"=="save" call save.bat & goto choice4
if /i "%choice%"=="stats" call stats.bat & goto choice4
goto choice4a
:flash4
if %flash% LEQ 0 goto choice4a
echo Your flashlight reveals that RIGHT is the best direction, then burns out.
set /a flash-=1
goto choice4a

:choice4b
if %hobo%==1 goto choice5
cls
echo Before you can get to the next crossroads, you run into a disheveled
echo old homeless man. He pushes you backwards violently.
echo "Hands off!" he yells, slurring his words. "You can't get through
echo here until you give me seventeen bucks!"
echo.
pause
:choice4bb
cls
echo The man is obviously going to use the money on booze. Should you really
echo be helping this particular kind of needy?
echo.
echo a - Yeah, give him $17.
echo b - Screw him!
echo.
:choice4ba
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto hobopay
if /i "%choice%"=="b" goto hoboscrew
if /i "%choice%"=="save" call save.bat & goto choice4bb
if /i "%choice%"=="stats" call stats.bat & goto choice4bb
goto choice4ba

:hobopay
if %money% GEQ 17 goto hobopay1
cls
echo You reach into your pocket, only to find that you don't have the
echo money he's asking for!
echo The hobo advances on you menacingly. His eyes start to glow.
echo "Money!" he screams, slobbering everywhere. "NOW!!"
echo.
echo a - Run like the hills!
echo b - Kick this hobo's ass.
echo.
:hobopaychoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto hoborun
if /i "%choice%"=="b" goto hobofight
if /i "%choice%"=="save" call save.bat & goto hobopay
if /i "%choice%"=="stats" call stats.bat & goto hobopay
goto hobopaychoice

:hobopay1
cls
echo You toss the hobo a seventeen-dollar bill. He catches it in his
echo filthy hands and stuffs it into his pocket.
echo "Thank ye kindly," he says, tipping his hobo cap.
echo He wanders off into the darkness.
ctext.exe "{D4}"
echo You lost $17 to the hobo!
ctext.exe "{D0}"
echo.
pause
set /a money-=17
cls
echo I know you were expecting to get a weet point for that, but really?
echo Giving an obvious alcoholic money is just dumb. I more or less
echo stated that before asking you if you wanted to give him your money.
echo It's your own fault if you're disappointed!
echo.
pause
set hobo=1
goto choice5

:hoboscrew
cls
echo "No way," you tell the hobo. "Get out of here!"
echo The hobo advances on you menacingly. His eyes start to glow.
echo "Money!" he screams, slobbering everywhere. "NOW!!"
echo.
echo a - Run like the hills!
echo b - Kick this hobo's ass.
echo.
:hoboscrewchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto hoborun
if /i "%choice%"=="b" goto hobofight
if /i "%choice%"=="save" call save.bat & goto hoboscrew
if /i "%choice%"=="stats" call stats.bat & goto hoboscrew
goto hoboscrewchoice

:hoborun
cls
echo You turn around and make a mad dash for your front door!
echo Of course you get lost about a dozen times on the way there,
echo but you do eventually make it...
echo.
pause
goto end2

:hobofight
cls
echo "Don't you threaten me!" you yell. "You're a drunk! I can get
echo you help."
echo "The only help I need is seventeen dollars!" he screams. His
echo eyes are glowing again. He starts to wave his arms around.
echo.
pause
call fight.bat 2
if %hp% LEQ 0 goto hobofail
cls
echo The psychic hobo collapses onto the grimy pavement of the alleyway,
echo groaning in pain.
echo "No more!" he cries. "You may pass!"
echo.
pause
cls
ctext.exe "{D6}"
echo You cleared out the rubble! Have a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
cls
echo On your way past the hobo, you reach into his pocket to take what
echo money he's managed to swindle so far.
ctext.exe "{D6}"
echo You find $34!
ctext.exe "{D0}"
echo.
pause
cls
echo "Now," you say sternly. "I want you to go to a homeless shelter,
echo join Alcoholics Anonymous, get a job, whatever. Just leave my
echo neighbourhood alone."
echo The psychic hobo doesn't answer. You leave.
echo.
pause
set /a money+=34
set hobo=1
goto choice5

:hobofail
cls
echo You collapse backwards onto the grimy pavement in the alleyway.
echo The psychic hobo uses this opportunity to advance on you, pulling
echo you up to his eye level so he can scream in your face,
echo "MONEY! NOW!!"
echo.
pause
cls
echo You kick the hobo in the gut with your knee. He stumbles backwards,
echo losing his grip on you and allowing you a chance to run away.
echo Of course, you get lost a dozen times on your way back. But eventually
echo you make it home.
echo.
pause
cls
echo That drunk probably won't even remember you next time he sees you.
echo You should figure out a strategy before facing him again.
echo.
pause
goto end2

:choice5
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice5a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto choice6
if /i "%choice%"=="b" goto end
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash5
if /i "%choice%"=="save" call save.bat & goto choice5
if /i "%choice%"=="stats" call stats.bat & goto choice5
goto choice5a
:flash5
if %flash% LEQ 0 goto choice5a
echo Your flashlight reveals that LEFT is the best direction, then burns out.
set /a flash-=1
goto choice5a


:choice6
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice6a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto choice7
if /i "%choice%"=="b" goto end
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash6
if /i "%choice%"=="save" call save.bat & goto choice6
if /i "%choice%"=="stats" call stats.bat & goto choice6
goto choice6a
:flash6
if %flash% LEQ 0 goto choice6a
echo Your flashlight reveals that LEFT is the best direction, then burns out.
set /a flash-=1
goto choice6a

:choice7
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice7a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto end
if /i "%choice%"=="b" goto choice8
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash7
if /i "%choice%"=="save" call save.bat & goto choice7
if /i "%choice%"=="stats" call stats.bat & goto choice7
goto choice7a
:flash7
if %flash% LEQ 0 goto choice7a
echo Your flashlight reveals that RIGHT is the best direction, then burns out.
set /a flash-=1
goto choice7a


:choice8
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice8a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto end
if /i "%choice%"=="b" goto choice9
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash8
if /i "%choice%"=="save" call save.bat & goto choice8
if /i "%choice%"=="stats" call stats.bat & goto choice8
goto choice8a
:flash8
if %flash% LEQ 0 goto choice8a
echo Your flashlight reveals that RIGHT is the best direction, then burns out.
set /a flash-=1
goto choice8a


:choice9
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice9a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto end
if /i "%choice%"=="b" goto choice10
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash9
if /i "%choice%"=="save" call save.bat & goto choice9
if /i "%choice%"=="stats" call stats.bat & goto choice9
goto choice9a
:flash9
if %flash% LEQ 0 goto choice9a
echo Your flashlight reveals that RIGHT is the best direction, then burns out.
set /a flash-=1
goto choice9a


:choice10
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice10a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto end
if /i "%choice%"=="b" goto choice11
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash10
if /i "%choice%"=="save" call save.bat & goto choice10
if /i "%choice%"=="stats" call stats.bat & goto choice10
goto choice10a
:flash10
if %flash% LEQ 0 goto choice10a
echo Your flashlight reveals that RIGHT is the best direction, then burns out.
set /a flash-=1
goto choice10a


:choice11
cls
echo You wander for a few minutes before ending up at another crossroads.
echo.
echo a - Venture left.
echo b - Venture right.
echo c - Venture back to your house.
if %flash% GTR 0 echo d - Use a flashlight. (%flash% left.)
echo.
:choice11a
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto choice12
if /i "%choice%"=="b" goto end
if /i "%choice%"=="c" goto back
if /i "%choice%"=="d" goto flash11
if /i "%choice%"=="save" call save.bat & goto choice11
if /i "%choice%"=="stats" call stats.bat & goto choice11
goto choice11a
:flash11
if %flash% LEQ 0 goto choice11a
echo Your flashlight reveals that LEFT is the best direction, then burns out.
set /a flash-=1
goto choice11a


:choice12
if %shrine%==1 goto choice12a
cls
echo You wander for a few minutes before stumbling on some kind of weird shrine.
echo Upon further inspection, you find out that it is a shrine to Dick Feynmale,
echo creator of weetness! Wow!
echo You have no idea how this got here, but it's pretty dang weet!
ctext.exe "{D6}"
echo You got a weet point!
ctext.exe "{D0}"
echo.
pause
set /a weet+=1
set shrine=1
call level.bat int 1
goto choice12b
:choice12a
cls
echo You wander for a few minutes before finding the shrine to Dick Feynmale,
echo creator of weetness. It's just as impressive now as it was when you first
echo found it!
echo.
pause
:choice12b
cls
echo You say a quick prayer to Feynmale, then trace your steps backwards.
echo.
pause
goto end2
:back
cls
echo You trace your steps backwards until you arrive back at your house.
echo.
pause
goto end2
:end
cls
echo You wander for a a few minutes before ending up back in front of your
echo house. Now how did that happen? Maybe you should bring more flashlights
echo next time you try to explore the alley...
echo.
pause
:end2