/// @description Create Children
//image_index = legacyLength;
if (legacyLength <= 0) {
	exit;
}

myChild = instance_create_depth(x, y-sprite_width, depth, object_index);
myChild.myParent = self;
myChild.legacyLength = legacyLength-1;
myChild.image_angle = image_alpha;
myChild.image_index = image_index-1;