if (canDepth) {
	depth = -(bbox_top+sprite_get_height(spr));
	if (collision_rectangle(x, y, x+sprite_get_width(spr), y+sprite_get_height(spr), obj_player, false, true)  != noone) {
		if (obj_player.bbox_bottom < y+sprite_get_height(spr)) {
			alph = 0.5;
		}
	}
}
draw_sprite_ext(spr, sprI, x, y, 1, 1, 0, c_white, alph);
alph = 1;