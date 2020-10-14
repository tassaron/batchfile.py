:title
@echo off
mode con: cols=80 lines=42
title HARPER: Recruitment
color F0
echo                      _____ _____ _____ _____ _____ _____ 
echo                     ^|  ^|  ^|  _  ^| __  ^|  _  ^|   __^| __  ^|
echo                     ^|     ^|     ^|    -^|   __^|   __^|    -^|
echo                     ^|__^|__^|__^|__^|__^|__^|__^|  ^|_____^|__^|__^|
echo                     _____________________________________
echo                             +-+-+-+-+-+-+-+-+-+-+-+
echo                             ^(R e c r u i t m e n t^)
echo                             +-+-+-+-+-+-+-+-+-+-+-+
echo.
echo Episode 1 in the Harper saga.
echo.
echo.
echo Press any key to launch bit#OS v0.7
pause >nul
:start
title bit#OS v0.7
color 0A
set portscan=0
set im=0
set iim=0
set data=0
set skip=0
set skipp=0
set breakfort=0
set e8=0
set loop=0
:begin
cls    
echo WELCOME TO bit#OS v0.7
echo (c) 2189 by Bit Corp
echo.
echo loading OS...
ping -n 5 127.0.0.1 >nul
echo.

:: HARPER'S HARD DRIVE
:c
set /p act=C:\^>
if "%act%"=="dir" goto cdir
if "%act%"=="readme.txt" goto creadme
if "%act%"=="cd bit64" echo. & goto bit64
if "%act%"=="cd apps" echo. & goto apps
if "%act%"=="cd docs" echo. & goto docs
if "%act%"=="cd.." echo. & goto c
if "%act%"=="cls" cls & goto c
if "%act%"=="connect 134.168.010.01:4000" goto connect
if %portscan%==1 if "%act%"=="connect 193.147.010.01:4756" goto connect2
if %iim%==1 if "%act%"=="connect 145.019.255.09:6540" goto connect3
if %data% GTR 1 if "%act%"=="connect 001.128.255.33:6666" goto connect4
if %e8% GTR 1 if "%act%"=="connect 192.246.152.18:1945" goto connect5
if %im% GTR 2 if "%act%"=="im.exe" goto cim
echo Bad command or filename
echo.
goto c
:cim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto cimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
echo.
goto c
:cimf
echo unable to connect to server
echo.
goto c
:cdir
echo      bit64 ^<DIR^>
echo      apps ^<DIR^>
echo      docs ^<DIR^>
echo    readme.txt
echo.
goto c
:creadme
echo ^<README.TXT^>
echo Thanks for agreeing to test bit#OS v0.7, Harper. You'll find that most of the
echo commands are similar to old CLIs. Read prior documentation if you can't figure
echo something out. We're still working on making errors more informative. -Trudeau
echo.
goto c
:bit64
set /p act=C:\bit64^>
if "%act%"=="dir" goto bit64dir
if "%act%"=="cmd.sys" goto bit64f
if "%act%"=="beta.dll" goto bit64f
if %skipp%==1 if "%act%"=="skip.com" goto skip
if "%act%"=="cd.." echo. & goto c
if "%act%"=="cls" cls & goto bit64
if "%act%"=="connect 134.168.010.01:4000" goto connect
if %portscan%==1 if "%act%"=="connect 193.147.010.01:4756" goto connect2
if %iim%==1 if "%act%"=="connect 145.019.255.09:6540" goto connect3
if %data% GTR 1 if "%act%"=="connect 001.128.255.33:6666" goto connect4
if %e8% GTR 1 if "%act%"=="connect 192.246.152.18:1945" goto connect5
if %im% GTR 2 if "%act%"=="im.exe" goto bit64im
echo Bad command or filename
echo.
goto bit64
:bit64im
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto bit64imf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
echo.
goto bit64
:bit64imf
echo unable to connect to server
echo.
goto bit64
:bit64dir
echo      .. ^<DIR^>
echo    cmd.sys
echo    beta.dll
if %skipp%==1 echo    skip.com
echo.
goto bit64
:bit64f
echo Access denied
echo.
goto bit64
:skip
echo SKIP.COM - untested beta command, bit#OS v0.8 alpha
echo allows system administrator to skip password prompt with "skip"
echo -DO NOT DISTRIBUTE THIS FILE-
echo.
goto bit64
:apps
set /p act=C:\apps^>
if "%act%"=="dir" goto appsdir
if "%act%"=="email.exe" goto appse
if %breakfort% GTR 0 if "%act%"=="breakfort.exe" goto breakfort
if "%act%"=="cd.." echo. & goto c
if "%act%"=="cls" cls & goto apps
if "%act%"=="connect 134.168.010.01:4000" goto connect
if %portscan%==1 if "%act%"=="connect 193.147.010.01:4756" goto connect2
if %iim%==1 if "%act%"=="connect 145.019.255.09:6540" goto connect3
if %data% GTR 1 if "%act%"=="connect 001.128.255.33:6666" goto connect4
if %e8% GTR 1 if "%act%"=="connect 192.246.152.18:1945" goto connect5
if "%act%"=="email.exe 1" goto e1
if %portscan%==1 if "%act%"=="email.exe 2" goto e2
if %im% GTR 1 if "%act%"=="email.exe 3" goto e3
if %iim%==1 if "%act%"=="email.exe 4" goto e4
if %data% GTR 0 if "%act%"=="email.exe 5" goto e5
if %data% GTR 1 if "%act%"=="email.exe 6" goto e6
if %skip% GTR 1 if "%act%"=="email.exe 7" goto e7
if %skip% GTR 2 if "%act%"=="email.exe 8" goto e8
if %portscan%==1 if "%act%"=="portscan.exe" goto portscan
if %portscan%==1 if "%act%"=="portscan.exe 134.168.010.01" goto portscan1
if %portscan%==1 if "%act%"=="portscan.exe 193.147.010.01" goto portscan2
if %iim%==1 if "%act%"=="portscan.exe 145.019.255.09" goto portscan3
if %data% GTR 1 if "%act%"=="portscan.exe 001.128.255.33" goto portscan4
if %e8% GTR 1 if "%act%"=="portscan.exe 192.246.152.18" goto portscan5
if %im% GTR 0 if "%act%"=="im.exe" goto appsim
echo Bad command or filename
echo.
goto apps
:appsdir
echo      .. ^<DIR^>
echo    email.exe
if %portscan%==1 echo    portscan.exe
if %im% GTR 0 echo    im.exe
if %breakfort% GTR 0 echo    breakfort.exe
echo.
goto apps
:appse
echo loading bit#Email...
ping -n 2 127.0.0.1 >nul
echo WELCOME TO bit#Email v0.7 -- type "email.exe 1" to read first message
echo.
                      echo        SUBJECT           ^|     SENDER
                      echo 1. welcome to bit#Email  ^|  riar@bitco.rp
     if %portscan%==1 echo 2. how's it going?       ^|  trudeau@bitco.rp
        if %im% GTR 1 echo 3. further instructions  ^|  trudeau@bitco.rp
          if %iim%==1 echo 4. yet more instructions ^|  trudeau@bitco.rp
      if %data% GTR 0 echo 5. so the plot thickens  ^|  hailee@bitco.rp
      if %data% GTR 1 echo 6. data.sql has the key! ^|  trudeau@bitco.rp
      if %skip% GTR 1 echo 7. this is a game to you ^|  hailee@bitco.rp
      if %skip% GTR 2 echo 8. ^(NO SUBJECT^)          ^|  trudeau@bitco.rp
