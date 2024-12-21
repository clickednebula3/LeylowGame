if (other.isPlayerBullet && other.spr == item_sword && !instance_exists(myChild)) {
	if (instance_exists(myParent)) {
		myParent.myChild = noone;
	}
	instance_destroy();
}