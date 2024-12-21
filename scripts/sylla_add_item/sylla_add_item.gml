// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sylla_add_item(item, sylla_owner)
{
	var added_success = false;
		
	for (var iy=0; iy<4; iy++) {
		for (var ix=0; ix<4; ix++) {
			if (sylla_owner.sylladex[iy][ix] == spr_empty) {
				//captchalogue!
				sylla_owner.sylladex[iy][ix] = item;
				added_success = true;
				break;
			}
		}
		if (added_success) { break; }
	}
	
	return added_success;
}