echo.
goto apps
:e1
echo.
echo TO     : harper@bitco.rp
echo FROM   : riar@bitco.rp
echo SUBJECT: welcome to bit#Email
echo Thanks for using bit#Email, the official Bit Corp email client. Report any bugs
echo to ^<riar@bitco.rp^>.
echo.
goto apps
:e2
echo.
echo TO     : harper@bitco.rp
echo FROM   : trudeau@bitco.rp
echo SUBJECT: how's it going?
echo How's it going, Harper? Having fun with the new "connect" command?
echo Now don't panic. I'm not going to report you for accessing my computer. In
echo fact, it was me who left that text file on your hard drive so that you would 
echo know how to do so. I know you have more potential than Riar realises, Harper,
echo and I'm here to help.
echo.
echo Now that you have my port scanner, you can use it to locate unsecure ports. I
echo want you to try running "portscan.exe 193.147.010.01". I'm sure you can figure
echo out what to do from there.
echo   -Trudeau
echo.
goto apps
:e3
echo.
echo TO     : harper@bitco.rp
echo FROM   : trudeau@bitco.rp
echo SUBJECT: further instructions
echo I'm a traditionalist. Instant messaging can be useful, but a good email will do
echo the job twice as well. Still, bit#Chatbox will be a great asset for you if you
echo plan on following my instructions. It was removed from v0.7 for "security
echo reasons", because it broadcasts an excess of personal information to everyone
echo in the channel. That may be a hefty privacy concern, but we will make it work
echo to our advantage.
echo.
echo Now that the OS knows the filepath for im.exe, you can run it from anywhere in
echo the system without being in the apps directory. That means you can run it while
echo connected to a remote computer to get instant instruction from me. I'll be able
echo to tell where you are thanks to the aforementioned security bug. It all works
echo out in the end. I will kick you from #bitcorp when I'm finished telling you
echo what to do, so don't worry about missing anything.
echo.
echo Now, connect to 193.147.010.01 and run im.exe. I'll be waiting for you.
echo   -Trudeau
set im=3
echo.
goto apps
:e4
echo.
echo TO     : harper@bitco.rp
echo FROM   : trudeau@bitco.rp
echo SUBJECT: yet more instructions
echo So you know what this is all about now, right? Using newbies to test bit#OS is
echo a scheme put in place to keep up public relations. Bit is always so secretive
echo that the "retirement" of new recruits raises no questions. I was one of the
echo lucky ones. I got through my newbie induction and became what I am today --
echo head of the Newbie Division of Bit Corp. I wasn't able to convince Iradel or
echo any of the others that the whole show was a trick. They bought into the
echo company's image. Don't let yourself do the same.
echo.
echo Riar's right-hand woman is Hailee -- 145.019.255.09:6540
echo (Her password used to be "eggSHELL$$". Let's hope it hasn't changed.)
echo I know she must have something important on her hard drive, but the company
echo is keeping too tight a leash on me. I can't risk connecting myself, so I'm not
echo totally sure what we're looking for. IM me if you get in.
echo.
echo I'm trusting you here, Harper. You know as well as I do what Riar would do if
echo he knew what we were up to. Both of our lives are on the line. Don't screw
echo things up.
echo   -Trudeau
echo.
goto apps
:e5
echo.
echo TO     : harper@bitco.rp
echo FROM   : hailee@bitco.rp
echo SUBJECT: so the plot thickens
echo Not all of us allow unrestricted access to our computers. Some of us have logs
echo to help us out. Just thought you should know. If you mention anything to the
echo ally you obviously have, I will know. All outgoing messages from this IP are
echo being monitored.
echo.
echo Behave yourself.
if %data% LEQ 2 set data=2
echo.
goto apps
:e6
echo.
echo TO     : harper@bitco.rp
echo FROM   : trudeau@bitco.rp
echo SUBJECT: data.sql is the key!
echo I've finished examining the file you gathered from Hailee's fileserver. It's
echo even better than I expected. Data.sql is a database containing the IPs of every
echo Bit-connected computer. That might not sound too useful, but the database also
echo contains a reference to what I would term a "datahaven". This could come in
echo handy for a number of reasons.
echo 1^) it probably has illegal software, to be used as blackmail
echo 2^) this software could be useful to us directly
echo.
echo We have no way of knowing the pass to access the datahaven. In fact, I don't
echo have any of the passwords we'll need to connect to any of Bit Corp's computers.
echo I only know Hailee's pass due to a former engagement of mine ^(which I will not
echo elaborate on for the sake of brevity^). Your current mission is to figure out
echo the password for this datahaven, and hope that I can devise some method of
echo cracking the other fileservers.
echo.
echo The datahaven's IP is 001.128.255.33. Do your best to log in, and IM me once
echo you've done so. Good luck.
echo   -Trudeau
echo.
goto apps
:e7
echo.
echo TO     : harper@bitco.rp
echo FROM   : hailee@bitco.rp
echo SUBJECT: this is a game to you
echo I don't know what you're playing at, hacking into Bit Corp's datahaven. Did you
echo really think we'd let that happen? You're a bigger fool than I thought.
echo.
echo The retirement committee has been dispatched to Trudeau's cubicle. Next time,
echo do not disregard my warnings. I am a woman of my word. Riar will deal with you
echo personally; we wouldn't want bit#OS to reach a premature release, would we?
set /a skip+=1
echo.
goto apps
:e8
echo.
echo TO     : harper@bitco.rp
echo FROM   : trudeau@bitco.rp
echo SUBJECT: ^(NO SUBJECT^)
echo i have no time for words. riar's "committee" is at my door even now! i don't
echo know how riar found out about me, but it's too late to make accusations now.
echo i've left all i can on my former hard drive -- go there now
echo.
echo goodbye.
if %e8% LEQ 1 set e8=1
echo.
goto apps
:portscan
echo Invalid parameters
echo.
goto apps
:portscan1
echo Scanning 134.168.010.01 for open ports...
ping -n 2 127.0.0.1 >nul
echo Port 4000 is open.
echo.
goto apps
:portscan2
echo Scanning 193.147.010.01 for open ports...
ping -n 2 127.0.0.1 >nul
echo Port 4756 is open.
echo.
goto apps
:portscan3
echo Scanning 145.019.255.09 for open ports...
ping -n 2 127.0.0.1 >nul
echo Port 6540 is open.
echo.
goto apps
:portscan4
echo Scanning 001.128.255.33 for open ports...
ping -n 2 127.0.0.1 >nul
echo Port 6666 is open.
echo.
goto apps
:portscan5
echo Scanning 192.246.152.18 for open ports...
ping -n 2 127.0.0.1 >nul
echo Port 1945 is open.
echo.
goto apps
:appsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto appsimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
if %im% GTR 1 goto appsim2
echo ^<trudeau^> Good work, Harper.
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> This is bit#Chatbox, Bit Corp's vision of an IRC client.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> It was packaged with the previous version of bit#OS, as you may have
echo gathered by this point. Of course, this build is severely crippled.
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> It only connects to #bitcorp, and no one comes here anymore.
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> but that doesn't matter right now, does it?
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> Check your email for further instructions.
ping -n 1 127.0.0.1 >nul
set im=2
:appsim2
echo KICKED from #bitcorp by trudeau
echo.
goto apps
:appsimf
echo unable to connect to server
echo.
goto apps
:breakfort
echo Invalid parameters
echo.
goto apps
:docs
set /p act=C:\docs^>
if "%act%"=="dir" goto docsdir
if "%act%"=="passwords.txt" goto docspass
if "%act%"=="cheatsheet.txt" goto docscheat
if %data% GTR 0 if "%act%"=="data.sql" goto data
if "%act%"=="cd.." echo. & goto c
if "%act%"=="cls" cls & goto docs
if "%act%"=="connect 134.168.010.01:4000" goto connect
if %portscan%==1 if "%act%"=="connect 193.147.010.01:4756" goto connect2
if %iim%==1 if "%act%"=="connect 145.019.255.09:6540" goto connect3
if %data% GTR 1 if "%act%"=="connect 001.128.255.33:6666" goto connect4
if %e8% GTR 1 if "%act%"=="connect 192.246.152.18:1945" goto connect5
if %im% GTR 2 if "%act%"=="im.exe" goto docsim
echo Bad command or filename
echo.
goto docs
:docsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto docsimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
echo.
goto docs
:docsimf
echo unable to connect to server
echo.
goto docs
:docsdir
echo      .. ^<DIR^>
echo    passwords.txt
echo    cheatsheet.txt
if %data% GTR 0 echo    data.sql
echo.
goto docs
:docspass
echo ^<PASSWORDS.TXT^>
echo 134.168.010.01:4000
echo user: trudeau
echo pass: Bit4tru
echo.
goto docs
:docscheat
echo ^<CHEATSHEET.TXT^>
echo Remote connection has been simplified in this build of bit#OS.
echo "connect xxx.xxx.xxx.xx:xxxx" will connect to a port of an IP
echo "break" will break the connection and return to C drive
echo.
goto docs
:data
echo bit#OS does not natively recognise '.SQL' files
echo.
goto docs
:connect
echo connecting to 134.168.010.01 on port 4000...
ping -n 3 127.0.0.1 >nul
echo connection success
goto trudeau
:connect2
echo connecting to 193.147.010.01 on port 4756...
ping -n 3 127.0.0.1 >nul
echo connection success
goto iradel
:connect3
echo connecting to 145.019.255.09 on port 6540...
ping -n 3 127.0.0.1 >nul
echo connection success
goto hailee
:connect4
echo connecting to 001.128.255.33 on port 6666...
ping -n 3 127.0.0.1 >nul
echo connection success
goto datahaven
:connect5
echo connecting to 192.246.152.18 on port 1945...
ping -n 3 127.0.0.1 >nul
echo connection success
goto riar


