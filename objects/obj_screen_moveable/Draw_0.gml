if (
	(
		bbox_bottom < camera_get_view_y(camera_get_active()) ||
		bbox_top > camera_get_view_y(camera_get_active())+view_hport[0] ||
		bbox_right < camera_get_view_x(camera_get_active()) ||
		bbox_left > camera_get_view_x(camera_get_active())+view_wport[0]
	) && !canStretchGoesDown && !canStretchGoesUp
) {
	
} else {
	var sprW = sprite_get_width(spr);
	var sprH = sprite_get_height(spr);

	if (canDepth) {
		depth = -bbox_bottom;//(bbox_top+sprH);
		if (collision_rectangle(x, y, x+sprW, y+sprH, obj_player, false, true)  != noone) {
			if (obj_player.bbox_bottom < bbox_bottom /*y+sprH*/) {
				alph = alphAmount;
			}
		}
	}
	else {
		//depth = -room_height*1000;
	}

	if (canTile) {
		if (canCoolerTile) {
		
			if (canStretchGoesDown) {
				var iCount = 0;
				var jCount = 0;
				for (var i=0; i < tileWidth; i+= sprW*(26/32)) {
					for (var j=0; j < tileHeight; j+= sprH) {
						if ( i % sprW == 0 && j % sprH == 0 ) {
							var lastW = (tileWidth/sprW)-1;
							var lastH = (tileHeight/sprH)-1;
					
							if (iCount == 0 && canTileLeft) {//left to right
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite_pos(spr, 0, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite_pos(spr, 2, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								} else {
									draw_sprite_pos(spr, 1, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								}
						
							}
							else if (iCount == lastW && canTileRight) {
						
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite_pos(spr, 6, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite_pos(spr, 8, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								} else {
									draw_sprite_pos(spr, 7, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								}
						
							}
							else {
						
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite_pos(spr, 3, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite_pos(spr, 5, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								} else {
									draw_sprite_pos(spr, 4, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
								}
						
							}
						}
						jCount += 1;
					}
					jCount = 0;
					iCount +=1;
				}
				iCount = 0;
			}
			else if (canStretchGoesUp) {
				var iCount = 0;
				var jCount = 0;
				for (var i=0; i < tileWidth; i+= sprW*(26/32)) {
					for (var j=0; j < tileHeight; j+= sprH) {
						if ( i % sprW == 0 && j % sprH == 0 ) {
							var lastW = (tileWidth/sprW)-1;
							var lastH = (tileHeight/sprH)-1;
					
							if (iCount == 0 && canTileLeft) {//left to right
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite_pos(spr, 0, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite_pos(spr, 2, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								} else {
									draw_sprite_pos(spr, 1, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								}
						
							}
							else if (iCount == lastW && canTileRight) {
						
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite_pos(spr, 6, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite_pos(spr, 8, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								} else {
									draw_sprite_pos(spr, 7, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								}
						
							}
							else {
						
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite_pos(spr, 3, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite_pos(spr, 5, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								} else {
									draw_sprite_pos(spr, 4, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
								}
						
							}
						}
						jCount += 1;
					}
					jCount = 0;
					iCount +=1;
				}
				iCount = 0;
			}
			else {
				var iCount = 0;
				var jCount = 0;
				for (var i=0; i < tileWidth; i+=sprW) {
					for (var j=0; j < tileHeight; j+=sprH) {
						if ( i % sprW == 0 && j % sprH == 0 ) {
							var lastW = (tileWidth/sprW)-1;
							var lastH = (tileHeight/sprH)-1;
					
							if (iCount == 0 && canTileLeft) {//left to right
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite(spr, 0, x+i, y+j);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite(spr, 2, x+i, y+j);
								} else {
									if (canConnectVertically && jCount%2==1) {
										draw_sprite_ext(spr, 1, x+i, y+j+sprH, 1, -1, 0, c_white, 1);
									} else {
										draw_sprite(spr, 1, x+i, y+j);
									}
								}
						
							}
							else if (iCount == lastW && canTileRight) {
						
								if (jCount == 0 && canTileUp) {//up to down
									draw_sprite(spr, 6, x+i, y+j);
								} else if (jCount == lastH && canTileDown) {
									draw_sprite(spr, 8, x+i, y+j);
								} else {
									if (canConnectVertically && jCount%2==1) {
										draw_sprite_ext(spr, 7, x+i, y+j+sprH, 1, -1, 0, c_white, 1);
									} else {
										draw_sprite(spr, 7, x+i, y+j);
									}
								}
						
							}
							else {
						
								if (jCount == 0 && canTileUp) {//up to down
									if (canConnectHorizontally && iCount%2==1) {
										draw_sprite_ext(spr, 3, x+i+sprW, y+j, -1, 1, 0, c_white, 1);
									} else {
										draw_sprite(spr, 3, x+i, y+j);
									}
								} else if (jCount == lastH && canTileDown) {
									if (canConnectHorizontally && iCount%2==1) {
										draw_sprite_ext(spr, 5, x+i+sprW, y+j, -1, 1, 0, c_white, 1);
									} else {
										draw_sprite(spr, 5, x+i, y+j);
									}
								} else {
									if (canConnectHorizontally && iCount%2==1) {
										if (canConnectVertically && jCount%2==1) {
											draw_sprite_ext(spr, 4, x+i+sprW, y+j+sprH, -1, -1, 0, c_white, 1);
										} else {
											draw_sprite_ext(spr, 4, x+i+sprW, y+j, -1, 1, 0, c_white, 1);
										}
									} else {
										if (canConnectVertically && jCount%2==1) {
											draw_sprite_ext(spr, 4, x+i, y+j+sprH, 1, -1, 0, c_white, 1);
										} else {
											if (canCoolerCorners) {
												if (iCount == 0) {
													if (jCount == 0) {
														draw_sprite(spr, 9, x+i, y+j);
													} else if (jCount == lastH) {
														draw_sprite(spr, 10, x+i, y+j);
													} else {
														draw_sprite(spr, 4, x+i, y+j);
													}
												} else if (iCount == lastW) {
													if (jCount == 0) {
														draw_sprite(spr, 11, x+i, y+j);
													} else if (jCount == lastH) {
														draw_sprite(spr, 12, x+i, y+j);
													} else {
														draw_sprite(spr, 4, x+i, y+j);
													}
												} else {
													draw_sprite(spr, 4, x+i, y+j);
												}
											} else {
												draw_sprite(spr, 4, x+i, y+j);
											}
										}
									}
								}
						
							}
						}
						jCount+=1;
					}
					jCount = 0;
					iCount+=1;
				}
				iCount = 0;
			}
		}
		else {
			if (canStretchGoesDown) {
				var iCount = 0;
				var jCount = 0;
				for (var i=0; i < tileWidth; i+= sprW*(26/32)) {
					for (var j=0; j < tileHeight; j+= sprH) {
						draw_sprite_pos(spr, sprI, x+i-1, y+j+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+(sprH/2)+(iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH+(sprH/2)+(iCount*sprH/2)+1, x+i-1, y+j+sprH+(iCount*sprH/2)+1, 1);
						jCount += 1;
					}
					jCount = 0;
					iCount +=1;
				}
				iCount = 0;
			
			}
			else if (canStretchGoesUp) {
				var iCount = 0;
				var jCount = 0;
				for (var i=0; i < tileWidth; i+= sprW*(26/32)) {
					for (var j=0; j < tileHeight; j+= sprH) {
						draw_sprite_pos(spr, sprI, x+i-1, y+j+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j-(sprH/2)+(-iCount*sprH/2), x+i+(sprW*(26/32)), y+j+sprH-(sprH/2)+(-iCount*sprH/2)+1, x+i-1, y+j+sprH+(-iCount*sprH/2)+1, 1);
						jCount += 1;
					}
					jCount = 0;
					iCount +=1;
				}
				iCount = 0;
			
			}
			else {
				for (var i=0; i < tileWidth; i+=sprW) {
					for (var j=0; j < tileHeight; j+=sprH) {
						if ( i % sprW == 0 && j % sprH == 0 ) {
							if (
								y+j+sprH < camera_get_view_y(camera_get_active()) ||
								y+j > camera_get_view_y(camera_get_active())+view_hport[0] ||
								x+i+sprW < camera_get_view_x(camera_get_active()) ||
								x+i > camera_get_view_x(camera_get_active())+view_wport[0]
							) {
								//do not show
							} else {
								draw_sprite(spr, sprI, x+i, y+j);
							}
						}
					}
				}
			}
		}
	} else {
		draw_sprite_ext(spr, sprI, x, y, 1, 1, 0, c_white, alph);
	}
	alph = 1;
}