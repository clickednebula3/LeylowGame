// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg freeze The bool to set player's freeze status to

function scr_anim_set_player_freeze (freeze) {
	if (instance_exists(obj_player)) {
		obj_player.frozen = freeze;
		return true;
	}
	return false;
}