:: TRUDEAU'S HARD DRIVE
:trudeau
echo.
echo ___________                .___                   
echo \__    ___/______ __ __  __^| _/____ _____   __ __ 
echo   ^|    ^|  \_  __ \  ^|  \/ __ ^|/ __ \\__  \ ^|  ^|  \
echo   ^|    ^|   ^|  ^| \/  ^|  / /_/ \  ___/ / __ \^|  ^|  /
echo   ^|____^|   ^|__^|  ^|____/\____ ^|\___ ^>_____ / ____/ 
echo you've connected to bit#Trudeau's fileserver
echo please identify yourself for the system
set /p act=USER: 
if "%act%"=="trudeau" goto pass
echo bad login
goto c
:pass
set /p act=PASS: 
if "%act%"=="Bit4tru" goto success
if %skipp%==1 if "%act%"=="skip" goto skip1
echo bad pass
goto c
:skip1
echo Password skipped by administrator.
:success
echo connected to fileserver as "trudeau"
:trudeauc
echo.
set /p act=C:\^>
if "%act%"=="break" goto break
if "%act%"=="dir" goto tdir
if "%act%"=="cd bit64" goto tbit64
if "%act%"=="cd apps" goto tapps
if "%act%"=="cd docs" goto tdocs
if "%act%"=="readme.txt" goto treadme
if %e8% GTR 0 if "%act%"=="harper.txt" goto treadme2
if %im% GTR 2 if "%act%"=="im.exe" goto trudeauim
echo Bad command or filename
goto trudeauc
:trudeauim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto trudeauimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo ^<trudeau^> What are you doing on my computer, Harper?
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto trudeauc
:trudeauimf
echo unable to connect to server
goto trudeauc
:tdir
echo      bit64 ^<DIR^>
echo      apps ^<DIR^>
echo      docs ^<DIR^>
echo    readme.txt
if %e8% GTR 0 echo    harper.txt
goto trudeauc
:tbit64
echo.
set /p act=C:\bit64^>
if "%act%"=="dir" goto tbit64dir
if "%act%"=="cmd.sys" goto tbit64f
if "%act%"=="beta.dll" goto tbit64f
if "%act%"=="cd.." goto trudeauc
if %im% GTR 2 if "%act%"=="im.exe" goto tbit64im
if "%act%"=="break" goto break
echo Bad command or filename
goto tbit64
:tbit64im
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto tbit64imf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto tbit64
:tbit64imf
echo unable to connect to server
goto tbit64
:tbit64dir
echo      .. ^<DIR^>
echo    cmd.sys
echo    beta.dll
goto tbit64
:tbit64f
echo Access denied
goto tbit64
:tapps
echo.
set /p act=C:\apps^>
if "%act%"=="dir" goto tappsdir
if "%act%"=="cd.." goto trudeauc
if "%act%"=="portscan.exe" goto tportscan
if "%act%"=="email.exe" goto temail
if %im% GTR 2 if "%act%"=="im.exe" goto tappsim
if "%act%"=="break" goto break
echo Bad command or filename
goto tapps
:tappsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto tappsimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto tapps
:tappsimf
echo unable to connect to server
goto tapps
:tappsdir
echo      .. ^<DIR^>
echo    email.exe
echo    portscan.exe
goto tapps
:temail
echo bit#Email does not accept remote connections as of this build
goto tapps
:tportscan
if %portscan%==1 goto tportscanf
echo downloading portscan.exe...
ping -n 3 127.0.0.1 >nul
echo saved to C:\apps
set portscan=1
goto tapps
:tportscanf
echo C:\apps\portscan.exe already exists
goto tapps
:tdocs
echo.
set /p act=C:\docs^>
if "%act%"=="dir" goto tdocsdir
if "%act%"=="cd.." goto trudeauc
if "%act%"=="schedule.txt" goto tschedule
if %im% GTR 2 if "%act%"=="im.exe" goto tdocsim
if "%act%"=="break" goto break
echo Bad command or filename
goto tdocs
:tdocsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto tdocsimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto tdocs
:tdocsimf
echo unable to connect to server
goto tdocs
:tdocsdir
echo      .. ^<DIR^>
echo    schedule.txt
goto tdocs
:tschedule
echo ^<SCHEDULE.TXT^>
echo stage 1: open beta testing of new bit#OS
echo stage 2: accept a newb for testing
echo stage 3: enact Operation Harvester
goto tdocs
:treadme
echo ^<README.TXT^>
echo Don't forget to secure your ports, Trudeau. We can't risk having anyone gain
echo unauthorised access to a Bit computer, even if it's as low-risk as yours. Screw
echo up and I'll make sure that you pay. -Riar
goto trudeauc
:treadme2
echo ^<HARPER.TXT^>
echo Harper,
echo If you're reading this, it means something has gone wrong. I wrote this txt
echo in advance just in case of such a situation. I am sorry for failing you, or you
echo may have failed me; I can't know as of my writing, and it doesn't matter in the
echo long term anyway. I'm probably already... retired.
echo.
echo If you are indeed on my side, read this carefully. The file you retrieved from
echo the datahaven, "breakfort.exe", is just the blackmail material we have been
echo looking for. "Blackmail" is the wrong word, actually -- breakfort is a chip to
echo bargain with. Riar is slowed by urban sprawl: he won't be able to send his men
echo for you faster than you can spread his files, if you catch what I mean.
echo.
echo Data.sql indicates that Riar's IP is 192.246.152.18
echo He'll know you're there once you connect. From there, you can begin to
echo "negotiate". Do what you know is right. I'm trusting you. -Trudeau
set e8=2
goto trudeauc
:break
echo connection to 134.168.010.01 has been broken
echo.
goto c


