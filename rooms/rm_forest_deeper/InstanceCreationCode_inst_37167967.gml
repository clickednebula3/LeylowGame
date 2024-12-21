animationId = 2;
//format: [xOff, yOff, seconds, sprI, isText, textWhileMoving, isInstantText]
animationMoves = [
	[0, 0, 1, 2, false, [""], false, false, 0, 0, 0],
	[0, 0, 0.5, 5, false, [""], false, false, 0, 0, 0],
	[2*16, 0, 0.6, 3, false, [""], false, false, 0, 0, 0],
	[0, 0, 5, 3, true, ["Hey! You exploring the forest too?"], false, false, 0, 0, 0],
	[0, -6*16, 2, 1, false, [""], false, false, 0, 0, 0],
	[0, 0, 5, 1, true, ["Well, I was until I reached this deadend..."], false, false, 0, 0, 0],
	[0, 0, 4, 0, true, ["Welp, what did I expect?"], false, false, 0, 0, 0],
	[0, 0, 1, 2, false, [""], false, false, 0, 0, 0],
	[0, 0, 4, 0, true, ["Anyways, I'm heading to town"], false, false, 0, 0, 0],
	[0, 2*16, 0.5, 0, false, [""], false, false, 0, 0, 0],
	[32*16, 0, 5, 3, false, [""], false, false, 0, 0, 0],
];
sprI = 2;
yOff = -2*16;

if (instance_exists(obj_player)) {
	if (array_contains(obj_player.seenAnimations, animationId) || !array_contains(obj_player.seenAnimations, 1)) {
		instance_destroy();
	}
}