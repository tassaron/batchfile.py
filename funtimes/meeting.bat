set metgirl=1
:start
cls
echo You're at the mall. %katie% catches your eye as you enter.
echo "Hey!" she calls to you. You respond as un-awkwardly as possible:
echo "H-h-h-h-hey!"
echo You should really work on that stutter!
echo.
pause
:start1
cls
echo "What did you want to go to the mall for?" %katie% asks. Now's time
echo to choose...
echo.
echo a - Go to Galaxy.
echo b - Go to Metro.
echo c - Go to Pizza Pizza.
echo d - Go to The Source.
echo.
:choice
set /p choice=Where do you want to go? 
if /i "%choice%"=="a" goto galaxy
if /i "%choice%"=="b" goto metro
if /i "%choice%"=="c" goto pizza
if /i "%choice%"=="d" goto source
if /i "%choice%"=="save" goto save
if /i "%choice%"=="stats" goto stats
goto choice
:save
call save.bat
goto start1
:stats
call stats.bat
goto start1

:: CHOICES
:galaxy
cls
echo You decide to take %katie% to Galaxy.
echo "I didn't know Galaxy was open this early," she says as you enter.
echo "I'm not sure why it is, really," you reply. "They don't actually
echo play movies until later in the day."
echo.
pause
call level.bat dex 1
:galaxy1
cls
echo "Oh," she says. "Why did you want to come here, then?"
echo.
echo a - Just watch the previews, look at posters, etc.
echo b - Let's play some freakin' pinball! ($1)
if %popcorn%==1 goto sharepop
echo c - Buy popcorn and share it with %katie%. ($500)
echo.
goto galaxychoice
:sharepop
echo c - Share your popcorn with %katie%.
echo.
:galaxychoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto galaxya
if /i "%choice%"=="b" goto galaxyb
if /i "%choice%"=="c" goto galaxyc
if /i "%choice%"=="save" goto galaxysave
if /i "%choice%"=="stats" goto galaxystats
goto galaxychoice
:galaxya
cls
echo "I just wanted to watch the previews," you say, pointing at one
echo of the many TV screens along the walls. Every set is showing the
echo same trailer, for some Will Ferrel movie. (It really doesn't
echo matter which one.)
echo.
pause
cls
echo For a full minute you are mesmerized by Will's glorious hairline,
echo until %katie% clears her throat. You break out of your trance.
echo %katie% looks bored.
echo.
pause
call level.bat str 1
:fat
cls
echo You're losing her! It's time to hightail it out of Galaxy...
echo.
echo a - Move to Metro.
echo b - Run to Pizza Pizza.
echo c - Waddle to The Source.
echo d - Abort mission. Abandon %katie%!
echo.
:fatchoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto fatmetro
if /i "%choice%"=="b" goto fatpizza
if /i "%choice%"=="c" goto fatsource
if /i "%choice%"=="d" goto fatfail
if /i "%choice%"=="save" goto fatsave
if /i "%choice%"=="stats" goto fatstats
goto fatchoice
:fatmetro
cls
echo "Hey, um..." you stammer. "I just wanted to see what was playing.
echo Wanna go to Metro now?"
echo %katie% looks relieved.
echo.
pause
goto metro
:fatpizza
cls
echo "Hey, um..." you stammer. "I just wanted to see what was playing.
echo Wanna go to Pizza Pizza now?"
echo %katie% looks relieved.
echo.
pause
goto pizza
:fatsource
cls
echo "Hey, um..." you stammer. "I just wanted to see what was playing.
echo Wanna go to The Source now?" %katie% frowns.
echo "I hate going in there," she says. "Everything is too expensive
echo and the nerds always stare at me."
echo She's got a point.
echo.
pause
goto fat
:fatfail
goto badending
:fatsave
call save.bat
goto fat
:fatstats
call stats.bat
goto fat
:galaxyb
cls
echo "Let's play pinball?" you suggest tentatively. %katie% smiles.
echo You walk over to the pinball machine and reach into your pocket...
echo.
pause
if %money% GTR 0 goto galaxybf
cls
echo You don't have any money! Before %katie% can notice your pennilessness,
echo you get a brilliant idea: check the coin return slot!
echo.
pause
call level.bat int 1
cls
echo Much to your relief, there IS a dollar in there!
echo You drop it in the machine, which comes to life immediately. You hit
echo the bumpers a few times to test them out.
echo.
pause
goto galaxyb2
:galaxybf
cls
echo You drop a dollar into the coin slot. (Yes, a coin dollar.)
ctext.exe "{D4}"
echo A dollar lost is a dollar lost!
ctext.exe "{D0}"
echo But the machine does come to life. You hit the bumpers a few
echo times to test them out.
echo.
pause
set /a money-=1
:galaxyb2
cls
echo "Ready to play?" you say in what you hope is a suave voice. "We'll
echo take turns."
echo %katie% smiles. "Alright."
echo.
pause
call level.bat cha 1
cls
echo For the next hour, you and %katie% take turns playing pinball.
echo When you run out of balls, all you do is check the coin return slot;
echo there's always another dollar in there!
echo.
pause
cls
echo When you started playing, you resolved in your mind that you would
echo let %katie% win at least seventy percent of the time.
echo After a while, this statistic becomes one hundred percent despite
echo your best efforts. This girl is beating your ass at pinball!
echo.
pause
cls
echo Eventually she starts going easier on you until you win a game.
echo "Finally!" you shout triumphantly. She breaks into a fit of giggles.
echo Yeah, she seems to laugh a lot around you. Either she's really into
echo you, or you should consider a career in comedy...
echo.
pause
cls
echo The two of you start making your way towards the exit of the mall.
echo "You're terrible at pinball," %katie% laughs. You can't help but smile.
echo "Thanks for letting me win," you say mock-angrily.
echo "Anytime."
echo.
pause
cls
echo "Have fun?" you press. She looks at you disbelievingly.
echo "Of course I did! Who doesn't like the confidence boost of beating a
if %man%==boy echo grown man at his own game?"
if %man%==girl echo grown woman at her own game?"
echo You smile. This is going rather well.
echo.
pause
cls
echo "I better get going, though," she says, frowning. "I didn't tell my
echo mother where I was going. She'll be worried about me."
echo %katie% is leaning against the door, in no rush to leave.
echo A thought strikes you...
echo.
pause
goto goodending
:galaxyc
if %popcorn%==1 goto galaxyc2
if %money% LEQ 499 goto galaxycf
cls
echo "I just wanted to buy some popcorn."
echo The two of you walk up to the counter and you order a large bag
echo of popcorn. It's pricey, but very, very worth it. %katie% laughs.
echo "I think you're the only person I know who would ever go to a
echo theatre just to buy overpriced popcorn..."
echo.
pause
set /a money-=500
cls
ctext.exe "{D4}"
echo The popcorn costs you $500.
ctext.exe "{D0}"
echo.
pause
:galaxyc2
cls
echo "Want some popcorn?" you ask. She smiles.
echo Over the next hour, you and %katie% wander around the mall idly,
echo eating your popcorn. It's really buttery.
echo.
pause
if %popcorn%==1 set popcorn=0
cls
echo When the bag is empty, the two of you start heading towards the door.
echo "That has to be the most... interesting way I've seen to spend an hour
echo at the mall," %katie% says jokingly.
echo "Fun, though, isn't it?"
echo "Of course it was," she says, smiling. "I better get home, though. My
echo mother will be worried about me. I didn't tell her where I was going."
echo.
pause
goto goodending
:galaxycf
cls
echo "I just wanted to buy some popcorn."
echo The two of you walk up to the counter. You ask the clerk for
echo the price of popcorn, and he tells you that it costs $500.
echo "Five HUNDRED?" you exclaim. "What kind of ridiculous price
echo is that?!"
echo.
pause
cls
echo The clerk shrugs. %katie% looks uncomfortable.
echo "I was just kidding about the popcorn," you lie. "Popcorn is
echo too expensive at a movie theatre. Everyone knows that."
echo This isn't going so well...
echo.
pause
call level.bat dex 1
goto galaxy1
:galaxysave
call save.bat
goto galaxy1
:galaxystats
call stats.bat
goto galaxy1

