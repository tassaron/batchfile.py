:start
cls
set /a posts+=1
if %posts%==42 call level.bat int 1
echo You go on the Yudia forum.
echo.
pause
cls
:choice
set /a choice=%random% %% 12
if %choice%==0 goto 0
if %choice%==1 goto 1
if %choice%==2 goto 2
if %choice%==3 goto 3
if %choice%==4 goto 4
if %choice%==5 goto 5
if %choice%==6 goto 6
if %choice%==7 goto 7
if %choice%==8 goto 8
if %choice%==9 goto 9
if %choice%==10 goto 10
if %choice%==11 goto 11
goto choice
:0
if %posts% GTR 200 goto 12
if %doucheweet%==1 goto 2
echo Some idiot is derailing a thread by talking about how he likes to
echo grope his girlfriend. You give this guy a piece of your mind.
echo No one agrees with your opinion, though. The guy you just insulted
echo is a respected member of the forum.
echo.
pause
goto end
:1
if %posts% GTR 200 goto 12
if %doucheweet%==1 goto 2
echo Some idiot is derailing a thread by talking about how he likes to
echo grope his girlfriend. You give this guy a piece of your mind.
echo The people on the forum sigh with relief.
echo "That guy was a douchebag," seems to be the general consensus.
ctext.exe "{D6}"
echo You gain a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat cha 1
set /a weet+=1
set doucheweet=1
goto end
:2
echo You post around in some threads, but nothing really happens.
echo.
pause
goto end
:3
if %posts% GTR 100 goto 12
echo They see you rollin'. Not lurkin'.
echo They tryin' to catch you postin' dirty.
echo You never post dirty, though, so nothing happin's.
echo.
pause
goto end
:4
if %bolognasalad%==1 goto 4a
echo A wise old man on the forum teaches you how to make bologna salad.
echo.
pause
set bolognasalad=1
goto end
:4a
echo A wise old man on the forum rambles to you about his wife.
echo You log out as quickly as possible.
echo.
pause
goto end
:5
echo You post a bit on the forum, but there's really not much to
echo talk about. Nothing of interest happens.
echo.
pause
goto end
:6
if %posts% GTR 300 goto 12
if %fmysql%==1 goto 7
echo Before you can post, you're hit by a MySQL connection error!
if %mysql%==1 goto 6a
echo Ouch. You don't have a clue how to fix it.
echo You slink away sadly. Maybe you should look up "MySQL" on Wikipedia.
echo.
pause
goto end
:6a
echo Ouch. Good thing you read about MySQL earlier.
echo You fix the forum in five seconds and everyone throws a forum party.
ctext.exe "{D6}"
echo Have a weet point, developer!
ctext.exe "{D0}"
echo.
pause
call level.bat int 1
set fmysql=1
set /a weet+=1
goto end
:7
echo There are no new posts to check, and none to make.
echo Bummer.
echo.
pause
goto end
:8
echo Nothing of interest happens.
echo.
pause
goto end
:9
echo It's a slow day. No one is really posting at the moment.
echo.
pause
goto end
:10
echo You post around as much as you can, but nothing interesting happens.
echo.
pause
goto end
:11
if %patienceweet%==1 goto 11c
echo There are eleven new members on the forum, each dumber than the last.
if %patience%==1 goto 11a
echo %ryan% tells you to calm down, but you don't listen. You banhammer those
echo noobs into oblivion. Some people are happy, but most think you're a power-
echo abusing moron of an admin.
echo.
pause
goto end
:11a
if %rpatience%==1 goto 11b
echo You have mastered the art of patience, but %ryan% hasn't.
echo He banhammers those noobs into oblivion. Some people are happy, but most
echo think %ryan% is a power-abusing moron.
echo.
pause
goto end
:11b
echo You and %ryan% are patient beings, however, so you do nothing.
echo Eventually, those idiots get an idea of what the forum is like.
echo They become respected members, and everyone is happy.
ctext.exe "{D6}"
echo For this act of wisdom, you have received a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat cha 1
call level.bat int 1
set /a weet+=1
set patienceweet=1
goto end
:11c
echo You see something amusing and post "lol" even though you didn't laugh.
echo.
pause
goto end
:12
echo You try to post, but your enormous post count weighs you down.
echo.
goto end
:end