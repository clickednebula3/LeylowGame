//draw chat box
if (on) {
	draw_sprite(spr_textbox, !(spriteo != spr_empty), camera_get_view_x(camera_get_active())+20, camera_get_view_y(camera_get_active())+260);
	
	if (spriteo != spr_empty) {
		draw_sprite_ext(spriteo, spriteoI, camera_get_view_x(camera_get_active())+room_width-116, camera_get_view_y(camera_get_active())+room_height-132, 2, 2, 0, c_white, 0.8);
	}


	if (!sansay) {
		draw_text(camera_get_view_x(camera_get_active())+70, camera_get_view_y(camera_get_active())+302, myText[lineCurrentIndex]);
		//testHERE
		var cX = view_wport[0]-240;
		var cY = 220;
		for (var choiceIndex = 0; choiceIndex < array_length(choiceText); choiceIndex++) {
			if (
				mouse_x > camera_get_view_x(camera_get_active())+cX &&
				mouse_x < camera_get_view_x(camera_get_active())+cX+150 &&
				mouse_y > camera_get_view_y(camera_get_active())+cY-(50*choiceIndex) &&
				mouse_y < camera_get_view_y(camera_get_active())+cY+50-(50*choiceIndex)
			) {
				draw_sprite_stretched(
					spr_textboxsmol, 1,
					camera_get_view_x(camera_get_active())+cX, camera_get_view_y(camera_get_active())+cY-(50*choiceIndex),
					220, 50
				);
				if (mouse_check_button_pressed(mb_left)) {
					if (choiceIndex >= 0 && choiceIndex < array_length(choiceAnimIds)) {
						if (!array_contains(obj_player.seenAnimations, choiceAnimIds[choiceIndex])) {
							array_push(obj_player.seenAnimations, choiceAnimIds[choiceIndex]);
						}
					}
					choiceText = [];
					choiceAnimIds = [];
					if (lineCurrentIndex+1 < array_length(myText)) { alarm[2] = 1; }
					else { alarm[0] = 1; }
					dontAutoContinue = false;
					break;
				}
			} else {
				draw_sprite_stretched(
					spr_textboxsmol, 0,
					camera_get_view_x(camera_get_active())+cX, camera_get_view_y(camera_get_active())+cY-(50*choiceIndex),
					220, 50
				);
			}
			draw_text(camera_get_view_x(camera_get_active())+cX+15, camera_get_view_y(camera_get_active())+cY+15-(50*choiceIndex), choiceText[choiceIndex]);
		}
		//testendHERE
	}
	else {
		if (letterCurrentIndex == 1) { santext = ""; }
		if (letterCurrentIndex <= string_length(myText[lineCurrentIndex])) {
			if (canSanTimer) {
				alarm[1] = sec/spd;
				canSanTimer = false;
			}
		} else {
			if (lineCurrentIndex+1 < array_length(myText)) {
				if (canLineTimer) {
					alarm[2] = sec*2;
					canLineTimer = false;
				}
			} else {
				if (canClearTimer) {
					alarm[0] = sec*3;
					canClearTimer = false;
				}
			}
		}
		draw_text(camera_get_view_x(camera_get_active())+70, camera_get_view_y(camera_get_active())+302, santext);
	}

} else {
	
}

#region
//draw player inventory too
//for (var i=0; i < array_length(obj_player.inventory); i++) {
//	var spr = obj_player.inventory[i];
//	if (
//		mouse_x > camera_get_view_x(camera_get_active())+30+i*20 &&
//		mouse_x < camera_get_view_x(camera_get_active())+50+i*20 &&
//		mouse_y > camera_get_view_y(camera_get_active())+6 &&
//		mouse_y < camera_get_view_y(camera_get_active())+26
//	) {
//		if (mouse_check_button_pressed(mb_right)) {
//			array_delete(obj_player.inventory, i, 1);
//			array_push(obj_player.inventory, spr);
//		} else if (mouse_check_button_pressed(mb_left)) {
//			array_delete(obj_player.inventory, i, 1);
//			array_insert(obj_player.inventory, 0, spr);
//		}
//		draw_sprite(item_back, 2, camera_get_view_x(camera_get_active())+30+i*20, camera_get_view_y(camera_get_active())+6);
//	} else {
//		if (i == obj_player.invIndex) {
//			draw_sprite(item_back, 1, camera_get_view_x(camera_get_active())+30+i*20, camera_get_view_y(camera_get_active())+6);
//		} else {
//			draw_sprite(item_back, 0, camera_get_view_x(camera_get_active())+30+i*20, camera_get_view_y(camera_get_active())+6);
//		}
//	}
//	if (spr == item_sword || spr == item_wand_fire) {
//		draw_sprite_ext(spr, 0, camera_get_view_x(camera_get_active())+2+32+i*20, camera_get_view_y(camera_get_active())+14+8, 16/sprite_get_width(spr), 16/sprite_get_height(spr), 45, c_white, 0.9);
//	} else {
//		draw_sprite_ext(spr, 0, camera_get_view_x(camera_get_active())+32+i*20, camera_get_view_y(camera_get_active())+8, 16/sprite_get_width(spr), 16/sprite_get_height(spr), 0, c_white, 0.9);
//	}
//}
#endregion

//if (array_length(obj_player.inventory) > 0 && obj_player.invIndex >=0 && obj_player.invIndex < array_length(obj_player.inventory)) {
	//var itemSprite = obj_player.inventory[obj_player.invIndex];
//}

var item_Spr = obj_player.sylladex[0][obj_player.fetch];
if (item_Spr != item_sword && item_Spr != item_wand_fire && item_Spr != spr_empty) {
	if (point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) < obj_player.clickRadius) {
		draw_set_alpha(0.8);
		draw_sprite(item_Spr, 0, mouse_x-(sprite_get_width(item_Spr)/2), mouse_y-(sprite_get_height(item_Spr)/2));
		if (item_Spr == item_bucket_slime) { draw_sprite_ext(item_Spr, 1+obj_player.bucketslimehappy, mouse_x-(sprite_get_width(item_Spr)/2), mouse_y-(sprite_get_height(item_Spr)/2), 1, 1, 0, obj_player.bucketslimecolor, 1); }
		draw_set_alpha(1);
	}
}

if (!obj_player.frozen && room == rm_leylowHome) {
	draw_sprite(spr_moveHelp, 0, 640, 480);
}