:metro
cls
echo You decide to take %katie% to Metro.
echo.
pause
:metro1
cls
echo "Are we doing groceries or something?" she asks uncertainly.
echo.
echo a - Yes, we're going to do groceries. ($10)
echo b - Challenge %katie% to a race through the store.
if %shiftyy%==1 goto noshifty
echo c - Introduce her to the shifty guy who hangs out in the aisles.
:noshifty
echo.
:metrochoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto metroa
if /i "%choice%"=="b" goto metrob
if /i "%choice%"=="c" goto metroc
if /i "%choice%"=="save" goto metrosave
if /i "%choice%"=="stats" goto metrostats
goto metrochoice
:metroa
if %food%==1 goto metroaf
cls
echo "Yeah, we're doing groceries," you say. %katie% laughs. "What?"
echo "Nothing," she says. "I just wasn't expecting that."
echo You're not sure whether that's good or bad. Might as well continue.
echo.
pause
cls
echo Over the next hour, you and %katie% slowly walk through Metro,
echo picking out a variety of food. Not a very large variety, though,
echo since you're only willing to spend ten dollars.
echo "Why only ten dollars?" %katie% asks.
echo "I noticed a long time ago that groceries only seem to last me one
echo meal, no matter how much I buy," you explain. "Thus, I only ever
echo buy ten dollars' worth of food, which seems to be the minimum I can
echo have without having too little to make one meal."
echo.
pause
cls
echo %katie% looks bewildered.
echo "That makes absolutely no sense," she says.
echo It's video game logic. No one ever understands.
echo.
pause
call level.bat int 1
cls
ctext.exe "{D4}"
echo The food costs you $10.
ctext.exe "{D0}"
echo.
pause
set /a money-=10
set food=1
cls
echo As you leave Metro with a bag full of food, %katie% starts to frown.
echo "I really should get going now," she says. "I didn't tell my mother
echo where I was going, and she'll be worried."
echo "Oh," you say, disappointed.
echo "I had fun, though!" she assures you.
echo.
pause
cls
echo The two of you make your way to the doors. %katie% leans against them,
echo looking back at you.
echo "I'll see you some other time, alright?" she says.
echo.
pause
goto goodending
:metroaf
cls
echo You don't have enough room in your fridge for more food.
echo.
pause
goto metro1
:metrob
cls
echo You decide to challenge %katie%... to a race through Metro!
echo "3 - 2 - 1 - GO!" you yell. You dash away from %katie%, running
echo down an aisle.
if %shiftyy%==1 goto metrobnoshifty
echo You dodge the shifty guy as you go past.
:metrobnoshifty
echo.
pause
call level.bat dex 1
cls
echo You reach the imaginary finish line at the end of the aisle. Leaning
echo over to catch your breath, you take the chance to look back at %katie%.
echo She hasn't budged from where you started. What a spoilsport!
echo.
pause
cls
echo Before you can call her out on her wet-blanketness, you see a security
echo guard pounding up to you, a furious look on his face.
echo Oh. So that's why %katie% didn't want to race.
echo Whoops.
echo.
pause
cls
echo The security guard throws you out of Metro. %katie% comes out shortly
echo afterwards. Your face burns with embarrassment as she rolls her eyes
echo at you.
echo "C'mon, that was just dumb," she says. "Look for security before you
echo do something like that!"
echo.
pause
cls
echo Now that you've been kicked out of Metro, you and %katie% just wander
echo around the mall aimlessly.
echo Not that bad of a situation after all, you suppose.
echo.
pause
cls
echo "I used to race people in the grocery store all the time," %katie%
echo says. "When I was ten." She laughs.
echo "Yeah, yeah," you say in mock-annoyance.
echo.
pause
cls
echo Eventually, you and %katie% start drifting towards the doors.
echo "I really should get going now," she says. "I didn't tell my mother
echo where I was going, and she'll be worried sick if I'm not back soon."
echo You nod your head.
echo.
pause
goto goodending
:metroc
if %shiftyy%==1 goto metrochoice
cls
echo You decide to introduce %katie% to that shifty guy who lurks in
echo the aisles all the time. Why not? It's not like that guy is really
echo shifty or anything...
echo.
pause
call level.bat dex 1
cls
echo The shifty guy looks up as you approach. He looks totally confused.
echo "%katie%," you say. "I'd like you to meet the shifty guy who lurks
echo in the aisles of Metro all the time."
echo %katie% clutches your arm.
echo.
pause
cls
echo "What are you kids doing here?" the shifty guy asks.
echo "Oh, we're just hanging around," you reply smoothly. %katie% is still
echo frightened, so you turn to her.
echo "There's nothing to be afraid of," you assure her. "It's not like this
echo guy is really shifty or anything..."
echo.
pause
cls
echo %katie% calms down a little bit and seems to brace herself against
echo the field of unease that the shifty guy radiates. For some reason you
echo have always been immune to this field!
echo "It's nice to meet you," she lies.
echo.
pause
cls
echo The shifty guy shakes his head. He can tell that she's uneasy and he
echo seems a bit embarrassed, for her sake.
echo "Nice to meet you, too," he says. "But I really gotta get going."
echo He gestures over his shoulder.
echo "Can I talk to you in private for a moment?" he asks you.
echo.
pause
cls
echo You follow him down the aisle until the both of you are out of %katie%'s
echo hearing range.
echo "Listen," the shifty guy tells you. "I know you're trying to impress this
echo girl, but this is NOT the right way to do it."
echo "It's not?"
echo.
pause
cls
echo "I don't know if you've noticed, but" -- the shifty guy points at himself --
echo "I'm actually pretty shifty! Your girl isn't impressed."
echo You look back over your shoulder and see %katie%'s expression. She just looks
echo like she wants to get out of here.
echo.
pause
cls
echo "Sorry for bugging you," you say. The shifty guy shakes his head.
echo "Not a problem. Just take her somewhere nice, alright?" he says. "Not a
echo grocery store, honestly. That doesn't make much sense."
echo You blush in embarrassment and walk back to %katie%.
echo.
pause
cls
echo For the next hour, you and %katie% just walk around the mall aimlessly.
echo "I can't believe you tried to introduce me to someone you barely even know!"
echo she says, laughing. Now that she is out of the shifty guy's field of
echo uneasiness, she's in a better mood about the whole encounter.
echo "It's not like I don't know him at all!" you explain. "I see him at Metro
echo every day. We're almost acquaintances!"
echo.
pause
cls
echo Your conversation continues until you eventually start drifting towards
echo the exit. %katie% leans against the door.
echo "It was great talking to you, %bran%," she says. "But I really have to
echo get going. My mother will be worried if I stick around too long."
echo.
pause
goto goodending
:metrosave
call save.bat
goto metro1
:metrostats
call stats.bat
goto metro1

