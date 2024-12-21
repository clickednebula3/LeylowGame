if (array_contains(obj_player.inventory, item_climber)) {
	var interactables = ds_list_create();
	var count = collision_rectangle_list(bbox_left+1, bbox_top+1, bbox_right-1, bbox_bottom-1, obj_collisionbox, false, true, interactables, true);

	for (var i = 0; i < count; i++) {
		instance_destroy(interactables[| i]);
	}

	ds_list_destroy(interactables);
}