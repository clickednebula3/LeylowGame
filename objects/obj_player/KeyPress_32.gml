//if (!frozen) {
//	//create a list of interactables that are in the direction, then read what it has to say
//	interactables = ds_list_create();
//	count = collision_rectangle_list(x+X1, y+Y1, x+X2, y+Y2, obj_interactable, false, true, interactables, true);
//	if (count > 0) {
//		if (interactables[| 0].isItem) {
//			//handle items
			
//			array_push(inventory, interactables[| 0].spr);
//			with (interactables[| 0]) {
//				if (isItem) {
//					//remove barrier touching item
//					//coll = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_collisionbox, false, true);
//					//if (coll != noone) {instance_destroy(coll);}
//				}
//			}
//			instance_destroy(interactables[| 0]);
//		} else {
//			//handle text
//			if (!interactables[| 0].readOnce) {
//				scr_textbox(interactables[| 0].interactText, true);
//				interactables[| 0].readOnce = true;
//			} else {
//				scr_textbox(interactables[| 0].interactText2, true);
//			}
//		}
//	}
//	ds_list_destroy(interactables);
//} else {
//	if (instance_exists(obj_chatbox) && instance_exists(obj_animatable) && !obj_chatbox.on) {
//		obj_animatable.alarm[0] = 1;
//	}
//}