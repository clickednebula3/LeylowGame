if (frozen || obj_chatbox.swapping) { return; }
if (collision_point(mouse_x, mouse_y, obj_profile, false, true) != noone) { return; }

//note: just make sure that it is placed on overworld, not on gui or smth

var collAct = collision_line(x, y, mouse_x, mouse_y, obj_interactable, false, true);
var collEnt = collision_line(x, y, mouse_x, mouse_y, obj_screen_moveable, false, true);
var item_spr = sylladex[0][fetch];
	
switch (item_spr) {
	case item_apple: {
		
	}
	break;
	case item_bucket_empty: {
		if (collAct != noone) {
			
		} else {
			var coll_slime = collision_point(mouse_x, mouse_y, obj_mon_slime, true, false);
			if (instance_exists(coll_slime) && coll_slime.image_xscale < 1) {
				bucketslimecolor = coll_slime.myColor;
				sylladex[0][fetch] = item_bucket_slime;
				instance_destroy(coll_slime);
			}
		}
	}
	break;
	case item_bucket_water_old: {
		if (collEnt != noone) {
			
		}
	}
	break;
	case item_sword: {
		
	}
	break;
	case item_torch: {
			
	}	
	break;
	case item_wand_fire: {
		
	}
	break;
	default: { break; }
}