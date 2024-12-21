if (layer_exists("Encounter")) {
	tension = clamp(tension, 0, 1);//a percent about how much should the room be in ENCOUNTER form
	//tension += (keyboard_check_pressed(vk_pageup)-keyboard_check_pressed(vk_pagedown))/max_tension;
	var melayer = layer_get_id("Encounter");
	var metilemap = layer_tilemap_get_id(melayer);

	for (var i=0; i<tension*max_tension; i++) { draw_tilemap(metilemap, 0, 0); }
}