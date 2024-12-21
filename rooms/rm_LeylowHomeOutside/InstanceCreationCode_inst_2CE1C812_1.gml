interactText = [
	"Before going to the village, you should try \nto find leylow in the forest"
];
interactText2 = interactText;
spr=spr_collisionBarrier;

if (array_contains(obj_player.seenAnimations, 2)) {
	instance_destroy();
}

alarm[1] = 2;