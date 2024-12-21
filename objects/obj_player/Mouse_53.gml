if (frozen) { return; }

var profile_clicked = collision_point(mouse_x, mouse_y, obj_profile, false, true);
if (profile_clicked == noone) {
	if (obj_chatbox.swapping) {
		if (point_distance(x, y, mouse_x, mouse_y) < clickRadius) {
			var sylla_to_drop_from = sylla_get_by_party_index(obj_chatbox.swap_party_index);
			sylla_drop_item(obj_chatbox.swap_x, obj_chatbox.swap_y, sylla_to_drop_from.owner, mouse_x-8, mouse_y-8, depth-mouse_y+y);
			sylla_to_drop_from.raisedForSwap = false;
			obj_chatbox.swapping = false;
		}
		return;
	}
} else { return; }
//note: just make sure that it is placed on overworld, not on gui or smth


var collAct = collision_line(x, y, mouse_x, mouse_y, obj_interactable, false, true);
var collEnt = collision_line(x, y, mouse_x, mouse_y, obj_screen_moveable, false, true);
var item_spr = sylladex[0][fetch];
	
switch (item_spr) {
	case item_apple: {
		sylla_drop_item(obj_chatbox.swap_x, obj_chatbox.swap_y, self, x-8, y-8, depth-mouse_y+y);
	}
	break;
	case item_bucket_empty: {
		if (collAct != noone) {
			if (collAct.special == "river" && point_distance(x, y, mouse_x, mouse_y) < clickRadius) {
				sylladex[0][fetch] = item_bucket_water;
			}
		}
	}
	break;
	case item_bucket_water: {
		if (collEnt != noone) {
			if (collEnt.spr == spr_farmland && point_distance(x, y, mouse_x, mouse_y) < clickRadius) {
				var item = instance_create_layer(collEnt.x, collEnt.y-16, "Instances", obj_interactable);
				item.isItem = true
				item.spr = item_flower_rainbow;
				sylladex[0][fetch] = item_bucket_empty;
			}
		}
	}
	break;
	case item_bucket_slime: {
		var little_slime = instance_create_depth(mouse_x, mouse_y, depth, obj_mon_slime);
		little_slime.myColor = bucketslimecolor;
		sylladex[0][fetch] = item_bucket_empty;
	}
	break;
	case item_sword: {
		var swordDir = point_direction(x, y-32, mouse_x, mouse_y);
		var mySummonedApple = instance_create_layer(x, y-32, "Instances", obj_bullet);
		mySummonedApple.spr = item_sword;
		mySummonedApple.isPlayerBullet = true;
		mySummonedApple.slicerA = true;
		mySummonedApple.direction = swordDir+45;
		mySummonedApple.image_angle = swordDir;
		mySummonedApple.image_index = 1;
		mySummonedApple.image_xscale = 2;
		mySummonedApple.image_yscale = 2;
		mySummonedApple.speed = 64;
		var mySummonedApple2 = instance_create_layer(x, y-32, "Instances", obj_bullet);
		mySummonedApple2.spr = item_sword;
		mySummonedApple2.isPlayerBullet = true;
		mySummonedApple2.slicerA = false;
		mySummonedApple2.direction = swordDir-45;
		mySummonedApple2.image_angle = swordDir;
		mySummonedApple2.image_index = 2;
		mySummonedApple2.image_xscale = 2;
		mySummonedApple2.image_yscale = 2;
		mySummonedApple2.speed = 64;
	}
	break;
	case item_torch: {
			
	}	
	break;
	case item_wand_fire: {
		var swordDir = point_direction(x, y-32, mouse_x, mouse_y);
		var mySummonedApple = instance_create_layer(x, y-32, "Instances", obj_bullet);
		mySummonedApple.spr = bullet_fireball;
		mySummonedApple.isPlayerBullet = true;
		mySummonedApple.direction = swordDir;
		mySummonedApple.speed = 10;
	}
	break;
	default: { break; }
}