gravity = 0;//overridden
hspeed *= 0.92;
vspeed *= 0.92;
depth = -bbox_bottom;


//hspeed += 0.5*(keyboard_check_direct(vk_right)-keyboard_check_direct(vk_left));
//vspeed += 0.5*(keyboard_check_direct(vk_down)-keyboard_check_direct(vk_up));

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

var _ai_notices = ds_list_create();
var _ai_notices_count = 0;

for (var i=0; i<array_length(ai_notice_objects); i++) {
	var _ai_notice_temp = ds_list_create();
	var _ai_notice_temp_count = collision_circle_list(x, y, ai_notice_radius, ai_notice_objects[i], true, true, _ai_notice_temp, true);
	
	if (_ai_notice_temp_count > 0) {
		for (var j=0; j<_ai_notice_temp_count; j++) {
			if (typeof(_ai_notice_temp[|i])!="undefined" && instance_exists(_ai_notice_temp[|i])) {
				ds_list_add(_ai_notices, _ai_notice_temp[|i]);
				_ai_notices_count += 1;
			}
		}
	}
	
	ds_list_destroy(_ai_notice_temp);
}

if (_ai_notices_count > 0) {
	var _ai_notices_weights = [];
	
	//rate weights
	for (var i=0; i<_ai_notices_count; i++) {
		var noticed = _ai_notices[|i];
		if (typeof(noticed)!="undefined" && instance_exists(noticed)) {
			switch(noticed.object_index) {
				case obj_player://held item, player health, own health, distance
					_ai_notices_weights[i] = (Health/100) * /*(1.25-(noticed.Health/100)) * */ 1.8 * (ai_notice_radius-distance_to_object(noticed));
					if (array_length(noticed.inventory) > 0) {
						noticed.invIndex = clamp(noticed.invIndex, 0, array_length(noticed.inventory)-1);
						var held_item = obj_player.sylladex[0][obj_player.fetch];
						if (held_item == item_sword) _ai_notices_weights[i] *= 1.5;
						if (held_item == item_wand_fire || held_item == item_torch) _ai_notices_weights[i] = -0.8*(ai_notice_radius-distance_to_object(noticed));;
					}
				break;
				case obj_interactable://isitem, kind of item
					_ai_notices_weights[i] = 0;
					if (noticed.isItem) {
						if (noticed.spr == item_torch || noticed.spr == item_wand_fire) _ai_notices_weights[i] = -0.4*(ai_notice_radius-distance_to_object(noticed));
						if (noticed.spr == item_sword || noticed.spr == item_needle || noticed.spr == item_spikeball) _ai_notices_weights[i] = 0.8*(ai_notice_radius-distance_to_object(noticed));
					}
				break;
				case obj_collisionbox:
					_ai_notices_weights[i] = -0.3*(ai_notice_radius-distance_to_object(noticed));
				break;
				case obj_bullet:
					if (noticed.isPlayerBullet) {
						_ai_notices_weights[i] = -0.6*(ai_notice_radius-distance_to_object(noticed));
					} else {
						_ai_notices_weights[i] = -0.1*(ai_notice_radius-distance_to_object(noticed));
					}
				break;
				default:
					_ai_notices_weights[i] = 0;
				break;
			}
			//draw_text(noticed.x, noticed.y+16, string(_ai_notices_weights[i]));
		} else {
			_ai_notices_weights[i] = -1;
		}
	}
	
	//find wanted/hated exteremes
	var most_wanted_ind = -1;
	var most_wanted_val = -9999999;
	var least_wanted_ind = -1;
	var least_wanted_val = 9999999;
	
	for (var i=0; i<_ai_notices_count; i++) {
		if (_ai_notices_weights[i] > most_wanted_val) {
			most_wanted_val = _ai_notices_weights[i];
			most_wanted_ind = i;
		}
		if (_ai_notices_weights[i] < least_wanted_val) {
			least_wanted_val = _ai_notices_weights[i];
			least_wanted_ind = i;
		}
	}
	
	if (most_wanted_val > 0 && most_wanted_val >= abs(least_wanted_val)) {
		//direction = point_direction(x, y, _ai_notices[|most_wanted_ind].x, _ai_notices[|most_wanted_ind].y);
		gravity_direction = point_direction(x, y, _ai_notices[|most_wanted_ind].x, _ai_notices[|most_wanted_ind].y);
		//speed = spd;
		gravity = 0.4;
	} else if (least_wanted_val < 0 && least_wanted_val <= -abs(most_wanted_val)) {
		//direction = point_direction(x, y, _ai_notices[|least_wanted_ind].x, _ai_notices[|least_wanted_ind].y)+180;
		gravity_direction = point_direction(x, y, _ai_notices[|least_wanted_ind].x, _ai_notices[|least_wanted_ind].y)+180;
		//speed = spd;
		gravity = 0.4;
	} else {
		gravity = 0;
		//speed = 0;
	}
	
}