isSleeping = true;
wakeUpRadius = 16*5;

image_index = 1;
image_speed = 0;
tick = 0;

if (!array_contains(obj_player.inventory, item_sword)) {
	instance_destroy();
}