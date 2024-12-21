/// @description Init
if (spr == item_sword) {
	image_index = (!slicerA)+1;
	alarm[1] = sec/6;
	speed = 10;
	if (slicerA) { direction -= 135; }
	else { direction += 135; }
}