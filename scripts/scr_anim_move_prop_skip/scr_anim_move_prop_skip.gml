// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg prop_id_a The temprary id for the prop in this animation
///@arg x_off Pixels to displace prop in the x-axis
///@arg y_off Pixels to displace prop in the y-axis
///@arg frames_left the remaining frames to skip

function scr_anim_move_prop_skip(prop_id_a, x_off, y_off, frames_left){
	var moved_prop = false;
	with (all) {
		if (!moved_prop && variable_instance_exists(self, "prop_id") && prop_id == prop_id_a) {
			x += x_off*frames_left;
			y += y_off*frames_left;
			moved_prop = true;
		}
	}
	return true;
}