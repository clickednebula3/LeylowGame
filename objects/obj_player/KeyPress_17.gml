//if (invIndex >= array_length(inventory)) {
//	invIndex = 0;
//} else if (invIndex < 0) {
//	invIndex = array_length(inventory)-1;
//} 

//if (!frozen) {
//	if (array_length(inventory) >= 0 && invIndex < array_length(inventory)) {//if there is item selected
//		var collAct = collision_line(x+X1, y+Y1, x+X2, y+Y2, obj_interactable, false, true);
//		var collEnt = collision_line(x+X1, y+Y1, x+X2, y+Y2, obj_screen_moveable, false, true);
//		if (inventory[invIndex] == item_apple) {
//			var item = instance_create_layer(x-8, y-8, "Instances", obj_interactable);
//			item.isItem = true;
//			item.spr = array_get(inventory, invIndex);
//			array_delete(inventory, invIndex, 1);
//		}
//		else if (inventory[invIndex] == item_bucket && collAct != noone) {
//			if (collAct.spr == spr_pond) {
//				inventory[invIndex] = item_bucket_water;
//			}
//		}
//		else if (inventory[invIndex] == item_bucket_water && collEnt != noone) {
//			if (collEnt.spr == spr_farmland) {
//				var item = instance_create_layer(collEnt.x, collEnt.y-16, "Instances", obj_interactable);
//				item.isItem = true
//				item.spr = spr_flower_red;
//				item.sprI = 1;
//				inventory[invIndex] = item_bucket;
//			}
//		}
//	}
//}