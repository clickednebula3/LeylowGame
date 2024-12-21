// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg prop_id_a The temprary id for the prop in this animation
///@arg sprite The sprite index to set the prop's sprite to
///@arg {real} index The image index to set the prop's sprite to
///@arg {real} image_spd The image speed to set the prop's sprite to

function scr_anim_update_prop_sprite(prop_id_a, sprite, index = 0, image_spd = -1){
	var moved_prop = false;
	with (all) {
		if (!moved_prop && variable_instance_exists(self, "prop_id") && prop_id == prop_id_a) {
			sprite_index = sprite;
			image_index = index;
			if (image_spd >= 0) { image_speed = image_spd; }
			moved_prop = true;
		}
	}
	return true;
}