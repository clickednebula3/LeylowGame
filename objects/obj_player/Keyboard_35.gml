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
	if (obj_animation.alarm[0] > sec/5)
	{
		var frames_to_skip = 2;
		for (var i=0; i<frames_to_skip; i++) {
			with (obj_animation) {
				run_anim_move(animation_moves[anim_i]);
				alarm[0]--;
			}
		}
		return
	}
}