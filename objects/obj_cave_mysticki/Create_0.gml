myParent = noone;//mystickus (mystic-cuss)
myChild = noone;//mysticki (mystic-eye)

randomise();

legacyLength = irandom_range(4, 9);
anglifier_multiplier = random_range(0.08, 0.3);
transferAngle = random_range(-0.03, 0.03);
singlePointMode = false;

depth = -100000;
image_angle = 90;
alarm[0] = 5;

image_index = irandom_range(0, sprite_get_number(sprite_index)-1);