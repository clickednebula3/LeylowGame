if (room == rm_mystitreeplace) {
	if (irandom_range(0, 5) == 0) {
		instance_create_depth(irandom_range(0, room_width), irandom_range(0, room_height-300), depth-999, obj_particles_nebula_dust);
	}
}