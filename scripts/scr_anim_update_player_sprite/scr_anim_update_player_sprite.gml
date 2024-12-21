// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg sprite The sprite index to set the player's sprite to
///@arg {real} index The image index to set the player's sprite to
///@arg {real} image_spd The image speed to set the player's sprite to

function scr_anim_update_player_sprite (sprite, index = 0, image_spd = -1) {
	if (instance_exists(obj_player)) {
		obj_player.sprite_index = sprite;
		obj_player.image_index = index;
		if (image_spd >= 0) { obj_player.image_speed = image_spd; }
	}
	return true;
}