//enum anim_action { //I don't think we need this anymore
//	create_prop,
//	remove_prop,
//	move_camera,
//	move_player,
//	move_prop,
//	update_player_sprite,
//	update_prop_sprite,
//	sprite_set_icon,//sets icon AND index
//	sprite_set_icon_index,//sets just index
//	chat_text,
//	join_party
//}

#macro ANIM_FINISH_CONIDITION_NO_TEXTBOX	-1


if (!started) { return; }
if (instance_exists(obj_player) && array_contains(obj_player.seenAnimations, animation_id)) {
	instance_destroy(); return;
}
if (anim_i >= array_length(animation_moves)) {
	if (instance_exists(obj_player)) { array_push(obj_player.seenAnimations, animation_id); }
	instance_destroy(); return;
}

var anim = animation_moves[anim_i];

//finish conditions
if (alarm[0] <= 0 && anim[0] >= 0) { alarm[0] = anim[0]; }
if (anim[0] < 0) {
	switch(anim[0]) {
		case -1:
			if (instance_exists(obj_chatbox) && !obj_chatbox.on) { if (alarm[0] <= 0) { alarm[0] = 2; } }
			else { alarm[0] = -1; }
			break;
		default: break;
	}
}

//animation actions
if (!anim[1]) //single fire actions
{
	if (!ran_once) {
		ran_once = true;
		run_anim_move(anim);
	}
}
else //step fire actions
{ if (run_anim_move(anim) != false) { animation_next_move(); } }