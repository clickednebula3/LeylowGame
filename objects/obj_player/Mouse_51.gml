//invIndex = clamp(invIndex, 0, array_length(inventory)-1);

if (frozen || obj_chatbox.swapping) { exit; }
if (point_distance(x, y, mouse_x, mouse_y) >= clickRadius) { exit; }
if (collision_point(mouse_x, mouse_y, obj_profile, false, true) != noone) { return; }



//create a list of interactables that are in the direction, then read what it has to say
var interactables = ds_list_create();
var count = collision_point_list(mouse_x, mouse_y, obj_interactable, false, true, interactables, true);
if (count <= 0) { ds_list_destroy(interactables); exit; }


var clickBlocker = collision_line(x, y, mouse_x, mouse_y, obj_collisionbox, false, true);
if (clickBlocker != noone && !interactables[| 0].bypass_barrier && layer_get_name(clickBlocker.layer) != "Instances") { exit; }

if (interactables[| 0].isItem) {
	//handle items
	var spr = interactables[| 0].spr;
	if (string_starts_with(sprite_get_name(spr), "item_")) {
		var added_success = sylla_add_item(spr, self);
		//array_push(inventory, item_spr);
		if (interactables[| 0].isItem && spr == item_climber) { with (obj_mountain_climbable) { alarm[0] = 1; } }
		if (added_success) { instance_destroy(interactables[| 0]);}
	} else {
		instance_destroy(interactables[| 0]);
	}
} else {
	//handle text
	//todo: use interactables[|0].chatbox_icon in the icon slot
	if (!interactables[| 0].readOnce) {
		scr_textbox(interactables[| 0].interactText, true);
		interactables[| 0].readOnce = true;
	} else {
		scr_textbox(interactables[| 0].interactText2, true);
	}
}
ds_list_destroy(interactables);