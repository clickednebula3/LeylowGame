// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg prop_id_a The temprary id for the prop in this animation

function scr_anim_remove_prop(prop_id_a){
	var removed_prop = false;
	with (all) {
		if (!removed_prop && variable_instance_exists(self, "prop_id") && prop_id == prop_id_a) {
			instance_destroy();
			removed_prop = true;
		}
	}
	return removed_prop;
}