image_angle += rspeed;
if (vspeed > abs(initial_vspeed) && alarm[0] <= 0) {
	gravity = 0;
	vspeed = 0;
	rspeed = 0;
	alarm[0] = random_range(2, 3)*sec;
	y += irandom_range(-8, 16);
}
if (alarm[0] > 0 || alarm[1] > 0) {
	hspeed *= 0.9;
}