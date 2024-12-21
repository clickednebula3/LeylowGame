// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg prop_object Prop object
///@arg spawn_x Place prop at x
///@arg spawn_y Place prop at y
///@arg prop_id The temprary id for the prop in this animation

function scr_anim_create_prop(prop_object, spawn_x, spawn_y, prop_id){
	var prop = instance_create_depth(spawn_x, spawn_y, depth, prop_object);
	prop.prop_id = prop_id;
	return prop;
}