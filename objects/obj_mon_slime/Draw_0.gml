if (isSleeping) {
	draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, myColor, 1);
	if (global.debugmode && !cantWakeUp && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_waker, false, true) == noone) {
		draw_set_color(myColor);
		draw_circle(x, y, wakeUpRadius*spawn_yscale, true);
		draw_set_color(c_white);
	}
}

else {
	if (stunned) {
		if (x > obj_player.x) {
			draw_sprite_ext(sprite_index, 2, x, y, -image_xscale, image_yscale, image_angle, myColor, 1);
		} else {
			draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, myColor, 1);
		}
	}
	else if (beingDamaged) {
		if (x > obj_player.x) {
			draw_sprite_ext(sprite_index, 0, x, y, -image_xscale, image_yscale, image_angle, damageColor, 1);
		} else {
			draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, damageColor, 1);
		}
		beingDamaged = false;
	}
	else if (confused) {
		var leftRight = -1;
		if ((current_time/10)%(2*sec) < sec) {leftRight = 1};
		draw_sprite_ext(sprite_index, 3, x, y, leftRight*image_xscale, image_yscale, image_angle, myColor, 1);
	}
	else if (myTime < sec) {
		if (x > obj_player.x) {
			draw_sprite_ext(sprite_index, 4, x, y, -image_xscale, image_yscale, image_angle, myColor, 1);
		} else {
			draw_sprite_ext(sprite_index, 4, x, y, image_xscale, image_yscale, image_angle, myColor, 1);
		}
	}
	else {
		if (x > obj_player.x) {
			draw_sprite_ext(sprite_index, 0, x, y, -image_xscale, image_yscale, image_angle, myColor, 1);
		} else {
			draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, myColor, 1);
		}
	}
}