//if (!frozen) {return;}

//if (instance_exists(obj_chatbox) && instance_exists(obj_animatable)/* && !obj_chatbox.on*/) {
//	obj_animatable.alarm[2] = 1;
//} else if (instance_exists(obj_chatbox) && obj_chatbox.on) {
//	with (obj_chatbox) {
//		if (!dontAutoContinue) {
//			if (lineCurrentIndex+1 < array_length(myText)) { alarm[2] = 1; }
//			else { alarm[0] = 1; }
//		}
//	}
//}

if (collision_point(mouse_x, mouse_y, obj_profile, false, true) != noone) { return; }

if (instance_exists(obj_chatbox) && obj_chatbox.on) {
	with (obj_chatbox) {
		if (!dontAutoContinue) {
			if (lineCurrentIndex+1 < array_length(myText)) { alarm[2] = 1; }
			else { alarm[0] = 1; }
		}
	}
	return;
}

if (
	instance_exists(obj_animation) && obj_animation.started &&
	obj_animation.anim_i < array_length(obj_animation.animation_moves)
) {
	//deprecated code that instantly skips moving props anims only.
	//if (obj_animation.animation_moves[obj_animation.anim_i][2] == scr_anim_move_prop)
	//{
	//	with (obj_animation) {
	//		animation_moves[anim_i][2] = scr_anim_move_prop_skip;
	//		array_push(animation_moves[anim_i], alarm[0]);
	//		alarm[0] = 2;
	//	}
	//	return;
	//}
	//else 
	if (obj_animation.alarm[0]-2 > sec/3)
	{
		var frames_to_skip = sec/3;
		for (var i=0; i<frames_to_skip; i++) {
			with (obj_animation) {
				run_anim_move(animation_moves[anim_i]);
				alarm[0]--;
			}
		}
		return
	}
}