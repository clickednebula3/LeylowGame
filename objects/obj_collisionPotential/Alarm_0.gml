/// @description Summon Collision
var coll = instance_create_layer(x, y, "Instances", obj_collisionbox);
coll.image_xscale = image_xscale;
coll.image_yscale = image_yscale;
coll.image_angle = image_angle;
coll.direction = direction;
coll.visible = true;
if (fadeTimer >= 0) {
	coll.alarm[0] = fadeTimer;
}