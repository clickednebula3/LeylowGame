if (isItem && string_starts_with(sprite_get_name(spr), "spr_chest_")) {
	var myChest = instance_create_depth(x, y, depth, obj_chest);
	myChest.myItem = interactText[0];
	myChest.sprite_index = spr;
	if (sprI != 0) {
		myChest.timeSinceStart = (2*sec) + 1;
	}
}