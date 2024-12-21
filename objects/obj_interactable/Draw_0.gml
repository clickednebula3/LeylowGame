if (spr == spr_empty) { return; }

if (canDepth) {
	depth = -(bbox_top+sprite_get_height(spr));
	if (collision_rectangle(x, y, x+sprite_get_width(spr), y+sprite_get_height(spr), obj_player, false, true)  != noone) {
		if (obj_player.bbox_bottom < y+sprite_get_height(spr)) { alph = alphAmount; }
	}
}

if (isItem && string_starts_with(sprite_get_name(spr), "item_")) {
	draw_sprite_ext(spr, sprI, x, y, (16*image_xscale)/sprite_width, (16*image_yscale)/sprite_height, image_angle, c_white, alph);
} else {
	draw_sprite_ext(spr, sprI, x, y, 1, 1, image_angle, c_white, alph);
}

alph = 1;