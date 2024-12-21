visible = true;

if (!array_contains(obj_player.inventory, item_sword) || array_contains(obj_player.seenAnimations, 4)) {
	instance_destroy();
}