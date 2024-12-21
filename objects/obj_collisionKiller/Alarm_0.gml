/// @description Kill Collision
var interactables = ds_list_create();
var interactables2 = ds_list_create();
var interactables3 = ds_list_create();
var interactables4 = ds_list_create();
var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_collisionbox, false, true, interactables, false);
var count2 = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_collisionKiller, false, true, interactables2, false);
var count3 = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_collisionPotential, false, true, interactables3, false);
var count4 = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_waker, false, true, interactables4, false);

for (var i = 0; i < count; i++) {
	if (interactables[| i].layer == layer_get_id("Instances")) {
		instance_destroy(interactables[| i]);
	}
}
for (var i = 0; i < count2; i++) {
	if (interactables2[| i].layer == layer_get_id("Instances")) {
		with (interactables2[| i]) { alarm[0] = 1; }
	}
}
for (var i = 0; i < count3; i++) {
	if (interactables3[| i].layer == layer_get_id("Instances")) {
		with (interactables3[| i]) { alarm[0] = 1; }
	}
}
for (var i = 0; i < count4; i++) {
	if (interactables4[| i].layer == layer_get_id("Instances")) {
		with (interactables4[| i]) { alarm[0] = 1; }
	}
}

ds_list_destroy(interactables);
ds_list_destroy(interactables2);
ds_list_destroy(interactables3);
ds_list_destroy(interactables4);

instance_destroy();