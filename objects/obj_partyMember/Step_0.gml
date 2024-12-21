depth = -bbox_bottom;
if (AI == 0) {
	if (point_distance(x, y, obj_player.x, obj_player.y) >= obj_player.clickRadius/2) {
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		speed = obj_player.spd;
	} else {
		speed = 0;
	}
}
if (AI == 1) {
	x = obj_player.x + xDiff;
	y = obj_player.y + yDiff;
}