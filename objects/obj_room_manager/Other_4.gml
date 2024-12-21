//if (audio_is_playing(snd_introsmooth)) { audio_stop_sound(snd_introsmooth); }

if (layer_exists("Encounter")) {
	var elayer = layer_get_id("Encounter");
	layer_set_visible(elayer, false);
}

if (
	(string_starts_with(room_get_name(room), "rm_cave") ||
	string_starts_with(room_get_name(room), "rm_mysticave"))/* &&
	array_contains(obj_player.inventory, item_torch)*/
) {
	if (!audio_is_playing(mus_myscave)/* || !audio_is_playing(mus_myscave_back)*/) {
		audio_stop_sound(mus_myscave);
		//audio_stop_sound(mus_myscave_back);
		mainMusic = audio_play_sound(mus_myscave, 4, true);
		//backMusic = audio_play_sound(mus_myscave_back, 4, true);
		//audio_sound_loop_start(mainMusic, 0);
		//audio_sound_loop_start(backMusic, 0);
		//audio_sound_loop_end(mainMusic, 86.33);
		//audio_sound_loop_end(backMusic, 86.33);
	}
}
else {
	audio_stop_sound(mus_myscave);
	//audio_stop_sound(mus_myscave_back);
}
if (string_starts_with(room_get_name(room), "rm_mystitreeplace")) {
	if (!audio_is_playing(mus_myscave_ft_jhozan_whimsical)) {
		audio_stop_sound(mus_myscave);
		mainMusic = audio_play_sound(mus_myscave_ft_jhozan_whimsical, 4, true);
	}
}
else {
	audio_stop_sound(mus_myscave_ft_jhozan_whimsical);
}



if (
	(string_starts_with(room_get_name(room), "rm_forest") ||
	string_starts_with(room_get_name(room), "rm_mountain") ||
	string_starts_with(room_get_name(room), "rm_Forest") ||
	string_starts_with(room_get_name(room), "rm_MoistForest") ||
	string_starts_with(room_get_name(room), "rm_grayscalemountain") ||
	string_starts_with(room_get_name(room), "rm_LeylowHomeOutside") ||
	string_starts_with(room_get_name(room), "rm_tily")) &&
	array_contains(obj_player.seenAnimations, 1)
) {
	if (!audio_is_playing(mus_BumpyOOMBeat)) { mainMusic = audio_play_sound(mus_BumpyOOMBeat, 4, true); }
}
else { audio_stop_sound(mus_BumpyOOMBeat); }


if (
	room == rm_cave ||
	room == rm_forest ||
	room == rm_forest_deeper ||
	room == rm_forest_deeper_new ||
	room == rm_mountain ||
	room == rm_town
) { obj_player.screenMoveMode = true; }
else { obj_player.screenMoveMode = false; }


obj_player.speed = 0;

game_save("Save.dat");