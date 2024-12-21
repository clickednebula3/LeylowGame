if (!isSleeping) {
	if (image_index >= 10 && alarm[0] <= 0) {
		image_speed = 0;
		image_angle = point_direction(x, y, obj_player.x, obj_player.y)+90;
		alarm[0] = sec/3;
	}
	
} else {
	if (
		collision_circle(x, y, wakeUpRadius*image_yscale, obj_player, false, true) != noone ||
		collision_circle(x, y, wakeUpRadius*image_yscale, obj_bullet, false, true) != noone
	) {
		isSleeping = false;
		image_speed = 1;
	}
}