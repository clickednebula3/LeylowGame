if (other.isPlayerBullet && other.spr == item_sword) {
	Health -= 1;
	beingDamaged = true;
	stunned = true;
	alarm[0] = sec/6;
	if (isJumpySlime) {
		y = jumpStartY;
		x = jumpStartX;
		//targetX = 2*x - targetX;
	} else {
		//direction = point_direction(other.x, other.y, mouse_x, mouse_y);
		//speed = 6;
	}
	spawn_xscale-=0.1;
	spawn_yscale-=0.1;
	image_xscale = spawn_xscale;
	image_yscale = spawn_yscale;
}
if (other.isPlayerBullet && other.spr == bullet_fireball) {
	Health+=1;
	spawn_xscale+=0.1;
	spawn_yscale+=0.1;
	image_xscale = spawn_xscale;
	image_yscale = spawn_yscale;
}
instance_destroy(other);