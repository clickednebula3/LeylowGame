if (image_index == 1 || image_index = 2) {
	if (mouse_y > midY) {
		game_load("Save.dat");
	} else {
		room_goto_next();
	}
}
image_index = 0;