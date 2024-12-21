/// @description animator

if (instance_exists(obj_player)) {
	obj_player.frozen = true;
}

if (array_length(animationMoves) > cycle) {
	if (animationMoves[cycle][2] == -1) {
		var mostMove = max(abs(animationMoves[cycle][0]), abs(animationMoves[cycle][1]));
		animationMoves[cycle][2] = mostMove / 16;
	}
	
	if (animationMoves[cycle][2] > 0) {//check seconds remaining
		
		x += xOffPerTick;
		y += yOffPerTick;
		xLeft -= xOffPerTick;
		yLeft -= yOffPerTick;
		
		animationMoves[cycle][2] -= tick;
		animationMoves[cycle][2] = clamp(animationMoves[cycle][2], 0, animationMoves[cycle][2]);
		
		alarm[1] = 1;
	} else {
		
		//recycle
		alarm[2] = 1;
		
	}
} else {
	//finished
}
