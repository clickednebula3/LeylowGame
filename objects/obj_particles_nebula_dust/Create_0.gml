Timer = 0;
yspd = random_range(0.1, 1);
xspd = random_range(0.1, 0.2);
rspd = random_range(0.2, 0.6);
if (irandom_range(0, 1)) { rspd*=-1; }
image_index = irandom_range(0, sprite_get_number(sprite_index)-1);

fadeIn = irandom_range(sec, 3*sec);
stay = irandom_range(sec, 5*sec);
fadeOut = irandom_range(sec, 3*sec);

alarm[0] = fadeIn;