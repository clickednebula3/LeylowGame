hspeed = random_range(-2, 2);
initial_vspeed = random_range(-16, -8);
vspeed = initial_vspeed;
rspeed = random_range(0.5, 2) * ((2*irandom_range(0, 1))-1);
image_index = irandom_range(0, sprite_get_number(sprite_index)-1);
fade_away_time = random_range(1, 2)*sec;
gravity = 1;