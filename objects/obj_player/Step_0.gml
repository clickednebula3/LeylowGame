invIndex = clamp(invIndex, 0, array_length(inventory)-1);

//sprint
if (keyboard_check_direct(vk_shift)) {
	if (global.debugmode && mouse_check_button_pressed(mb_middle)) { x = mouse_x; y = mouse_y; }//debug
	else { spd = 6; }
}
else { spd = 4; }

//debug
if (keyboard_check_pressed(vk_pageup)) {
	global.debugmode = !global.debugmode;
}
if (point_distance(x, (bbox_top+bbox_bottom)/2, mouse_x, mouse_y) < 32) {
	bucketslimehappy = true;
} else { bucketslimehappy = false; }


//hotbarscroll
if (mouse_wheel_up()){
	if (frozen) { return; }
	fetch--;
	if (fetch<0) {fetch+=4;}
}
if (mouse_wheel_down()){
	if (frozen) { return; }
	fetch++;
	if (fetch>3) {fetch-=4;}
}

//movements
if (!frozen) {
	image_speed = 0;
	if (keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A")) || keyboard_check_direct(ord("Q")) || gamepad_button_check(0, gp_padl)) {
		if (!collision_point(x+collLeft, y, obj_collisionbox, true, true) && bbox_left > 0) {
			if (screenMoveMode) { with (all) { x+=obj_player.spd; } }
			x-=spd;
		}
		//image_index = 2;
		if (hasHat) { sprite_index = spr_char_char_left; }
		else { sprite_index = spr_char_char_left_noh; }
		image_speed = spd/4;
		facing="left";
		X1=0;
		Y1=-8;
		X1=-16
		Y2=8;
	}
	if (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")) || gamepad_button_check(0, gp_padr)) {
		if (!collision_point(x+collRight, y, obj_collisionbox, true, true) && bbox_right < room_width) {
			if (screenMoveMode) { with (all) { x-=obj_player.spd; } }
			x+=spd;
		}
		//image_index = 3;
		if (hasHat) { sprite_index = spr_char_char_right; }
		else { sprite_index = spr_char_char_right_noh; }
		image_speed = spd/4;
		facing="right";
		X1=0;
		Y1=-8;
		X1=16
		Y2=8;
	}
	if (keyboard_check_direct(vk_up) || keyboard_check_direct(ord("W")) || keyboard_check_direct(ord("Z")) || gamepad_button_check(0, gp_padu)) {
		if (!collision_point(x, y+collUp, obj_collisionbox, true, true) && bbox_top > 0) {
			if (screenMoveMode) { with (all) { y+=obj_player.spd; } }
			y-=spd;
		}
		//image_index = 1;
		if (hasHat) { sprite_index = spr_char_char_up; }
		else { sprite_index = spr_char_char_up_noh; }
		image_speed = spd/4;
		facing="up";
		X1=-8;
		Y1=0;
		X2=8;
		Y2=-12;
	}
	if (keyboard_check_direct(vk_down) || keyboard_check_direct(ord("S")) || gamepad_button_check(0, gp_padd)) {
		if (!collision_point(x, y+collDown, obj_collisionbox, true, true) && bbox_bottom < room_height) {
			if (screenMoveMode) { with (all) { y-=obj_player.spd; } }
			y+=spd;
		}
		//image_index = 0;
		if (hasHat) { sprite_index = spr_char_char_down; }
		else { sprite_index = spr_char_char_down_noh; }
		image_speed = spd/4;
		facing="down";
		X1=-8;
		Y1=0;
		X2=8;
		Y2=8;
	}
	if (image_speed == 0) { image_index = 0; }
}



//deprecated camera?
if (screenMoveMode) {
	if (x != room_width/2) {
		var diffX = room_width/2 - x;
		with (all) { x += diffX; }
		x = room_width/2;
	}
	if (y != room_height/2) {
		var diffY = room_height/2 - y;
		with (all) { y += diffY; }
		y = room_height/2;
	}
}


//new camera behaviour
if (
	room == rm_cave || room == rm_forest || room == rm_forest_deeper ||
	room == rm_forest_deeper_new || room == rm_mountain || room == rm_town
) { obj_player.screenMoveMode = true; }
else {
	if (can_control_camera) {
		camera_set_view_pos( view_camera[0], //clamp so it doesn't go out of bounds
			clamp(x - (view_wport[0] / 2), 0, room_width-640),
			clamp(y - (view_hport[0] / 2), 0, room_height-480)
		);
	}
}

//grasticki hide for cover
infrontGrastickusAmount = 0;
behindGrastickusAmount = 0;
var _grasticki_list = ds_list_create();
var _grasticki_count = collision_rectangle_list(x+collLeft, bbox_top-collUp, x+collRight, bbox_bottom+collDown, obj_forest_grasticki, true, true, _grasticki_list, false);
for (var i=0; i<_grasticki_count; i++) {
	if (depth < _grasticki_list[|i].depth) {
		infrontGrastickusAmount+=1;
	} else {
		behindGrastickusAmount+=1;
	}
}

//health and reset things
Health += 4 * (1/sec);
if (Health > 100) { Health = 100; }
if (instance_exists(obj_room_manager)) {
	obj_room_manager.tension = (100.001-Health)/100;
	//if (Health > 20) {obj_room_manager.tension -= 0.001;}
	////if (Health / 100 < obj_room_manager.tension) {
	////	obj_room_manager.tension = (100-Health)/100;
	////}
	//var deltaHealth = Health-Healthprevious;
	//if (deltaHealth < -5) {
	//	obj_room_manager.tension += 0.33;
	//}
}
if (Health < 0) { game_restart(); }
Healthprevious = Health;