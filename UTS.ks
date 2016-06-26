CLEARSCREEN. 
local startTime is TIME. 
PRINT "startTime" + startTime.
PRINT "Counting down...".

FROM {local countdown is 3.} UNTIL countdown = 0 STEP {SET countdown to countdown-1.} DO {
	PRINT "..." + countdown. 
	WAIT 1. 
}

STAGE. 

local degree is 0. 
set ran to false.
set ran2 to false.

UNTIL SHIP:ALTITUDE > 24000 {
	SET degree to 47.748*log10(SHIP:ALTITUDE) - 145.33.
    
 IF degree > 0 {
     
	LOCK STEERING TO HEADING(90, 90-degree).
 }
 if (TIME >  startTime + 30) and ran = false { 
     print TIME.
     STAGE.
     set ran to true.
 }
 if TIME = startTime + 69 and ran2 = false {
     STAGE.
     set ran2 to true.
 }
}


STAGE. 
LOCK STEERING TO RETROGRADE. 

WAIT UNTIL SHIP:ALTITUDE < 1500. 
STAGE.