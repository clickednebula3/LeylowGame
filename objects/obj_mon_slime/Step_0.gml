depth = -bbox_bottom;

if (!isSleeping)
{
	if (midJump || (!stunned && !obj_player.frozen && !confused)) {
		
		if (isJumpySlime) {
			if (myTime % sec == 0)
			{//every second?
				var particle_goo = instance_create_depth(x, y, depth, obj_particles_slime);
				particle_goo.myColor = myColor;
				particle_goo.spawn_xscale = spawn_xscale;
				particle_goo.spawn_yscale = spawn_yscale;
				
				targetAngle = point_direction(x, y, obj_player.x, obj_player.y);
				var nextJumpDistance = min(MyDistanceInAJump, point_distance(x, y, obj_player.x, obj_player.y));
			
				jumpStartX = x;
				jumpStartY = y;
				targetX = x + (nextJumpDistance*dcos(targetAngle));
				targetY = y + (nextJumpDistance*-dsin(targetAngle));
				
				//var jumpStoppers = collision_line(x, y, targetX, targetY, obj_collisionbox, true, true);
				var jumpStoppers = collision_point(targetX, targetY, obj_collisionbox, true, true);
				for (var i=0; i<20; i++) {
					if (jumpStoppers == noone) { break; }
					nextJumpDistance *= 0.8;
					targetX = x + (nextJumpDistance*dcos(targetAngle));
					targetY = y + (nextJumpDistance*-dsin(targetAngle));
					//jumpStoppers = collision_line(x, y, targetX, targetY, obj_collisionbox, true, true);
					jumpStoppers = collision_point(targetX, targetY, obj_collisionbox, true, true);
				}
				if (jumpStoppers != noone) { targetX = jumpStartX; targetY = jumpStartY; }
			
				midJump = true;
			}
			else
			{
				if (myTime % sec < sec/2)
				{
					var fittingTime = myTime % sec;
					var TimePercent =  2 * fittingTime / sec;
					var veryCoolJumpMechanicAmountWithSine = (jumpHeight*-dsin(360*myTime/sec));
				
					x = jumpStartX + (TimePercent*(targetX-jumpStartX));
					y = jumpStartY + (TimePercent*(targetY-jumpStartY)) + veryCoolJumpMechanicAmountWithSine;
					depth = -bbox_bottom+veryCoolJumpMechanicAmountWithSine; //find point on ground
				}
				else
				{
					midJump = false;
					x = targetX;
					y = targetY;
					if (myTime > 20) {
						var fittingTime = myTime % sec;
						var TimePercent = 2 * (fittingTime - (sec/2)) / sec;
						image_xscale = (spawn_xscale) - ((TimePercent-0.5)/2);
						image_yscale = (spawn_yscale) + ((TimePercent-0.5)/2);
					}
				}
			}
		} else {
			if (current_time/10 % sec == 0) {
				var particle_goo = instance_create_depth(x, y, depth, obj_particles_slime);
				particle_goo.myColor = myColor;
				particle_goo.spawn_xscale = spawn_xscale;
				particle_goo.spawn_yscale = spawn_yscale;
			}
			direction = point_direction(x, y, obj_player.x, obj_player.y);
			speed = spd;
		}
		
		myTime+=1;//edit for fun
	}
	else if (!stunned) {
		speed = 0;
	}
	
	
}
else
{
	image_xscale = (spawn_xscale) - 0.2*dsin(current_time/10);
	image_yscale = (spawn_yscale) + 0.2*dsin(current_time/10);
	
	if ( (!cantWakeUp) &&
		(instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < wakeUpRadius*spawn_yscale) ||
		collision_circle(x, y, wakeUpRadius*spawn_yscale, obj_bullet, false, true) != noone
	) {
		isSleeping = false;
	}
	
	if (cantWakeUp) {
		speed *= 0.97;
	}
}

if (!midJump) { confused = false; }

if ((obj_player.behindGrastickusAmount > grasticki_blinding_amount && bbox_bottom > obj_player.bbox_bottom) || (obj_player.infrontGrastickusAmount > grasticki_blinding_amount && bbox_bottom < obj_player.bbox_bottom) || (point_distance(x, y, obj_player.x, obj_player.y) > giveUpRadius)) {
	speed = 0;
	image_xscale = spawn_xscale;
	image_yscale = spawn_yscale;
	confused = true;
	confusionGiveUp += 1;
} else { confusionGiveUp -= 2; }
confusionGiveUp = clamp(confusionGiveUp, 0, 1.2*confusionGiveUpMax);

if (confusionGiveUp >= confusionGiveUpMax) { isSleeping = true; }


if (Health <= 0) { instance_destroy(); }