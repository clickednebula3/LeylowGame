if (isJumpySlime) {
	if (collision_point(x, y, obj_collisionbox, true, true) != noone && !midJump) {
		y = jumpStartY;
		x = jumpStartX;
		alarm[0] = sec/6;
		stunned = true;
	}
} else {
	x = xprevious;
	y = yprevious;
	speed *= -1;
	alarm[0] = sec/6;
	stunned = true;
}