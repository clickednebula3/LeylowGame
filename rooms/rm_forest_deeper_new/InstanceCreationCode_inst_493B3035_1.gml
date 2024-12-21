animationId = 5;
//format: [xOff, yOff, seconds, sprI, isText, textWhileMoving, isInstantText]
animationMoves = [
	[0, 0,    1, 1, false, [""], false, false, 0, 0, 0],
	[0, 0,    1, 4, false, [""], false, false, 0, 0, 0],
	[0, 2*32, 0.2, 0, false, [""], false, false, 0, 0, 0],
	[0, 0,    4, 0, true, ["HEY!    \nAre you following me?"], false, false, 0, 0, 0],
	[1*32, 0, 0.25, 3, false, [""], false, false, 0, 0, 0],
	[0, 0,    5, 3, true, ["I'm headed up to  SLAY  THE  DRAGON!"], false, false, 0, 0, 0],
	[0, 0,    4, 0, true, ["huh?   \nYou'ven't heard?"], false, false, 0, 0, 0],
	[0, 0,    5, 0, true, ["The dragon!\nIt's been WRECKING HAVOC ON TOWN!"], false, false, 0, 0, 0],
	[0, 0,    5, 3, true, ["I've had it with it,       \nI'm going over there myself"], false, false, 0, 0, 0],
	[4*32, 0, 1, 3, false, [""], false, false, 0, 0, 0],
	[0, 0,    2, 2, true, ["You should come if you think you can help"], false, false, 0, 0, 0],
	[8*32, 0, 2, 3, false, [""], false, false, 0, 0, 0],
];
spr = spr_char_radthechad;
sprI = 1;

if (instance_exists(obj_player)) {
	if (array_contains(obj_player.seenAnimations, animationId) || !array_contains(obj_player.seenAnimations, 2)) {
		instance_destroy();
	}
}