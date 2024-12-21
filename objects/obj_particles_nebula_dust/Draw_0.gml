var alph = 1 - (alarm[0]/fadeIn);
if (alarm[2] > 0) { alph *= alarm[2] / fadeOut; }
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alph);