var camx = camera_get_view_x(camera_get_active());
var camy = camera_get_view_y(camera_get_active());
var camw = camera_get_view_x(camera_get_active());
var camh = camera_get_view_height(camera_get_active());

var raise_amount = bbox_bottom-y;

x = (x + camw + gap + sprite_width/2 + myPartyIndex*(sprite_width+gap)) / 2;
y = camy + camh;

var playerIsObstructed = instance_exists(obj_player) && obj_player.y+64 > bbox_top && abs(obj_player.x - x) < 3*sprite_width/4;
var ownerIsObstructed = instance_exists(owner) && owner.y+64 > bbox_top && abs(owner.x - x) < 3*sprite_width/4;
if (playerIsObstructed || ownerIsObstructed) { image_alpha *= 0.98; }
else { image_alpha *= 1.1; }
image_alpha = clamp(image_alpha, 0.2, 1);

if (room == rm_leylowHome) { image_alpha = 0; raiseness = 0; vspeed = 20; }
vspeed *= 0.9;

if (obj_chatbox.on) { raiseness = 0; sprite_index = mode_compact; }
else { sprite_index = mode_live; }

y -= raiseness*raise_amount;



var MouseIsHovering = (bbox_left < mouse_x && mouse_x < bbox_right) && (bbox_top < mouse_y && mouse_y < bbox_bottom);
var MouseIsTooFar = (bbox_left < mouse_x-gap || mouse_x+gap < bbox_right) || (bbox_top < mouse_y-24 || mouse_y+24 < bbox_bottom);
var SwapHappening = (obj_chatbox.swapping && obj_chatbox.swap_party_index = myPartyIndex)

if (SwapHappening) { raiseness = 1; }
else {
	if (MouseIsHovering) { raiseness = max(0.1, raiseness*1.2); }
	else if (MouseIsTooFar) { raiseness *= 0.9; }
}

raiseness = clamp(raiseness, 0, 1);



if (sprite_index == mode_live && instance_exists(owner) && variable_instance_exists(owner, "Health")) {
	var a = draw_get_alpha();
	draw_set_alpha(image_alpha);
	draw_healthbar(
		x+health0x, y+health0y, x+health0x+health0w, y+health0y+health0h,
		owner.Health, make_color_rgb(54, 54, 54), health0color, health0color,
		0, true, false
	);
	draw_set_alpha(a);
}


draw_self();

//raisedForSwap = false;//

if (instance_exists(owner) && variable_instance_exists(owner, "sylladex")) {
	
	var fetched = -1;
	if (variable_instance_exists(owner, "fetch")) fetched = owner.fetch;
	
	for (var iy=0; iy<4; iy++) {
		for (var ix=0; ix<4; ix++) {
			
			var item_spr = owner.sylladex[iy][ix];
			
			var itemx = x + item0x + item_gap*ix;
			var itemy = y + item0y + item_gap*iy;
			
			var IsHoveredOver = (itemx < mouse_x && mouse_x < itemx+20) && (itemy < mouse_y && mouse_y < itemy+20);
			var IsSelectedItem = (iy == 0 && ix == fetched);
			var IsEnabledForUsage = false;//
			
			//swapping
			if (IsHoveredOver && mouse_check_button_pressed(mb_left)) {
				if (!obj_chatbox.swapping) {
					obj_chatbox.swap_party_index = myPartyIndex;
					obj_chatbox.swap_x = ix;
					obj_chatbox.swap_y = iy;
					obj_chatbox.swapping = true;
				} else {
					var portfolio = noone;
					with (obj_profile) { if (myPartyIndex == obj_chatbox.swap_party_index && portfolio == noone) { portfolio = self; } }
					if (instance_exists(portfolio) && instance_exists(portfolio.owner) && variable_instance_exists(portfolio.owner, "sylladex")) {
						//SWAP!
						var item_to_take = portfolio.owner.sylladex[obj_chatbox.swap_y][obj_chatbox.swap_x];
						portfolio.owner.sylladex[obj_chatbox.swap_y][obj_chatbox.swap_x] = owner.sylladex[iy][ix];
						owner.sylladex[iy][ix] = item_to_take;
					}
					obj_chatbox.swapping = false;
				}
			}
			
			var IsBeingSwapped = (obj_chatbox.swapping) && (obj_chatbox.swap_party_index == myPartyIndex) && (obj_chatbox.swap_x == ix) && (obj_chatbox.swap_y == iy);
			
			//selection
			//if (instance_exists(owner) && owner.object_index != obj_player && IsHoveredOver && mouse_check_button_pressed(mb_right)) {
			//	if (!obj_chatbox.swapping) {
				
			//	} else {
					
			//	}
			//}
			
			//if (!raisedForSwap && IsHoveredOver && mouse_check_button_pressed(mb_left)) {
			//	raisedForSwap = true;
			//	swapx = ix;
			//	swapy = iy;
			//}
			
			var back_spr = IsHoveredOver*2;
			if (back_spr<=0) back_spr = IsSelectedItem;
			if (back_spr<=0) back_spr = IsEnabledForUsage*3;
			if (IsBeingSwapped) back_spr = 4;
			//if (raisedForSwap && swapx == ix && swapy == iy) { back_spr = 4; }
			
			draw_sprite_ext(item_back, back_spr, itemx, itemy, 1, 1, 0, c_white, image_alpha);
			
			if (item_spr != spr_empty)
			{
				draw_sprite_ext( item_spr, 0,
					2 + itemx + sprite_get_xoffset(item_spr),
					2 + itemy + sprite_get_yoffset(item_spr),
					16/sprite_get_width(item_spr), 16/sprite_get_height(item_spr),
					0, c_white, image_alpha-0.1
				);
			}
		}
	}
}