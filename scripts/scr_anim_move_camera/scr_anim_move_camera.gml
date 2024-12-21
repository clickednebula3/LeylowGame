// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg x_off Pixels to displace camera in the x-axis
///@arg y_off Pixels to displace camera in the y-axis

function scr_anim_move_camera (x_off, y_off) {
	if (instance_exists(obj_player)) { obj_player.can_control_camera = false; }
	camera_set_view_pos( view_camera[0], //clamp so it doesn't go out of bounds
		clamp(camera_get_view_x(view_camera[0])+x_off, 0, room_width-640),
		clamp(camera_get_view_y(view_camera[0])+y_off, 0, room_height-480)
	);
	return false;
}