if (singlePointMode) {
	
} else {
	var aim_angle = image_angle;
	
	if (!instance_exists(myParent)) {
		Time++;
		aim_angle = 90 + (10*dcos(MyTimeSpeed*Time)); //target is up
		depth = -bbox_bottom;
	} else {
		aim_angle = myParent.image_angle - transferAngle;
	}
	
	//make it work in circles
	if (image_angle - aim_angle > 180 && image_angle > 270) {aim_angle += 360;}
	else if (image_angle - aim_angle < -180 && image_angle < 90) {aim_angle -= 360;}
	if (aim_angle < -180) {aim_angle += 360;image_angle += 360;}
	else if (aim_angle > 180+360) {aim_angle -= 360;image_angle -= 360;}
	
	image_angle += (aim_angle-image_angle)*anglifier_multiplier;
	image_angle += transferAngle;
}

if (instance_exists(myChild)) {
	myChild.x = x + (sprite_width*dcos(image_angle));
	myChild.y = y + (sprite_width*-dsin(image_angle));
	myChild.transferAngle = transferAngle;
	myChild.depth = depth;
	myChild.Time = Time;
}