var interactables = ds_list_create();
var interactables2 = ds_list_create();
var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_slime, false, true, interactables, true);
var count2 = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_spider_deprecated, false, true, interactables2, true);
for (var i = 0; i < count; i++) {
	interactables[| i].isSleeping = false;
}
for (var i = 0; i < count2; i++) {
	interactables2[| i].isSleeping = false;
	interactables2[| i].image_speed = 1;
}
ds_list_destroy(interactables);
ds_list_destroy(interactables2);
instance_destroy();