draw_self();

//draw_circle(x, y, ai_notice_radius, true);
//draw_line(x, y, x+ai_notice_radius*dcos(direction), y+ai_notice_radius*-dsin(direction));

var made_up_off = 24;
var yoff = 3.6;
var arbitrary_off = [made_up_off/2, made_up_off/4, 3*made_up_off/4, 0];

var leg_a_len = 13;
var leg_b_len = 16;

//right legs
for (var i=0; i<4; i++) {
	var leg_a_x = x+10;
	var leg_a_y = y-5+(i*yoff);
	
	var made_up_target_x = round((leg_a_x-arbitrary_off[i])/made_up_off)*made_up_off + arbitrary_off[i];
	var made_up_target_y = round((leg_a_y+12+arbitrary_off[3-i])/made_up_off)*made_up_off - arbitrary_off[3-i];
	
	//draw_set_color(c_blue);
	//draw_circle(made_up_target_x, made_up_target_y, 2, false);
	//draw_set_color(c_white);
	
	var unleg_c_len = max(point_distance(leg_a_x, leg_a_y, made_up_target_x, made_up_target_y), 0.1);
	
	//figure these out based on len and target (Found formula)
	var ang_base_plate = point_direction(leg_a_x, -leg_a_y, made_up_target_x, made_up_target_y);
	var leg_a_ang = ang_base_plate + darccos(clamp(((unleg_c_len*unleg_c_len)+(leg_a_len*leg_a_len)-(leg_b_len*leg_b_len))/(2*leg_b_len*leg_a_len), -1, 1));
	
	var leg_b_x = leg_a_x+(leg_a_len*dcos(leg_a_ang));
	var leg_b_y = leg_a_y+(leg_a_len*-dsin(leg_a_ang));
	
	var leg_b_ang = point_direction(leg_b_x, leg_b_y, made_up_target_x, made_up_target_y);
	
	draw_sprite_ext(leg_sprite, 0, leg_a_x, leg_a_y, 1, 1, leg_a_ang, c_white, 1);
	draw_sprite_ext(leg_sprite, 1, leg_b_x, leg_b_y, 1, 1, leg_b_ang, c_white, 1);
}

//arbitrary_off = [4, 12, 0, 8];

//left legs
for (var i=0; i<4; i++) {
	var leg_a_x = x-10;
	var leg_a_y = y-5+(i*yoff);
	
	var made_up_target_x = round((leg_a_x+arbitrary_off[i])/made_up_off)*made_up_off - arbitrary_off[i];
	var made_up_target_y = round((leg_a_y+12+arbitrary_off[3-i])/made_up_off)*made_up_off - arbitrary_off[3-i];
	
	//draw_set_color(c_blue);
	//draw_circle(made_up_target_x, made_up_target_y, 2, false);
	//draw_set_color(c_white);
	
	var unleg_c_len = max(point_distance(leg_a_x, leg_a_y, made_up_target_x, made_up_target_y), 0.1);
	
	//figured these out based on len and target (Found formula)
	var ang_base_plate = point_direction(leg_a_x, -leg_a_y, made_up_target_x, made_up_target_y);
	var leg_a_ang = ang_base_plate - darccos(clamp(((unleg_c_len*unleg_c_len)+(leg_a_len*leg_a_len)-(leg_b_len*leg_b_len))/(2*leg_b_len*leg_a_len), -1, 1));;
	
	var leg_b_x = leg_a_x+(leg_a_len*dcos(leg_a_ang));
	var leg_b_y = leg_a_y+(leg_a_len*-dsin(leg_a_ang));
	
	var leg_b_ang = point_direction(leg_b_x, leg_b_y, made_up_target_x, made_up_target_y);
	
	draw_sprite_ext(leg_sprite, 0, leg_a_x, leg_a_y, 1, 1, leg_a_ang, c_white, 1);
	draw_sprite_ext(leg_sprite, 1, leg_b_x, leg_b_y, 1, 1, leg_b_ang, c_white, 1);
}