// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sylla_check_has_item(item, sylla_owner)
{
	for (var iy=0; iy<4; iy++) {
		for (var ix=0; ix<4; ix++) {
			if (sylla_owner.sylladex[iy][ix] == item) { return true; }
		}
	}
	
	return false;
}