:pizza
cls
echo You decide to take %katie% to Pizza Pizza.
if %pizzaweet%==1 echo The spotty clerk hides behind the counter as you enter.
echo.
pause
:pizza1
cls
echo "I love Pizza Pizza," %katie% says. "They have perfect pizzas here."
echo.
echo a - Buy one of those perfect pizzas to share with %katie%. ($10)
echo b - Buy a flashlight, play flashlight tag. ($1)
echo c - Strike up a conversation with the spotty clerk.
echo.
:pizzachoice
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto pizzaa
if /i "%choice%"=="b" goto pizzab
if /i "%choice%"=="c" goto pizzac
if /i "%choice%"=="save" goto pizzasave
if /i "%choice%"=="stats" goto pizzastats
goto pizzachoice
:pizzaa
if %pizzaweet%==1 goto pizzaaf
if %money% LEQ 9 goto pizzaaff
cls
echo You walk up to the counter and address the spotty clerk.
echo "My good sir!" you say. "I wish to order one of your perfect pizzas!"
echo The spotty clerk raises an eyebrow.
echo.
pause
cls
ctext.exe "{D4}"
echo The pizza costs you $10.
ctext.exe "{D0}"
echo.
pause
set /a money-=10
cls
echo You eventually get your pizza and sit at one of the tables, sharing
echo it with %katie%. She's giggley throughout your whole conversation,
echo which lasts about an hour.
echo.
pause
call level.bat cha 1
cls
echo "These really are the best in town," she says.
echo "Well, you have to admire their name at least," you answer. "A place
echo called 'Pizza Pizza' doesn't mess around."
echo "I hear there's a new place opening near my house," %katie% tells you.
echo.
pause
cls
echo "What's that place called?"
echo "Pizza Pizza Pizza," she says.
echo Your jaw hits the floor.
echo.
pause
cls
echo "Pizza Pizza PIZZA?!" you say. "That MUST be the best pizzeria in
echo town! It does NOT mess around!"
echo %katie% laughs, mistaking your statement for a joke.
echo "It's not open yet, so we'll just have to wait and see."
echo.
pause
cls
echo You and %katie% eventually finish your meal and start walking towards
echo the doors to the mall. %katie% looks outside and sighs.
echo "Well, I better get going," she says. "I didn't tell my mother where
echo I was going; she'll be worried if I'm not back soon."
echo.
pause
goto goodending
:pizzab
if %pizzaweet%==1 goto pizzabf
if %money% LEQ 9 goto pizzabff
cls
echo You walk up to the spotty clerk.
echo "Can I get a flashlight here?" you ask him. %katie% gives you a look.
echo "They don't sell flashlights here, %bran%," she whispers. The spotty
echo clerk rolls his eyes at the both of you.
echo "Here, have a flashlight," he says.
echo.
pause
cls
ctext.exe "{D4}"
echo The flashlight costs you $1.
ctext.exe "{D0}"
echo.
pause
set /a money-=1
cls
echo "What did you want a flashlight for?" %katie% asks you.
echo You twirl it between your fingers like a baton, smiling.
echo "Ever hear of a little game called... flashlight tag?" you ask.
echo "There's a back room," the spotty clerk adds dully.
echo.
pause
cls
echo Ten minutes later, you and %katie% are alone in the dark. %katie% is
echo it, and you have the flashlight, beaming it around the room.
echo "%katie%?" you call.
echo.
pause
cls
echo There is a silence. You continue looking around the room with your
echo flashlight, peering into cardboard boxes, under overturned tables,
echo and behind a big statue of Dick Feynmale (the famous inventor).
echo.
pause
cls
echo Suddenly, a dark shape smashes you against the floor. It's obviously
echo %katie%. She starts laughing right away.
echo "You're it!" she says.
echo You pick yourself off the floor, rubbing your bruised ass.
echo.
pause
call level.bat str 1
cls
echo "I suppose I am," you say in mock-annoyance. You toss the flashlight
echo to %katie%, who immediately blasts it in your eyes.
echo The two of you continue playing flashlight tag for the next hour.
echo.
pause
cls
echo Eventually, the spotty clerk kicks you out of the room. You and
echo %katie% start heading towards the doors. As you get there, %katie%
echo sighs.
echo "I gotta get going," she says. "I didn't tell my mother where I was
echo going; she'll be worried by now."
echo.
pause
goto goodending
:pizzac
if %pizzaweet%==1 goto pizzacf
cls
echo You walk up to the spotty clerk and try to strike up a conversation.
echo "What's up?"
echo The spotty clerk raises an eyebrow.
echo.
pause
cls
echo "What's... up?" you repeat. He totally ignores you. After a moment,
echo he stops looking at you entirely and just stares off into space.
echo "Hey!" you yell. "WHAT. IS. UP?!"
echo The spotty clerk takes a step backwards. You advance threatening,
echo pressing yourself against the counter.
echo.
pause
call level.bat dex 1
cls
echo %katie% tugs on your sleeve and motions towards the door. You see
echo the spotty clerk reaching for the alarm.
echo Maybe you took this a bit too far!
echo.
pause
:pizza2
cls
echo You hastily apologize to the spotty clerk and leave Pizza Pizza with
echo %katie%. As soon as you're out, she glares at you angrily.
echo "What is WRONG with you?" she says.
echo This isn't going so well! Gotta think quickly...
echo.
echo a - Apologize for your rash actions.
echo b - Make up a good lie.
echo c - Abort mission! Abandon %katie%!
echo.
:pizzachoice1
set /p choice=What do you want to do? 
if /i "%choice%"=="a" goto pizzaa1
if /i "%choice%"=="b" goto pizzab1
if /i "%choice%"=="c" goto badending
if /i "%choice%"=="save" goto pizzasave1
if /i "%choice%"=="stats" goto pizzastats1
goto pizzachoice1
:pizzaa1
cls
echo "I'm really, really sorry about that," you say. "I don't know what came
echo over me..."
echo %katie% rolls her eyes. "You're such a psycho."
echo "I was just trying to make a joke!" you say defensively.
echo %katie% frowns.
echo.
pause
call level.bat int 1
cls
echo Despite that little roadblock, %katie% and you get along quite well. You
echo wander around the mall aimlessly for the next hour or so, and she slowly
echo melts and forgives your terrible joke. The two of you stay far away from
echo Pizza Pizza, though, just in case. Let the spotty clerk forget about you.
echo.
pause
cls
echo Eventually the two of you start to head towards the doors.
echo "I really gotta get going," %katie% says. "I didn't tell my mother where
echo I was going; she'll be worried by now."
echo "Alright," you say. %katie% frowns.
echo "Something wrong?"
echo.
pause
cls
echo "Are you still mad at me for that thing in Pizza Pizza?"
echo "Of course not!" she says. "I told you it was okay. We wouldn't have hung
echo out so long if I didn't think it was."
echo You try your best to believe this. You force a smile.
echo.
pause
cls
echo "Don't worry about it," %katie% assures you.
echo You'll try not to. But as she stands there in front of you, her hand on
echo the door handle, a thought strikes you...
echo.
pause
goto goodending
:pizzab1
cls
echo You can cheat your way out of this. Cheating always works! Just gotta
echo think up a good lie...
echo %katie% continues to glare at you.
echo.
pause
call level.bat dex 1
cls
echo "I was possessed!" you say.
echo "Possessed?" %katie% repeats sarcastically. "By whom, may I ask?"
if %shifty%==1 goto pizzab1shifty
echo "By a demon!" And when she doesn't look convinced, you add, "By a demon's
echo souls!"
goto pizzab1shifty2
:pizzab1shifty
echo "By the shifty guy who lurks in Metro all the time!"
:pizzab1shifty2
echo.
pause
cls
echo %katie% sighs.
echo "I thought you were different, %bran%," she says. "I really did. Why aren't
echo there any nice %man%s in this city?"
echo And she walks away.
echo You watch her leave, stunned.
echo.
pause
cls
echo How could this happen? ...
echo As the tears start to flow, you break into a sprint. Gotta get away from
echo this mall... Anywhere but here.
echo.
pause
goto badending1
:pizzasave1
call save.bat
goto pizza2
:pizzastats1
call stats.bat
goto pizza2
:pizzaaf
cls
echo You try to buy a pizza, but the spotty clerk is cowering
echo behind the counter. You simply can't get him to come out!
echo.
pause
goto pizzaf
:pizzaaff
cls
echo You don't have enough money to buy a pizza!
echo.
pause
goto pizza1
:pizzabf
cls
echo You try to buy a flashlight, but the spotty clerk is cowering
echo behind the counter. You simply can't get him to come out!
echo.
pause
goto pizzaf
:pizzabff
cls
echo You don't have any money to buy a flashlight with!
echo.
pause
goto pizza1
:pizzacf
cls
echo You try to talk to the spotty clerk, but he's cowering
echo behind the counter. You simply can't get him to come out!
echo.
pause
goto pizzaf
:pizzaf
cls
echo "The service in this place, I swear..." you say jokingly.
echo %katie% just looks confused.
echo "Never mind," you add hastily. "Let's just walk around a bit."
echo.
pause
cls
echo %katie% agrees. The two of you walk through the mall over the
echo course of the next hour or so, talking idly.
echo "What are your cousins like?" she asks.
echo "What cousins?"
echo.
pause
cls
echo "The ones you took to the mall earlier?"
echo "Oh, right," you say meekly. "Those cousins... They're alright
echo I guess. Nothing too special to say."
echo "Ah. I don't have any cousins."
echo.
pause
cls
echo Eventually you start wandering in the direction of the doors.
echo "I should really head home," %katie% says. "I didn't tell my
echo mother where I was going; she might be worried by now."
echo "Oh, okay..." you answer sadly.
echo.
pause
cls
echo "I had a great time, %bran%," she says.
echo You smile at her.
echo And as she stands there, a thought strikes you...
echo.
pause
goto goodending
:pizzasave
call save.bat
goto pizza1
:pizzastats
call stats.bat
goto pizza1

