// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg x_off Pixels to displace player in the x-axis
///@arg y_off Pixels to displace player in the y-axis

function scr_anim_move_player (x_off, y_off) {
	if (instance_exists(obj_player)) {
		obj_player.x += x_off;
		obj_player.y += y_off;
		return false;//find a way to reach a finish condition?
	}
	return false;
}