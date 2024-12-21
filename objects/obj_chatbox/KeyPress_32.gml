if (instance_exists(obj_player) && !dontAutoContinue) {
	if (obj_player.frozen) {
		if (lineCurrentIndex+1 < array_length(myText)) {
			alarm[2] = 1;
		} else {
			alarm[0] = 1;
		}
	}
}