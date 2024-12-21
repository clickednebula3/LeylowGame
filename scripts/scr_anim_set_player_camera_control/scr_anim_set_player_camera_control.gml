// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg camera The bool to set player's can_control_camera status to

function scr_anim_set_player_camera_control (camera) {
	if (instance_exists(obj_player)) {
		obj_player.can_control_camera = camera;
		return true;
	}
	return false;
}