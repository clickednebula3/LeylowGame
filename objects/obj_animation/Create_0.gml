/* Alarm[0], runContinuesly, Action, Action Args*/
animation_moves = [-1, false, scr_anim_do_nothing];
animation_id = 0;
anim_i = 0;

ran_once = false;
started = true;

function animation_next_move() {
	anim_i++;
	ran_once = false;
}

function run_anim_move(anim) {
	var move_return = false;
	switch (array_length(anim)) {
		case 3: move_return = script_execute(anim[2]); break;
		case 4: move_return = script_execute(anim[2], anim[3]); break;
		case 5: move_return = script_execute(anim[2], anim[3], anim[4]); break;
		case 6: move_return = script_execute(anim[2], anim[3], anim[4], anim[5]); break;
		case 7: move_return = script_execute(anim[2], anim[3], anim[4], anim[5], anim[6]); break;
		case 8: move_return = script_execute(anim[2], anim[3], anim[4], anim[5], anim[6], anim[7]); break;
		default: break;
	}
	return move_return;
}