if (other.bbox_bottom-8 < bbox_bottom) {
	if (!stunned) {
		//other.frozen = true;
		if (isJumpySlime) {
			y = yprevious;
			targetX = 2*x - targetX;
		} else {
			direction = point_direction(other.x, other.y, x, y);
			speed = 6;
		}
		other.Health -= (20*(!cantWakeUp)) + (4*(cantWakeUp));
		stunned = true;
	}
	alarm[0] = sec/6;
	other.direction = point_direction(other.x, other.y, x, y)+180;
	other.speed = 4;
}