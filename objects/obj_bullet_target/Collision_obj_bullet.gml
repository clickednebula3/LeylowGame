instance_destroy(other);
image_index = 1;

/// @description Kill Collision
var interactables = ds_list_create();
var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_collisionKiller, false, true, interactables, false);

for (var i = 0; i < count; i++) {
	if (interactables[| i].layer == layer_get_id("Instances")) {
		with (interactables[| i]) { alarm[0] = 1; }
	}
}

ds_list_destroy(interactables);
