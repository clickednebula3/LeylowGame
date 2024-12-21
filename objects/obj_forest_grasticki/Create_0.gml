myParent = noone;//grastickus (mystic-cuss)
myChild = noone;//grasticki (mystic-eye)

randomise();
legacyLength = irandom_range(1, 4);
anglifier_multiplier = random_range(0.08, 0.3);
transferAngle = random_range(-0.03, 0.03);
singlePointMode = false;
Time = irandom_range(0, 360);
MyTimeSpeed = irandom_range(1, 3);

depth = -100000;
image_angle = 90;
alarm[0] = 5;

image_index = irandom_range(0, sprite_get_number(sprite_index)-1);