if (singlePointMode) {
	
} else {
	var aim_angle = image_angle;
	if (!instance_exists(myParent)) {
		
		if (array_length(obj_player.inventory) > 0)
		{
			//obj_player.invIndex = clamp(obj_player.invIndex, 0, array_length(obj_player.inventory)-1);
			try {
				if (string_starts_with(sprite_get_name(obj_player.sylladex[0][obj_player.fetch]), "item_apple"))
				{ aim_angle = point_direction(x, y, mouse_x, mouse_y); } //target is to mouse's apple
				
				else if (string_starts_with(sprite_get_name(obj_player.sylladex[0][obj_player.fetch]), "item_sword"))
				{ aim_angle = point_direction(obj_player.x, obj_player.y, x, y); } //target is away from player's sword
				
				else
				{
					var apple_list = ds_list_create();
					var apple_count = collision_circle_list(x, y, 512, obj_interactable, false, true, apple_list, true);
					var chosen_apple = obj_player; //target is player (overrideable)
					
					for (var i=0; i<apple_count; i++) {
						if ( apple_list[|i].isItem && string_starts_with(sprite_get_name(apple_list[|i].spr), "item_apple") ) {
							chosen_apple = apple_list[|i]; //target is nearest placed apple
							break;
						}
					}
					
					aim_angle = point_direction(x, y, chosen_apple.x, chosen_apple.y);
				}
			} catch (e) {
				aim_angle = point_direction(x, y, obj_player.x, obj_player.y); //target is player
			}
		}
		else
		{
			try {
				var apple_list = ds_list_create();
				var apple_count = collision_circle_list(x, y, 2*sprite_width*legacyLength, obj_interactable, false, true, apple_list, true);
				var chosen_apple = obj_player; //target is player (overrideable)
					
				for (var i=0; i<apple_count; i++) {
					if ( apple_list[|i].isItem && string_starts_with(sprite_get_name(apple_list[|i].spr), "item_apple") ) {
						chosen_apple = apple_list[|i]; //target is nearest placed apple
						break;
					}
				}
					
				aim_angle = point_direction(x, y, chosen_apple.x, chosen_apple.y);
			} catch (e) {
				aim_angle = point_direction(x, y, obj_player.x, obj_player.y); //target is player
			}
		}
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
}