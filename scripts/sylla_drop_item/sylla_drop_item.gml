// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sylla_drop_item(slot_x, slot_y, owner, drop_x, drop_y, drop_depth)
{
	var item_spr = owner.sylladex[slot_y][slot_x];
	if (item_spr == spr_empty) { return false; }
	
	var item = instance_create_depth(drop_x, drop_y, drop_depth, obj_interactable);
	item.isItem = true;
	item.spr = item_spr;
	owner.sylladex[slot_y][slot_x] = spr_empty;
	return true;
}