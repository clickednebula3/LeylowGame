if (activateMonsCleared) {
	var foundSlime = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_slime, false, true);
	var foundSpider = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon_spider_deprecated, false, true);
	if (foundSlime == noone && foundSpider == noone) {
		activateMonsCleared = false;
		alarm[0] = 1;
	}
}