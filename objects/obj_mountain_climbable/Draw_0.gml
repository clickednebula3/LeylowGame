var sprW = sprite_get_width(spr);
var sprH = sprite_get_height(spr);

for (var i=0; i < tileWidth; i+=sprW) {
	for (var j=0; j < tileHeight; j+=sprH) {
		if ( i % sprW == 0 && j % sprH == 0 ) {
			draw_sprite(spr, image_index, x+i, y+j);
		}
	}
}