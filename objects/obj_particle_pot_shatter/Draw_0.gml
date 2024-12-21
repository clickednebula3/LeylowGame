if (alarm[1] > 0) {
	var percent = alarm[1]/fade_away_time;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, percent);
}
else { draw_self(); }