/// @description update animation
if (tick == 0 && image_index != 16) {
		image_index = 13;
} else {
	if (image_index == 11) {
		image_index = 12;
	} else if (image_index == 12 || image_index == 15) {
		image_index = 11;
	} else if (image_index == 13) {
		image_index = 14;
	} else if (image_index == 14) {
		image_index = 15;
		alarm[1] = sec/6;
		var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		bullet.spr = bullet_web;
		bullet.direction = point_direction(x, y, obj_player.x, obj_player.y);
		bullet.speed = 6;
		bullet.myDamage = 30;
	} else {
		//image_index +=1;
	}
}


if (tick <= 7) {
	tick += 1;
} else {
	tick = 0;
}