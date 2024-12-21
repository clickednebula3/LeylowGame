//if (bbox_left+hspeed-3 < other.bbox_right) {
//	var a = x - bbox_left;
//	x = other.bbox_right+a-hspeed;
//	hspeed *= -1;
//} else if (bbox_right+hspeed+3 > other.bbox_left) {
//	var a = x - bbox_right;
//	x = other.bbox_left+a-hspeed;
//	hspeed *= -1;
//}

//if (bbox_top+vspeed < other.bbox_bottom) {
//	y = max(bbox_top, other.bbox_bottom)+y-bbox_top;
//	vspeed *= -1;
//} else if (bbox_bottom+vspeed > other.bbox_top) {
//	y = max(bbox_bottom, other.bbox_top)+y-bbox_bottom;
//	vspeed *= -1;
//}