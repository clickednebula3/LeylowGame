/// @description Check for "got item"
visible = true;
if (isItem && string_starts_with(sprite_get_name(spr), "item_")) {
	if (sylla_check_has_item(spr, obj_player)) {
		instance_destroy();
	}
	if (spr == item_bucket_empty && sylla_check_has_item(item_bucket_water, obj_player)) {
		instance_destroy();
	}
} else if (isItem && string_starts_with(sprite_get_name(spr), "spr_chest_")) {
	if (sylla_check_has_item(interactText[0], obj_player)) {
		sprI = 1;
	}
}