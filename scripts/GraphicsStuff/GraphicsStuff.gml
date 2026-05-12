/// DISPLAY PARAMETERS
/// 16:9 ASPECT RATIO
/// 40x40 PIXEL TILESET (for levels)
#macro GUI_W 640 
#macro GUI_H 360 
#macro DISP_W 1280 
#macro DISP_H 720 
#macro GAMESPEED 60

// TRANSITON FILTERS
fx_create("_filter_pixelate");
fx_create("_filter_linear_blur");
fx_create("_filter_large_blur");

// BLUR EFFECT
fx_create("_effect_gaussian_blur");



///@func draw_self_pixel([x_offset], [y_offset])
///@desc draws at floored positions
///@arg {real} [x_offset]
///@arg {real} [y_offset]
function draw_self_pixel(x_offset = 0, y_offset = 0) {
	draw_sprite_ext(sprite_index, image_index, floor(x + x_offset), floor(y + y_offset), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

#region ROOM TO GUI COORDINATES CONVERSION
/// Credit to attic-stuff

///@func room_x_to_gui([view])
///@desc converts a room position to a gui position
///@param {real} [view] the view number. defaults to 0
function room_x_to_gui(view = 0) {
	return (x - camera_get_view_x(view_camera[view])) * (display_get_gui_width() / camera_get_view_width(view_camera[view]));
}

///@func room_y_to_gui([view])
///@desc converts a room position to a gui position
///@param {real} [view] the view number. defaults to 0
///@returns {real}
function room_y_to_gui(view = 0) {
	return (y - camera_get_view_y(view_camera[view])) * (display_get_gui_height() / camera_get_view_height(view_camera[view]));
}
#endregion

#region TEXT BOXES AND MESSAGES

///@func draw_text_outline(x, y, str, color, [outline_color], [width])
///@desc draw a string with an outline of [outline_color] around it
///@arg {real} x
///@arg {real} y
///@arg {string} str
///@arg {constant.color} color
///@arg {constant.color} [outline_color]
///@arg {real} [width]
function draw_text_outline(x, y, str, color, outline_color = c_black, width = -1) {
	var do_fixed_width = (width != -1);
	var c_text = color ?? COLORS.COLOR_RED, c_line = outline_color ?? c_black;
	
	if (!do_fixed_width) {
		// DEFAULT
		draw_text_color(x + 1, y, str, c_line, c_line, c_line, c_line, 1);
		draw_text_color(x - 1, y, str, c_line, c_line, c_line, c_line, 1);
		draw_text_color(x, y + 1, str, c_line, c_line, c_line, c_line, 1);
		draw_text_color(x, y - 1, str, c_line, c_line, c_line, c_line, 1);
		draw_text_color(x, y, str, c_text, c_text, c_text, c_text, 1);	
		
	} else {
		// FIXED-WIDTH
		draw_text_ext_color(x - 1, y, str, -1, width, c_line, c_line, c_line, c_line, 1);
		draw_text_ext_color(x + 1, y, str, -1, width, c_line, c_line, c_line, c_line, 1);
		draw_text_ext_color(x, y - 1, str, -1, width, c_line, c_line, c_line, c_line, 1);
		draw_text_ext_color(x, y + 1, str, -1, width, c_line, c_line, c_line, c_line, 1);
		draw_text_ext_color(x, y, str, -1, width, c_text, c_text, c_text, c_text, 1);			
	}

}


///@func draw_text_drop_shadow(x, y, str, color, [shadow_color], [x_offset], [y_offset], [width])
///@desc draw a string with a shadow below it.
///@arg {real} x
///@arg {real} y
///@arg {string} str
///@arg {constant.colour} color 
///@arg {constant.colour} [shadow_color]
///@arg {real} [x_offset]
///@arg {real} [y_offset]
///@arg {real} [width]
function draw_text_drop_shadow(x, y, str, color = COLORS.COLOR_RED, shadow_color = c_black, x_offset = 3, y_offset = 3, width = -1) {
	// IF WIDTH IS SET TO ANYTHING BESIDES THE DEFAULT VALUE (-1) ENTER "FIXED-WIDTH" MODE
	var do_fixed_width = (width != -1);

	var c_text,c_shad,dx,dy;
	
	// SHADOW DRAWING OFFSET
	dx = x_offset ?? 3; 
	dy = y_offset ?? 3;
	
	// TEXT AND SHADOW COLORS
	c_text = color ?? COLORS.COLOR_RED;
	c_shad = shadow_color ?? c_black;
	
	if (!do_fixed_width) {
		// DEFAULT
		draw_text_color(x + dx, y+dy, str, c_shad, c_shad, c_shad, c_shad, 0.5);	
		draw_text_color(x, y, str, c_text, c_text, c_text, c_text, 1);	
		
	} else {
		// FIXED-WIDTH
		draw_text_ext_color(x + dx, y + dy, str, -1, width, c_shad, c_shad, c_shad, c_shad, 0.5);	
		draw_text_ext_color(x, y, str, -1, width, c_text, c_text, c_text, c_text, 1);			
	}
}

///@func get_size(w, h, pad, [tile_size])
///@desc returns a multiple of [tile_size] that will fit the message within a box comprised of tiles
///@arg {real} w
///@arg {real} h
///@arg {real} pad
///@arg {real} [tile_size]
///@returns {struct}
function get_size(w, h, pad, tile_size = 20) {
	var r = tile_size div 2;						// ROUNDING THRESHOLD
	var _2p = pad + pad;							// MESSAGE PADDING
	var _w = w + _2p;								// MESSAGE WIDTH
	var _h = h + _2p;								// MESSAGE HEIGHT
	var w_mod = (_w mod tile_size)					// WIDTH % TILE_SIZE
	var h_mod = (_h mod tile_size)					// HEIGHT % TILE_SIZE
	var r_w = (w_mod >= r) ? 1 : 0;					// ROUND WIDTH UP OR NOT?
	var r_h = (h_mod >= r) ? 1 : 0;					// ROUND HEIGHT UP OR NOT?
	return {
		w: tile_size * ((_w div tile_size) + r_w), 
		h: tile_size * ((_h div tile_size) + r_h)
	};	
}

///@func draw_text_box(x, y, w, h, message, sprite_index, image_index, pad, shadow, [width], [text_color], [shadow_color], [image_alpha])
///@desc draw a text box. If you don't provide a sprite it just draws text
///@arg {real} x
///@arg {real} y
///@arg {real} w
///@arg {real} h
///@arg {string} message
///@arg {asset.GMSprite} sprite_index
///@arg {real} image_index
///@arg {real} pad
///@arg {bool} shadow
///@arg {real} [width]
///@arg {Constant.Color} [text_color]
///@arg {Constant.Color} [shadow_color]
///@arg {Real} [image_alpha]
function draw_text_box(x, y, w, h, message, sprite_index, image_index, pad, shadow, width = -1, text_color = c_white, shadow_color = c_black, image_alpha = 1) {
	
	// if this argument is set, it will automatically draw it in fixed width mode
	//var _width = is_null(argument[9], 1);
	var do_fixed = width != -1;
	
	// really tired of doing this over and over!
	var _2p = pad + pad; 
	
	// backdrop
	if (sprite_index != noone) {
		var spr_w = 40;//32;
		var spr_h = 20;//16;
		
		// multi line ternary statement because I couldn't read the single line one
		// cursed. Note to self to do this as little as humanly possible.
		var _size = do_fixed ? 
			get_size(width - _2p, string_height_ext(message, -1,width - _2p), pad) 
		:	get_size(string_width(message), string_height(message), pad);
	
		// try not to make the background sprite too small
		var min_w = max(spr_w, _size.w);
		var min_h = max(spr_h, _size.h);
	
		var _w = max(w, min_w);
		var _h = max(h, min_h);
	
		draw_sprite_stretched_ext(sprite_index, image_index, x, y, _w, _h, c_white, image_alpha);
	}
	
	
	if (!shadow) {
		// Draw text without a shadow		
		if (do_fixed) {draw_text(x+pad, y+pad, message);}
		else {
			draw_text_ext(x+pad, y+pad, message, -1, width - _2p );
		}
	} else {
		// Draw text with a shadow
		if (do_fixed) {
			draw_text_drop_shadow(x+pad, y+pad, message, text_color, shadow_color, 1, 1, width - _2p );
		} else {
			draw_text_drop_shadow(x+pad, y+pad, message, text_color, shadow_color, 1, 1);
		}
	}
} 
#endregion

#region GUI NUMBERS STUFF


///@func number_to_sprites(value, sprite_index, x, y, [color], [alpha])
///@desc uses a sprite to draw a numeric value to the screen
///@arg {real} value
///@arg {asset.GMSprite} [sprite_index]
///@arg {real} x
///@arg {real} y
///@arg {Constant.Color} [color]
///@arg {real} [alpha]
///@returns {Bool}
function number_to_sprites(value, sprite_index, x, y, color = c_white, alpha = 1) {
	// SIMPLE SHIT
	if (value >=0 && value < 10) {
		draw_sprite_ext(sprGUInumbers, value, x, y, 1, 1, 0, color, alpha);
		return true;
	}
	// WHAT IF I COULD... DRAW A NUMBER WITHOUT CONVERTING IT TO A STRING?
	var _num_digits = floor(log10(abs(value))) + 1; // NUMBER OF DIGITS 
	var _w = sprite_get_width(sprite_index);
	var _num_length_pixels = (_num_digits - 1) * _w;
	
	var _e;
	for (var _i = 0; _i < _num_digits; _i++) {
		if (_i <= 0) {_e = value mod 10;} // UNITS
		else  {_e = (value mod power(10, _i + 1) ) div power(10, _i);} // TENS, HUNDREDS, ET AL
		draw_sprite_ext(sprGUInumbers, _e, x + _num_length_pixels - (_w * _i), y, 1, 1, 0, color, alpha);
	}

	return true;
}


#endregion

#region LEVEL SELECT MAP COLLISION SETTING

///@func level_select_map_collisions([tilelayer_id], [collisionlayer_id], [collision_tile_ids])
///@desc place in the room creation code for the level select map
///@arg {String|Asset.GMLayer} [tilelayer_id]
///@arg {String|Asset.GMLayer} [collisionlayer_id]
///@arg {Array} [collision_tile_ids]
function level_select_map_collisions(tilelayer_id = "Tiles_1", collisionlayer_id = "Collision", collision_tile_ids = [3, 6, 7, 8, 9, 16, 17, 18, 19]) {
	
	var tilemap = layer_tilemap_get_id(tilelayer_id),
	collisionmap = layer_tilemap_get_id(collisionlayer_id),
	width = tilemap_get_width(tilemap),
	height = tilemap_get_height(tilemap),
	count = width * height,
	
	row, col, tile, index;

	for (var i = 0; i < count; i++) {
		col = i mod width;
		row = i div width;
		tile = tilemap_get(tilemap, col, row);
		index = tile_get_index(tile);

		if (array_get_index(collision_tile_ids, index) > 0) {
				//put a collider on the colliding tilemap
				tilemap_set(collisionmap, 1, col, row);
		}
		
	}
	
	return;
}
#endregion