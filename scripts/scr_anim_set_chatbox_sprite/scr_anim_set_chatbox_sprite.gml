// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg sprite The sprite index to set the chatbox's sprite to
///@arg {real} index The image index to set the chatbox's sprite to

function scr_anim_set_chatbox_sprite(sprite = spr_empty, index = -1){
	if (instance_exists(obj_chatbox)) {
		obj_chatbox.spriteo = sprite;
		if (index >= 0 ) { obj_chatbox.spriteoI = index; }
	}
	return true;
}