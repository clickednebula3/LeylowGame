wakeUpRadius = 16*4;
giveUpRadius = 64*8;
spd = 2.5;
Health = 5;

grasticki_blinding_amount = 6;

//bouncy movement
isJumpySlime = true;
myTime = 0;
MyDistanceInAJump = 16*7;
jumpHeight = 48;
jumpStartX = x;
jumpStartY = y;
targetAngle = 0;
targetX = x;
targetY = y;
alarm[1] = 1;
spawn_xscale = image_xscale;
spawn_yscale = image_yscale;

myColor = c_aqua;
damageColor = c_red;

midJump = false;
cantWakeUp = false;
isSleeping = true;
beingDamaged = false;
stunned = false;

isStackySlime = false;
parentStackySlime = noone;
childStackySlime = noone;
StackyGenerationsLeft = 0;//irandom(3, 5) sounds good?

confused = false;
confusionGiveUp = 0;
confusionGiveUpMax = sec*3;

alarm[2] = 360;

if (string_starts_with(room_get_name(room), "rm_mysticave"))
	{ isJumpySlime = false; }

if (!sylla_check_has_item(item_sword, obj_player) && room == rm_mysticave)
	{ instance_destroy(); }