:source
cls
echo "You want to check out The Source?" you ask. %katie% frowns.
echo "I hate going in there," she says. "Everything is too expensive
echo and the nerds always stare at me."
echo She's got a point.
echo.
pause
cls
echo Where should you go instead?
echo.
echo a - Go to Galaxy.
echo b - Go to Metro.
echo c - Go to Pizza Pizza.
echo.
:sourcechoice
set /p choice=Where do you want to go? 
if /i "%choice%"=="a" goto galaxy
if /i "%choice%"=="b" goto metro
if /i "%choice%"=="c" goto pizza
if /i "%choice%"=="save" goto sourcesave
if /i "%choice%"=="stats" goto sourcestats
goto sourcechoice
:sourcesave
call save.bat
goto sourcechoice
:sourcestats
call stats.bat
goto sourcechoice


:: POTENTIAL ENDINGS
:badending
cls
echo "ABORT MISSION!" you scream. %katie% backs away from you in fright.
echo Before she can say anything, you run away.
echo.
pause
:badending1
cls
echo You arrive back at your house, your legs burning from the run back.
echo Sprinting really takes a lot out of you. You wipe tears away with
echo the back of your hand. Are these tears from the wind as you ran, or
echo the tears of a broken heart?
echo.
pause
cls
echo There's no way you'll ever be able to contact %katie% again. Not after
echo a stunt like that. You break down on the couch, sobbing at your own
echo worthlessness.
echo.
pause
cls
echo A few hours later, you snap out of it.
echo Back to your old self. Put those dark thoughts behind you.
echo.
pause
set love=0
set energy=0
call livingroom.bat
:goodending
cls
echo She looks so beautiful in the hideous fluorescent lighting of the mall
echo that it suddenly strikes you just how much you would like to kiss her.
echo But this wasn't supposed to be a date, so you resist. Maybe she just
echo sees you as a friend...
if %man%==girl echo Are you even sure she's a lesbian?
echo.
pause
cls
echo "I'll see you later, %katie%," you say, waving. She turns around and
echo waves back to you, walking backwards towards her home.
echo She turns a corner and disappears onto an unfamiliar street.
echo.
pause
cls
ctext.exe "{D6}"
echo That seemed to go smoothly. Have a weet point!
ctext.exe "{D0}"
echo.
pause
call level.bat cha 1
set love=2
set /a weet+=1
:end