:: IRADEL'S HARD DRIVE
:iradel
echo.
echo _________ _______  _______  ______   _______  _       
echo \__   __/^(  ____ ^)^(  ___  ^)^(  __  \ ^(  ____ \^( \      
echo    ^) ^(   ^| ^(    ^)^|^| ^(   ^) ^|^| ^(  \  ^)^| ^(    \/^| ^(      
echo    ^| ^|   ^| ^(____^)^|^| ^(___^) ^|^| ^|   ^) ^|^| ^(__    ^| ^|      
echo    ^| ^|   ^|     __^)^|  ___  ^|^| ^|   ^| ^|^|  __^)   ^| ^|      
echo    ^| ^|   ^| ^(\ ^(   ^| ^(   ^) ^|^| ^|   ^) ^|^| ^(      ^| ^|      
echo ___^) ^(___^| ^) \ \__^| ^)   ^( ^|^| ^(__/  ^)^| ^(____/\^| ^(____/\
echo \_______/^|/   \__/^|/     \^|^(______/ ^(_______/^(_______/
echo welcome to bit#Iradel's fileserver
echo my password is "beansauce"...
echo.
set /p act=LOGIN: 
if "%act%"=="iradel" goto pass2
echo bad login
goto c
:pass2
set /p act=PASS: 
if "%act%"=="beansauce" goto success2
if %skipp%==1 if "%act%"=="skip" goto skip2
echo bad pass
goto c
:skip2
echo Password skipped by administrator.
:success2
echo connected to fileserver as "iradel"
:iradelc
echo.
set /p act=C:\^>
if "%act%"=="break" goto break2
if "%act%"=="dir" goto idir
if "%act%"=="cd bit64" goto ibit64
if "%act%"=="cd apps" goto iapps
if "%act%"=="cd docs" goto idocs
if "%act%"=="readme.txt" goto ireadme
if %im% GTR 2 if "%act%"=="im.exe" goto iradelim
echo Bad command or filename
goto iradelc
:iradelim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto iradelimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
if %iim%==1 goto iradelim2
echo ^<trudeau^> good work
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> you'd be surprised how many people can't follow simple steps
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> now, to the chase: this is Iradel's former computer.
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> I say "former" because Iradel is no longer among us. She has
echo been "retired" from Bit Corp.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> She was in much the same situation as yourself, sadly.
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> she was a newbie to Bit, lucky to get a job testing the new build
echo of bit#OS. She didn't follow proper procedures, however: she shared her pass
echo openly, creating a security hole in Bit personnel.
ping -n 4 127.0.0.1 >nul
echo ^<trudeau^> Bit Corp is a very secure company. They couldn't let that go
echo unpunished.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> Iradel disappeared in the night. The build was publicly declared
echo to be a failure, thus funding the further development of bit#OS.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> I know this is a lot to take in. Please check your email again.
ping -n 2 127.0.0.1 >nul
set iim=1
:iradelim2
echo KICKED from #bitcorp by trudeau
goto iradelc
:iradelimf
echo unable to connect to server
goto iradelc
:idir
echo      bit64 ^<DIR^>
echo      apps ^<DIR^>
echo      docs ^<DIR^>
echo    readme.txt
goto iradelc
:ibit64
echo.
set /p act=C:\bit64^>
if "%act%"=="dir" goto ibit64dir
if "%act%"=="cmd.sys" goto ibit64f
if "%act%"=="beta.dll" goto ibit64f
if "%act%"=="cd.." goto iradelc
if %im% GTR 2 if "%act%"=="im.exe" goto ibit64im
if "%act%"=="break" goto break2
echo Bad command or filename
goto ibit64
:ibit64im
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto ibit64imf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto ibit64
:ibit64imf
echo unable to connect to server
goto ibit64
:ibit64dir
echo      .. ^<DIR^>
echo    cmd.sys
echo    beta.dll
goto ibit64
:ibit64f
echo Access denied
goto ibit64
:iapps
echo.
set /p act=C:\apps^>
if "%act%"=="dir" goto iappsdir
if "%act%"=="cd.." goto iradelc
if "%act%"=="email.exe" goto iemail
if "%act%"=="im.exe" goto iim
if "%act%"=="break" goto break2
echo Bad command or filename
goto iapps
:iappsdir
echo      .. ^<DIR^>
echo    email.exe
echo    im.exe
goto iapps
:iemail
echo bit#Email does not accept remote connections as of this build
goto iapps
:iim
if %im% GTR 0 goto iimf
echo downloading im.exe...
ping -n 3 127.0.0.1 >nul
echo saved to C:\apps
set im=1
goto iapps
:iimf
echo C:\apps\im.exe already exists
goto iapps
:idocs
echo.
set /p act=C:\docs^>
if "%act%"=="dir" goto idocsdir
if "%act%"=="cd.." goto iradelc
if "%act%"=="cheatsheet.txt" goto icheatsheet
if %im% GTR 2 if "%act%"=="im.exe" goto idocsim
if "%act%"=="break" goto break2
echo Bad command or filename
goto idocs
:idocsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto idocsimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto idocs
:idocsimf
echo unable to connect to server
goto idocs
:idocsdir
echo      .. ^<DIR^>
echo    cheatsheet.txt
goto idocs
:icheatsheet
echo ^<CHEATSHEET.TXT^>
echo Remote connection has been disabled in this build of bit#OS due to security
echo concerns. The functions will be restored as soon as possible.
goto idocs
:ireadme
echo ^<README.TXT^>
echo Thanks for agreeing to test bit#OS v0.6, Iradel. You'll find that most of the
echo commands are similar to old CLIs. Read prior documentation if you can't figure
echo something out. We're still working on making errors more informative. -Trudeau
goto iradelc
:break2
echo connection to 193.147.010.01 has been broken
echo.
goto c


:: HAILEE'S HARD DRIVE
:hailee
echo.
echo     _/    _/    _/_/    _/_/_/  _/        _/_/_/_/  _/_/_/_/   
echo    _/    _/  _/    _/    _/    _/        _/        _/          
echo   _/_/_/_/  _/_/_/_/    _/    _/        _/_/_/    _/_/_/       
echo  _/    _/  _/    _/    _/    _/        _/        _/            
echo _/    _/  _/    _/  _/_/_/  _/_/_/_/  _/_/_/_/  _/_/_/_/       
echo bit#Hailee's protected fileserver
echo trespassing forbidden
echo.
set /p act=LOGIN: 
if "%act%"=="hailee" goto pass3
echo bad login
goto c
:pass3
set /p act=PASS: 
if "%act%"=="eggSHELL$$" goto success3
if %skipp%==1 if "%act%"=="skip" goto skip3
echo bad pass
goto c
:skip3
echo Password skipped by administrator.
:success3
echo connected to fileserver as "hailee"
:haileec
echo.
set /p act=C:\^>
if "%act%"=="break" goto break3
if "%act%"=="dir" goto hdir
if "%act%"=="cd bit64" goto hbit64
if "%act%"=="cd apps" goto happs
if "%act%"=="cd docs" goto hdocs
if %data% GTR 1 if "%act%"=="readme.txt" goto hreadme
if "%act%"=="im.exe" goto haileeim
echo Bad command or filename
goto haileec
:haileeim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto haileeimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto haileec
:haileeimf
echo unable to connect to server
goto haileec
:hdir
echo      bit64 ^<DIR^>
echo      apps ^<DIR^>
echo      docs ^<DIR^>
if %data% GTR 1 echo    readme.txt
goto haileec
:hreadme
echo ^<README.TXT^>
echo You should never return to the scene of a crime, Harper. Consider yourself
echo lucky that I have better things to do than close my ports. Enjoy. -Hailee
goto haileec
:hbit64
echo.
set /p act=C:\bit64^>
if "%act%"=="dir" goto hbit64dir
if "%act%"=="cmd.sys" goto hbit64f
if "%act%"=="beta.dll" goto hbit64f
if "%act%"=="cd.." goto haileec
if "%act%"=="im.exe" goto hbit64im
if "%act%"=="break" goto break3
echo Bad command or filename
goto hbit64
:hbit64im
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto hbit64imf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto hbit64
:hbit64imf
echo unable to connect to server
goto hbit64
:hbit64dir
echo      .. ^<DIR^>
echo    cmd.sys
echo    beta.dll
goto hbit64
:hbit64f
echo Access denied
goto hbit64
:happs
echo.
set /p act=C:\apps^>
if "%act%"=="dir" goto happsdir
if "%act%"=="cd.." goto haileec
if "%act%"=="email.exe" goto hemail
if "%act%"=="break" goto break3
if "%act%"=="im.exe" goto happsim
echo Bad command or filename
goto happs
:happsdir
echo      .. ^<DIR^>
echo    email.exe
goto happs
:hemail
echo bit#Email does not accept remote connections as of this build
goto happs
:happsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto happsimf
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
echo KICKED from #bitcorp by trudeau
goto happs
:happsimf
echo unable to connect to server
goto happs
:hdocs
echo.
set /p act=C:\docs^>
if "%act%"=="dir" goto hdocsdir
if "%act%"=="cd.." goto haileec
if "%act%"=="im.exe" goto hdocsim
if "%act%"=="schedule.txt" goto hschedule
if "%act%"=="data.sql" goto hdata
if "%act%"=="break" goto break3
echo Bad command or filename
goto hdocs
:hdocsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
if %im%==4 goto hdocsimf2
echo connected to #bitcorp
echo.
ping -n 1 127.0.0.1 >nul
if %data% GTR 1 goto hdocsimf
echo ^<trudeau^> well, it seems that there's less on this drive than I thought there
echo would be. Still, data.sql looks like it could come in handy...
ping -n 2 127.0.0.1 >nul
:hdocsimf
echo KICKED from #bitcorp by trudeau
goto hdocs
:hdocsimf2
echo unable to connect to server
goto hdocs
:hdocsdir
echo      .. ^<DIR^>
echo    schedule.txt
echo    data.sql
goto hdocs
:hschedule
echo ^<SCHEDULE.TXT^>
echo stage 1: open beta testing of new bit#OS
echo stage 2: accept a newb for testing
echo stage 3: enact Operation Harvester
goto hdocs
:hdata
if %data% GTR 0 goto hdataf
echo downloading data.sql...
ping -n 3 127.0.0.1 >nul
echo saved to C:\docs
set data=1
goto hdocs
:hdataf
echo C:\docs\data.sql already exists
goto hdocs
:break3
echo connection to 145.019.255.09 has been broken
echo.
goto c


:: DATAHAVEN
:datahaven
echo.
echo           { --.\  ^|       
echo            '-._\\ ^| ^(\___ 
echo                `\\^|{/ - _^)
echo            .'^^^^^^^^^^^^^^  /`  
echo           //\   ^) ,  /    
echo     ,  _.'/  `\^<-- \^< 
echo      `^^^^^^`     ^^^^   ^^^^  
echo authorised personnel must use bit#Riar's account ONLY
echo password is always the latest classified operation
echo.
set /p act=LOGIN: 
if "%act%"=="riar" goto pass4
echo bad login
goto c
:pass4
set /p act=PASS: 
if "%act%"=="Harvester" goto success4
if "%act%"=="harvester" goto success4
if "%act%"=="HARVESTER" goto success4
if %skipp%==1 if "%act%"=="skip" goto skip4
echo bad pass
goto c
:skip4
echo Password skipped by administrator.
:success4
echo connected to fileserver as "riar"
:datahavenc
if %im% LEQ 4 set im=4
echo.
set /p act=C:\^>
if "%act%"=="break" goto break4
if "%act%"=="dir" goto ddir
if "%act%"=="cd bit64" goto dbit64
if "%act%"=="cd apps" goto dapps
if "%act%"=="cd docs" goto ddocs
if "%act%"=="readme.txt" goto dreadme
if "%act%"=="im.exe" goto datahavenim
echo Bad command or filename
goto datahavenc
:datahavenim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
echo unable to connect to server
goto datahavenc
:ddir
echo      bit64 ^<DIR^>
echo      apps ^<DIR^>
echo      docs ^<DIR^>
echo    readme.txt
goto datahavenc
:dreadme
echo ^<README.TXT^>
echo Data is currently being moved to a more secure location. Use this datahaven to
echo back up high-risk material ONLY. For more info, contact ^<riar@bitco.rp^>.
goto datahavenc
:dbit64
echo.
set /p act=C:\bit64^>
if "%act%"=="dir" goto dbit64dir
if "%act%"=="cmd.sys" goto dbit64f
if "%act%"=="beta.dll" goto dbit64f
if "%act%"=="skip.com" goto dskip
if "%act%"=="cd.." goto datahavenc
if "%act%"=="im.exe" goto dbit64im
if "%act%"=="break" goto break4
echo Bad command or filename
goto dbit64
:dbit64im
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
echo unable to connect to server
goto dbit64
:dbit64dir
echo      .. ^<DIR^>
echo    cmd.sys
echo    beta.dll
echo    skip.com
goto dbit64
:dbit64f
echo Access denied
goto dbit64
:dskip
if %skipp%==1 goto dbit64f
echo downloading skip.com...
ping -n 3 127.0.0.1 >nul
echo saved to C:\bit64
set /a skip+=1
set skipp=1
goto dbit64
:dapps
echo.
set /p act=C:\apps^>
if "%act%"=="dir" goto dappsdir
if "%act%"=="cd.." goto datahavenc
if "%act%"=="breakfort.exe" goto dbreakfort
if "%act%"=="break" goto break4
if "%act%"=="im.exe" goto dappsim
echo Bad command or filename
goto dapps
:dappsdir
echo      .. ^<DIR^>
echo    breakfort.exe
goto dapps
:dappsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
echo unable to connect to server
goto dapps
:dbreakfort
if %breakfort% GTR 0 goto dbreakfortf
echo downloading breakfort.exe...
ping -n 3 127.0.0.1 >nul
echo saved to C:\apps
set breakfort=1
set /a skip+=1
goto dapps
:dbreakfortf
echo C:\apps\breakfort.exe already exists
goto dapps
:ddocs
echo.
set /p act=C:\docs^>
if "%act%"=="dir" goto ddocsdir
if "%act%"=="cd.." goto datahavenc
if "%act%"=="im.exe" goto ddocsim
if "%act%"=="schedule.txt" goto dschedule
if "%act%"=="break" goto break4
echo Bad command or filename
goto ddocs
:ddocsim
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
echo unable to connect to server
goto ddocs
:ddocsdir
echo      .. ^<DIR^>
echo    schedule.txt
goto ddocs
:dschedule
echo ^<SCHEDULE.TXT^>
echo stage 1: open beta testing of new bit#OS
echo stage 2: accept a newb for testing
echo stage 3: enact Operation Harvester
goto ddocs
:break4
echo connection to 001.128.255.33 has been broken
echo.
goto c


:: RIAR'S CUTSCENE
:riar
echo.
echo  ____  ____    __    ____ 
echo ^(  _ \^(_  _^)  /__\  ^(  _ \
echo  ^)   / _^)^(_  /^(__^)\  ^)   /
echo ^(_^)\_^)^(____^)^(__^)^(__^)^(_^)\_^)
echo access is strictly forbidden to all
echo.
set /p act=LOGIN: 
if "%act%"=="riar" goto pass5
echo bad login
goto c
:pass5
set /p act=PASS: 
if %skipp%==1 if "%act%"=="skip" goto skip5
echo bad pass
goto c
:skip5
echo Password skipped by administrator.
echo connected to fileserver as "riar"
:riarc
echo.
set /p act=C:\^>
:clsloop
ping -n 1 127.0.0.1 >nul
echo.
set /a loop+=1
if %loop%==42 goto cls
goto clsloop
:cls
cls
echo bit#OS v0.7 has encountered an error...
ping -n 3 127.0.0.1 >nul
echo loading bit#Chatbox...
ping -n 2 127.0.0.1 >nul
echo connected to #bitcorp
echo.
ping -n 3 127.0.0.1 >nul
echo ^<riar^> This is where I draw the line.
ping -n 4 127.0.0.1 >nul
echo ^<riar^> Your game is over, newbie. And such a shame. We could have used people
echo like you in Bit Corp.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> I'm not going anywhere.
ping -n 4 127.0.0.1 >nul
echo ^<riar^> And why shouldn't you?
ping -n 3 127.0.0.1 >nul
echo ^<harper^> I have breakfort.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> This hard drive isn't all. I have copies.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> I have dozens of copies.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> I have envelopes.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> I have the internet.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> I have other computers.
ping -n 4 127.0.0.1 >nul
echo ^<riar^> And?
ping -n 5 127.0.0.1 >nul
echo ^<harper^> Don't play dumb with me. I know breakfort is classified.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> It was in your datahaven.
ping -n 4 127.0.0.1 >nul
echo ^<riar^> You really are a piece of work, newbie.
ping -n 3 127.0.0.1 >nul
echo ^<riar^> You think I became head of Bit Corp by leaving classified files on an
echo ABANDONED datahaven? That's rich.
ping -n 6 127.0.0.1 >nul
echo ^<riar^> Incredibly stupid, but rich.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> what are you talking about?
ping -n 4 127.0.0.1 >nul
echo ^<riar^> I cleared out the datahaven as soon as I saw that you were accessing
echo Hailee's computer illegally.
ping -n 5 127.0.0.1 >nul
echo ^<riar^> breakfort.exe isn't classified. I left it there because it wasn't.
ping -n 6 127.0.0.1 >nul
echo ^<harper^> ...
ping -n 3 127.0.0.1 >nul
echo ^<harper^> You're lying.
ping -n 3 127.0.0.1 >nul
echo ^<riar^> Stop deluding yourself, newbie.
ping -n 2 127.0.0.1 >nul
echo ^<riar^> An ego will get you nowhere.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> I'm not a newbie.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> I am Tarasius Harper.
ping -n 3 127.0.0.1 >nul
echo ^<riar^> wow, how meaningful.
ping -n 5 127.0.0.1 >nul
echo incoming connection from 134.168.010.01
ping -n 2 127.0.0.1 >nul
echo trudeau has joined #bitcorp
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> You should have known better, Riar.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> A man like me doesn't sit unarmed. Your committee is dead.
ping -n 5 127.0.0.1 >nul
echo ^<riar^> ...
ping -n 2 127.0.0.1 >nul
echo ^<riar^> plenty more where that came from, I suppose
ping -n 4 127.0.0.1 >nul
echo ^<harper^> None that can reach me before breakfort hits the public.
ping -n 4 127.0.0.1 >nul
echo ^<riar^> Not this again, Harper.
ping -n 5 127.0.0.1 >nul
cls
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> He's not bluffing.
ping -n 5 127.0.0.1 >nul
echo ^<trudeau^> We have your decryption app, Riar, and soon everyone will.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> including the government
ping -n 4 127.0.0.1 >nul
echo ^<riar^> Breakfort.exe is an old version. It can't decrypt anything of worth.
ping -n 5 127.0.0.1 >nul
echo ^<trudeau^> It can decrypt the documents for Operation Harvester.
ping -n 4 127.0.0.1 >nul
echo ^<trudeau^> And it did.
ping -n 6 127.0.0.1 >nul
echo ^<riar^> I don't know what you're talking about.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> "Harvester" is the "latest classified operation"
ping -n 4 127.0.0.1 >nul
echo ^<harper^> the password for YOUR account in the datahaven
ping -n 5 127.0.0.1 >nul
echo ^<trudeau^> the operation that every high-level Bit employee has seen on the
echo schedule for the past several months.
ping -n 6 127.0.0.1 >nul
echo ^<riar^> ...
ping -n 3 127.0.0.1 >nul
echo ^<riar^> what do you want, Trudeau?
ping -n 2 127.0.0.1 >nul
echo ^<riar^> why are you doing this?
ping -n 5 127.0.0.1 >nul
echo ^<trudeau^> I want you to stop abusing your power.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> Just because you have money doesn't mean you're invincible.
ping -n 5 127.0.0.1 >nul
echo ^<riar^> Right.
ping -n 5 127.0.0.1 >nul
echo ^<riar^> I will meet with you tomorrow, Trudeau. Peacefully, if possible.
ping -n 2 127.0.0.1 >nul
echo riar has quit #bitcorp
ping -n 4 127.0.0.1 >nul
echo ^<trudeau^> Mission complete.
ping -n 4 127.0.0.1 >nul
echo ^<harper^> Will Riar meet peacefully?
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> I think so.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> He's ambitious, but not stupid. He knows the power I have now.
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> Or I should say, the power WE have. I couldn't have done this without
echo you, Harper. I've tried to convince every beta tester since the first one to
echo help me out.
ping -n 9 127.0.0.1 >nul
echo ^<trudeau^> You're the first one reckless enough to do so.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> Thanks?
ping -n 3 127.0.0.1 >nul
echo ^<trudeau^> I'll meet you at your cubicle tomorrow.
ping -n 2 127.0.0.1 >nul
echo ^<trudeau^> We'll talk to Riar together.
ping -n 3 127.0.0.1 >nul
echo ^<harper^> Okay.
ping -n 3 127.0.0.1 >nul
echo trudeau has quit #bitcorp
ping -n 5 127.0.0.1 >nul
echo ^<harper^> Wait, how do you know where I live?
ping -n 3 127.0.0.1 >nul
echo ^<harper^> ...
ping -n 3 127.0.0.1 >nul
echo ^<harper^> well, whatever.
ping -n 4 127.0.0.1 >nul
echo you have disconnected from #bitcorp
ping -n 4 127.0.0.1 >nul
set loop=0
:clsloop2
echo.
set /a loop+=1
if %loop%==42 goto credits
goto clsloop2
:credits
cls
ping -n 2 127.0.0.1 >nul
echo THE END
ping -n 4 127.0.0.1 >nul
echo created by Bran Rainey
ping -n 4 127.0.0.1 >nul
echo thanks to Ryan for supporting Harper's creation
ping -n 4 127.0.0.1 >nul
echo inspired somewhat by the works of Bruce Sterling
ping -n 2 127.0.0.1 >nul
echo (mostly "Islands in the Net")
ping -n 6 127.0.0.1 >nul
echo.
echo www.youtube.com/vinceemerson
ping -n 3 127.0.0.1 >nul
echo.
echo Press any key to exit...
pause >nul
echo This file exists to handwave some apparent "plotholes" in Harper: Recruitment. > plotholes.txt
echo. >> plotholes.txt
echo 1. Riar was away from his office for most of the game, as hinted at by Hailee in one >> plotholes.txt
echo of her emails. His claim about "wiping the datahaven" was a lie, thus why breakfort >> plotholes.txt
echo was left there. The datahaven was nearly empty because it was slowly being emptied in >> plotholes.txt
echo favour of using Riar's off-shore computer (which is another story unto itself). >> plotholes.txt
echo. >> plotholes.txt
echo 2. Trudeau killed the "retirement committee" and hacked into Riar's computer while >> plotholes.txt
echo he was distracted by Harper's conversation. That's how Trudeau had access to documents >> plotholes.txt
echo about Operation Harvester. >> plotholes.txt
echo. >> plotholes.txt
echo 3. Harvester documents were so classified as to be encrypted even though they were on >> plotholes.txt
echo Riar's computer. Operation Harvester is very, very illegal. >> plotholes.txt
echo. >> plotholes.txt
echo 4. Breakfort.exe is illegal unto itself because it is capable of decrypting classified >> plotholes.txt
echo government files. However, the unfinished version is not good enough to do much damage, >> plotholes.txt
echo thus why it doesn't frighten Riar too much. (He was also lying about its use in hopes >> plotholes.txt
echo that Harper would give up, until Trudeau entered the conversation.) >> plotholes.txt
echo. >> plotholes.txt
echo 5. Harper's last line makes sense because people in 2189 live in their cubicles. This >> plotholes.txt
echo fact, ironically, is the only real "dystopian" element in the entire story. Not very >> plotholes.txt
echo cyberpunk after all, is it? >> plotholes.txt



:: Everything in this batch file is written by Bran Rainey.
:: Go to www.youtube.com/vinceemerson for awesome junk