if (/*breakable && */(other.spr == item_sword || other.spr == bullet_fireball)) {
	var loot_drop = instance_create_depth(x-8, y-8, depth, obj_interactable);
	loot_drop.spr = item_drop;
	loot_drop.isItem = true;
	for (var i=0; i<irandom_range(4, 8); i++)
		{ instance_create_depth(x, y, depth, obj_particle_pot_shatter); }
	instance_destroy(other);
	instance_destroy();
}