spr = spr_char_leylow;
sprIcons = spr_icons_leylow;
sprIconI = 0;

//format: [xOff, yOff, seconds, sprI, isText, textWhileMoving, isInstantText, ChangesPlayerSpr, playerSpr]
//(textWhileMoving clears by force when seconds is finished)
animationMoves = [
	//[0, 0, 2, 1, false, [""], false, true, 4, 0, 0],
	//[0, 0, 1, 14, false, [""], false, true, 5, 0, 0],
	//[0, 6*16, 1, 0, false, [""], false, true, 6, 0, 0],
	//[-13*16, 0, 2, 2, false, [""], false, true, 7, 0, 0],
	
	//[0, 0, 1, 1, false, [""], false, false, 0, 0, 0],
	//[0, 0, 0.5, 1, false, [""], false, true, 0, 0, 56],
	//[0, 0, 1, 2, false, [""], false, true, 3, 0, 0],
	//[0, 0, 4, 6, true, ["Hey!   \nYou're finally awake!"], false, false, 0, 0, 0],
	
	//[0, 0, 4, 2, true, ["I was worried about you..."], false, false, 0, 0, 0],
	//[0, 3*16, 0.5, 0, false, [""], false, false, 0, 0, 0],
	//[-3*16, 0, 0.5, 2, false, [""], false, true, 0, 0, 0],
	//[0, 0, 3, 1, true, ["My name is Leylow.        \nWhat's yours?"], false, false, 0, 0, 0],
	
	//[0, 0, 0.5, 13, false, [""], false, true, 8, 0, 0],
	//[0, 0, 4, 1, true, ["Huh?        \nYou don't remember?"], false, true, 9, 0, 0],
	//[0, 0, 2.5, 1, true, ["Aw.. \nyou've been hit pretty hard, haven't you?"], false, true, 10, 0, 0],
	//[0, 0, 1.5, 1, true, ["Aw.. \nyou've been hit pretty hard, haven't you?"], true, true, 11, 0, 0],
	
	//[0, 0, 4, 11, true, ["I found you knocked out in the middle of the forest."], false, true, 0, 0, 0],
	//[0, 0, 6, 3, true, ["Which reminds me,     I have to go back-       \nI was looking for something..."], false, false, 0, 0, 0],
	//[0, 3*16, 0.5, 0, false, [""], false, false, 0, 0, 0],
	//[16*16, 0, 2.5, 3, false, [""], false, false, 0, 0, 0],
	
	//[0, 0, 1, 3, false, [""], false, false, 0, 0, 0],
	////[0, 0, 6, 2, true, ["Oh almost forgot!    \nI'm Leylow, and this is my home"], false, false, 0, 0, 0],
	//[0, 0, 6, 2, true, ["Until then, make yourself at home!"], false, false, 0, 0, 0],
	//[0, 12*16, 1.5, 0, false, [""], false, false, 0, 0, 0],
	
	//[0, 0, 1, 0, false, [""], false, true, 12, 0, 0],
];
animationId = 1;