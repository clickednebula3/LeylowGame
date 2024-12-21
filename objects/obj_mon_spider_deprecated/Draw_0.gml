if (isSleeping) {
	if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_waker, false, true) == noone) {
		draw_set_color(c_red);
		draw_circle(x, y, wakeUpRadius*image_yscale, true);
		draw_set_color(c_white);
	}
}

draw_self();