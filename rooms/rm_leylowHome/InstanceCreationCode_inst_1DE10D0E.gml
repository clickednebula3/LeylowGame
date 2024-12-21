animationId = 1;
animation_moves = [
	[1, false, scr_anim_create_prop, obj_npc_prop, x, y, 0],//create leylow
	[1, false, scr_anim_set_player_freeze, true],
	
	//1
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 1],
	[2*sec, false, scr_anim_update_player_sprite, spr_char_char_hatless, 4],
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 14],
	[sec, false, scr_anim_update_player_sprite, spr_char_char_hatless, 5],
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 0],
	[1, false, scr_anim_update_player_sprite, spr_char_char_hatless, 6],
	[sec, true, scr_anim_move_prop, 0, 0, 1.3],
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 2],
	[1, false, scr_anim_update_player_sprite, spr_char_char_hatless, 7],
	[2*sec, true, scr_anim_move_prop, 0, -1.6, 0],
	[sec, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 1],
	[1, false, scr_anim_update_player_sprite, spr_char_char_hatless, 0],
	[sec/2, true, scr_anim_move_player, 0, 2],
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 2],
	[sec, false, scr_anim_update_player_sprite, spr_char_char_hatless, 3],
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 6],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["Hey there!   \nYou're finally awake!"], true, 30, spr_icons_leylow, 3],
	//9+
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 2],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I was worried about you..."], true, 30, spr_icons_leylow, 16],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["My name is Leylow.    \nWhat is your name?"], true, 30, spr_icons_leylow, 3],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["My name is..."], true, 30, spr_icons_char_Yu, 1],//prompt for NAME?
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I- I don't remember..."], true, 30, spr_icons_char_Yu, 2],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I don't rememember anything!"], true, 30, spr_icons_char_Yu, 3],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["Hmm."], true, 30, spr_icons_leylow, 1],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I found you knocked out in the forest,\nso I brought you here."], true, 30, spr_icons_leylow, 18],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I think you must've lost your memory.\nIt could explain why you were\nknocked out..."], true, 30, spr_icons_leylow, 18],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["Thank you for helping, Leylow."], true, 30, spr_icons_char_Yu, 1],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["No problem!"], true, 30, spr_icons_leylow, 7],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I forgot something in the forest.\nI have to go back."], true, 30, spr_icons_leylow, 1],
	[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["I'll be back soon.\nMake yourself at home!"], true, 30, spr_icons_leylow, 3],
	//21+
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 3],
	[2*sec, true, scr_anim_move_prop, 0, 1.6, 0],
	[1, false, scr_anim_update_prop_sprite, 0, spr_char_leylow, 0],
	[2*sec, true, scr_anim_move_prop, 0, 0, 1.6],
	
	
	[1, false, scr_anim_set_player_freeze, false],
	[1, false, scr_anim_remove_prop, 0],
	
	//[3*sec, false, scr_anim_do_nothing],
	//[sec/3, true, scr_anim_move_camera, 5, 0],
	//[sec, false, scr_anim_do_nothing],
	//[ANIM_FINISH_CONIDITION_NO_TEXTBOX, false, scr_textbox, ["Hai", "ok"], true, 20],
	//[sec, false, scr_anim_do_nothing],
	//[1, false, scr_anim_set_player_camera_control, true],
	//[sec/3, true, scr_anim_move_camera, 5, 0],
];