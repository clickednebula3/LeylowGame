depth = -bbox_bottom;

if (alarm[0] > 0) { image_angle = 12 * (alarm[0]/sec) * dsin(alarm[0]*10*last_direction_right); }
else { image_angle = 0; }

draw_self();