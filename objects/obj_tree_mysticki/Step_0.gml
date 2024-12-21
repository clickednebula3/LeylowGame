if (singlePointMode) {
	
} else {
	var aim_angle = image_angle;
	if (!instance_exists(myParent)) {
		
		//if (array_length(obj_player.inventory) > 0) {
		//	obj_player.invIndex = clamp(obj_player.invIndex, 0, array_length(obj_player.inventory)-1);
		//	try {
		//		if (string_starts_with(sprite_get_name(obj_player.inventory[obj_player.invIndex]), "item_apple")) {
		//			aim_angle = point_direction(x, y, mouse_x, mouse_y); //target is to mouse's apple
		//		} else if (string_starts_with(sprite_get_name(obj_player.inventory[obj_player.invIndex]), "item_sword")) {
		//			aim_angle = point_direction(obj_player.x, obj_player.y, x, y); //target is away from player's sword
		//		} else {
		//			aim_angle = point_direction(x, y, obj_player.x, obj_player.y); //target is player
		//		}
		//	} catch (e) {
		//		aim_angle = point_direction(x, y, obj_player.x, obj_player.y); //target is player
		//	}
		//} else {
		//	aim_angle = point_direction(x, y, obj_player.x, obj_player.y); //target is player
		//}
		
		aim_angle = 270+(5*dsin(current_time/8));//test
		
	} else {
		aim_angle = myParent.image_angle - transferAngle;
		
		var lasts = 0;
		var range = 10;
		if (legacyLength <= lasts+range && legacyLength > lasts) {
			var player_direction = point_direction(x, y, obj_player.x, obj_player.y); 
			if (player_direction < 90) {player_direction += 360;}
			player_direction = clamp(player_direction, 200, 340);
			aim_angle = aim_angle + ((player_direction-270)/(4*(legacyLength-lasts)));//test
		}
		
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
}

if (instance_exists(myParent)) {
	myParent.depth = depth;
}