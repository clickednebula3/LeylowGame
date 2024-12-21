animationId = 4;
//format: [xOff, yOff, seconds, sprI, isText, textWhileMoving, isInstantText]
animationMoves = [
	[0, 0, 2, 5, true, ["Hey!"], false, false, 0, 0, 0],	
	[0, 0, 10, 3, true, ["You're here?     \nExploring the cave too?"], false, false, 0, 0, 0],
	[0, 0, 10, 3, true, ["Nice.   \nLet's get at it then!"], false, false, 0, 0, 0],
];
sprI = 2;
yOff = -2*16;
createPartyMember = true;
sprPartyMember = spr_char_leylow;

if (instance_exists(obj_player)) {
	if (array_contains(obj_player.seenAnimations, animationId) || !array_contains(obj_player.seenAnimations, 1)) {
		instance_destroy();
	}
}