interactText = [
	"It is too dark to go deeper into the cave"
];
interactText2 = interactText;
spr=spr_collisionBarrier;

if (array_contains(obj_player.inventory, item_torch)) {
	instance_destroy();
}

alarm[1] = 2;