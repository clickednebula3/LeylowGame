if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < notice_radius) {
	Time++;
	var dir = point_direction(x, y, obj_player.x, obj_player.bbox_top+16);
	direction = dir;
	y += 2*dsin(Time/10*sec)/3;
	speed = 2;
	
	if (obj_player.x > x) { image_xscale = -1; }
	else { image_xscale = 1; }
	
} else {
	speed *= 0.92;
}