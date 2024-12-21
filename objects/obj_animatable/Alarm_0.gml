/// @description initilize animation
if (instance_exists(obj_player)) {
	//specific animation interactions here
	if (animationId == 2) {
		if (cycle == 12) {
			if (array_contains(obj_player.seenAnimations, 3)) {
				animationMoves[13] = [0, 0, 5, 3, true, ["I found this hat somewhere near where \nyou've been knocked out.         \nI think it belongs to you."], false];
				animationMoves[14] = [0, 0, 4, 3, true, ["(You tell leylow about how you lost your \nmomory and have nowhere to go)"], false];
				animationMoves[15] = [0, 0, 2, 11, true, ["Hey.."], false];
				animationMoves[16] = [0, 0, 4, 7, true, ["If you don't have a place to stay...     \nYou can stay in my house anytime!"], false];
				animationMoves[17] = [0, 0, 4, 3, true, ["As long as you help me explore the cave!"], false];
				animationMoves[18] = [0, 0, 3, 7, true, ["It's gonna be fun!          \nWe'd be like an exploration team!"], false];
				animationMoves[19] = [0, 0, 5, 3, true, ["Let's head to my place.    \nWe need to be prepared."], false];
			}
			if (array_contains(obj_player.seenAnimations, 4)) {
				animationMoves[13] = [0, 0, 5, 19, true, ["Wha-   Of course not!!         \nYou looked like you need some help is all!"], false];
				animationMoves[14] = [0, 0, 4, 3, true, ["(You tell leylow about how you lost your \nmomory and have nowhere to go)"], false];
				animationMoves[15] = [0, 0, 2, 11, true, ["Hey.."], false];
				animationMoves[16] = [0, 0, 4, 7, true, ["If you don't have a place to stay...     \nYou can stay in my house anytime!"], false];
				animationMoves[17] = [0, 0, 4, 3, true, ["As long as you help me explore the cave!"], false];
				animationMoves[18] = [0, 0, 3, 7, true, ["It's gonna be fun!          \nWe'd be like an exploration team!"], false];
				animationMoves[19] = [0, 0, 5, 3, true, ["Let's head to my place.    \nWe need to be prepared."], false];
			}
		}
		if (cycle == 13) {
			if (array_contains(obj_player.seenAnimations, 3)) {
				//obj_player.sprite_index = spr_char_chara;
				obj_player.hasHat = true;
			}
		}
	}
	
	
	
	//the actual init anim here
	if (array_contains(obj_player.seenAnimations, animationId)) {
		instance_destroy();
	} else {
		obj_player.frozen = true;
		x += xLeft;
		y += yLeft;
		if (array_length(animationMoves) > cycle+1) {
			cycle += 1;
	
			xLeft = animationMoves[cycle][0];
			yLeft = animationMoves[cycle][1];
	
			xOffPerTick = animationMoves[cycle][0]/(animationMoves[cycle][2]*sec);
			yOffPerTick = animationMoves[cycle][1]/(animationMoves[cycle][2]*sec);
			sprI = animationMoves[cycle][3];
			
			var choiceStr = [];
			var choiceAnims = [];
			dontAutoContinue = false;
			if (array_length(animationMoves[cycle]) >= 13) {
				choiceStr = animationMoves[cycle][11];
				choiceAnims = animationMoves[cycle][12];
				dontAutoContinue = animationMoves[cycle][13];
			}
	
			if (animationMoves[cycle][4]) {
				scr_textbox(animationMoves[cycle][5], !animationMoves[cycle][6], 30, sprIcons, sprIconI, choiceStr, choiceAnims, dontAutoContinue);
			}
			
			if (array_length(animationMoves[cycle]) > 10) {
				if (instance_exists(obj_player)) {
					if (animationMoves[cycle][7]) {
						obj_player.image_index = animationMoves[cycle][8];
					}
					obj_player.x += animationMoves[cycle][9];
					obj_player.y += animationMoves[cycle][10];
				}
			}
			
			
			alarm[1] = 1;
		} else {
			//finish
			obj_player.frozen = false;
			array_push(obj_player.seenAnimations, animationId);
			instance_destroy();
		}
	}
} else {
	instance_destroy();
}
