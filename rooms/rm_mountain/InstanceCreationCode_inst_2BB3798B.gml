animationId = 2;
//format: [xOff, yOff, seconds, sprI, isText, theTextWhileMoving, isInstantText]
animationMoves = [
	[0, 0, 1, 2, false, [""], false, true, 2, 0, 0],
	[0, 0, 0.5, 5, false, [""], false, false, 0, 0, 0],
	[2*16, 0, 0.6, 3, false, [""], false, false, 0, 0, 0],
	[0, 0, 0.2, 15, false, [""], false, false, 0, 0, 0],
	[0, 0, 2, 3, true, ["Hai! You exploring the forest too?"], false, false],
	[0, 0, 2, 3, true, ["Hai! You exploring the forest too?"], true, false, 0, 0, 0, ["Leylow..."], [], true],
	[0, 0, 0.3, 3, true, ["hmm?"], false, false],
	[0, 0, 0.3, 3, true, ["hmm?"], true, false, 0, 0, 0, ["What happened to me?", "Who are you?", "How did you find me?", "Where is this place?"], [], true],
	[0, 0, 3, 3, true, ["..."], false, true, 9, 0, 0],
	[0, 0, 10, 3, true, ["I'm an adventurer, and I lost something \nimportant to me in this forest.             \nWhile I was searching, I found you!           \nI have no idea who you are though.                    "], false, true, 2, 0, 0],
	[0, 0, 3, 3, true, ["..."], false, false, 0, 0, 0],
	[0, 0, 3, 7, true, ["I hope we can still be friends though!"], false],
	[0, 0, 3, 7, true, ["I hope we can still be friends though!"], true, false, 0, 0, 0, ["*Trust Leylow", "Are you a kidnapper?"], [3, 4], true],
	[0, 0, 3, 3, false, ["error"], false],//13
	[0, 0, 3, 3, false, ["error"], false],//14
	[0, 0, 3, 3, false, ["error"], false],//15
	[0, 0, 3, 3, false, ["error"], false],//16
	[0, 0, 3, 3, false, ["error"], false],//17
	[0, 0, 3, 3, false, ["error"], false],//18
	[0, 0, 3, 3, false, ["error"], false],//19
	[0, 16*2, 0.3, 0, false, [""], false],
	[16*32, 0, 4, 3, false, [""], false],
];
sprI = 2;
yOff = 2*16;

if (instance_exists(obj_player)) {
	if (array_contains(obj_player.seenAnimations, animationId) || !array_contains(obj_player.seenAnimations, 1)) {
		instance_destroy();
	}
}