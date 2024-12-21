//scene will be summon when a player touches a trigger
//scene will play and player wont move until it is over
//scene will be deleted but remembered

spr = spr_char_leylow;
sprI = 0;
sprIcons = spr_icons_leylow;
sprIconI = -1;
alph = 1;
playOnce = true;
canDepth = true;
animationId = -1; //unique for each animation
createPartyMember = false;
sprPartyMember = spr_char_leylow;

//format: [xOff, yOff, seconds, sprI, isText, textWhileMoving, isInstantText, ChangesPlyrSpr, plyrSpr, xOffPlyr, xOffPlyr]
//(textWhileMoving clears by force when seconds is finished)
animationMoves = [
	[64, 0, 3, 3, false, [""], false, false, 0, 0, 0],
	[-64, 0, 2, 2, false, [""], false, false, 0, 0, 0],
];
dontAutoContinue = false;
awaitingContinue = false;
cycle = -1;
tick = 1/sec;
xLeft = 0;
yLeft = 0;

xOffPerTick = 0;
yOffPerTick = 0;
visible = true;
alarm[0] = 1;