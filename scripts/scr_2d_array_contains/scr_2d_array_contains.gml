// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_2d_array_contains(arr, elem){
	for (var i=0; i<array_length(arr); i++) {
		if (array_contains(arr[i], elem)) return true;
	}
	return false;
}