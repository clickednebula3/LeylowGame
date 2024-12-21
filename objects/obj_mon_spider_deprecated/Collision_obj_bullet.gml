if (other.isPlayerBullet && other.spr == bullet_fireball) {
	image_index = 16;
	alarm[2] = sec/8;
	direction = image_angle+90;
	speed = 0.3;
}