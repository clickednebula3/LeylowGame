depth = -bbox_bottom;
draw_self();


//already got my item
if (sylla_check_has_item(myItem, obj_player)) { return; }
//incompatiblities
if (myItem == item_bucket_empty && (sylla_check_has_item(item_bucket_water, obj_player) || sylla_check_has_item(item_bucket_slime, obj_player))) { return; }
if (myItem == item_bucket_water && (sylla_check_has_item(item_bucket_empty, obj_player) || sylla_check_has_item(item_bucket_slime, obj_player))) { return; }
if (myItem == item_bucket_slime && (sylla_check_has_item(item_bucket_empty, obj_player) || sylla_check_has_item(item_bucket_water, obj_player))) { return; }


if (timeSinceStart < extraTime) {
	obj_player.frozen = true;
	var midX = (bbox_left+bbox_right)/2;
	var midXitem = sprite_get_width(myItem)/2;
	var currentY = itemYstart + ( (itemYend-itemYstart) * (timeSinceStart/duration) );
	
	currentY = clamp(currentY, itemYend, itemYstart);
	
	draw_sprite(myItem, 0, midX-midXitem, currentY);
	draw_sprite(sprite_index, 2, x, y);
	
	timeSinceStart++;
} else if (timeSinceStart == extraTime) {
	obj_player.frozen = false;
	var added_success = sylla_add_item(myItem, obj_player);
	
	timeSinceStart++;
}