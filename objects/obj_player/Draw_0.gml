depth = -bbox_bottom;

if (room == rm_mysticave || room == rm_mysticave2 || room == rm_cave || room == rm_cave_deeper) {
	if (!sylla_check_has_item(item_torch, obj_player)) { draw_sprite(bgr_darkness_overlay, 0, room_width/2, room_height/2); }
	else {
		var mx = clamp(mouse_x, camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]));
		var my = clamp(mouse_y, camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]));
		draw_sprite(bgr_darkness_overlay, 1, mx, my);
	}
}

//if (array_length(inventory) > 0 && invIndex >=0 && invIndex < array_length(inventory)) {
//	if (inventory[invIndex] == item_sword || inventory[invIndex] == item_wand_fire) {
if (true) {
	if (sylladex[0][fetch] == item_sword || sylladex[0][fetch] == item_wand_fire) {
		var swordDir = point_direction(x, y-32, mouse_x, mouse_y);
		if (swordDir > 0 && swordDir < 180) {
			draw_sprite_ext(sylladex[0][fetch], 0, x+(20*dcos(swordDir)), y-32+(20*-dsin(swordDir)), 3, 2, swordDir, c_white, 1);
			//draw_sprite_ext(inventory[invIndex], 0, x+(20*dcos(swordDir)), y-32+(20*-dsin(swordDir)), 3, 2, swordDir, c_white, 1);
			draw_self();
		} else {
			draw_self();
			draw_sprite_ext(sylladex[0][fetch], 0, x+(20*dcos(swordDir)), y-32+(20*-dsin(swordDir)), 3, 2, swordDir, c_white, 1);
			//draw_sprite_ext(inventory[invIndex], 0, x+(20*dcos(swordDir)), y-32+(20*-dsin(swordDir)), 3, 2, swordDir, c_white, 1);
		}
	} else {
		draw_self();
		//if (mouse_y > 32) {
		//	//draw_sprite_ext(inventory[invIndex], 0, mouse_x-8, mouse_y-8, 1, 1, 0, c_white, 0.8);
		//}
	}
}

//else {
//	draw_self();
//}

//if (Health < 100) {
//	draw_healthbar(x-10, y+4, x+10, y+8, Health, c_black, c_red, c_lime, 0, true, false);
//}

if (mouse_check_button(mb_right)) {
	if (point_distance(x, y, mouse_x, mouse_y) < clickRadius) {
		//effect_create_below(ef_flare, mouse_x, mouse_y, 0.02, c_red);
	} else {
		draw_set_color(c_red);
		draw_circle(x, y, clickRadius, true);
		draw_set_color(c_white);
	}
}