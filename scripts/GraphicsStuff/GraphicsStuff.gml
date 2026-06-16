/// DISPLAY PARAMETERS
/// 16:9 ASPECT RATIO
/// 40x40 PIXEL TILESET (for levels)
#macro GUI_W 640 
#macro GUI_H 360 
#macro DISP_W 1280 
#macro DISP_H 720 
#macro GAMESPEED 60

// ROOM TRANSITION EFFECTS
fx_create("_filter_pixelate");
fx_create("_filter_linear_blur");
fx_create("_filter_large_blur");

// BLUR EFFECT
fx_create("_effect_gaussian_blur");

// SCRIBBLE STUFF
#macro _SCRIBBLE_DEFAULT_FONT "Font_Small_new"
scribble_font_bake_outline_and_shadow("Font_Diagnostics","Font_Diagnostics_new",2,2,SCRIBBLE_OUTLINE.FOUR_DIR,0,false);
scribble_font_bake_outline_and_shadow("Font_Small","Font_Small_new",3,3,SCRIBBLE_OUTLINE.NO_OUTLINE,0,false);
scribble_font_set_default(_SCRIBBLE_DEFAULT_FONT);


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


///@func convert_hexcode_to_string(_color)
///@arg {Constant.Color} _color
///@returns {String}
function convert_hexcode_to_string(_color) {
	return $"#{dec_to_hex(_color, 6)}";
}


#region TEXT BOXES AND MESSAGES (SCRIBBLE VERSION)

///@func draw_text_box_v2(x, y, w, h, message, sprite_index, image_index, pad, shadow, [width], [text_color], [shadow_color], [image_alpha])
///@desc draw a text box. If you don't provide a sprite it just draws text
///@arg {real} x								// x-coordinate for drawing text
///@arg {real} y								// y-coordinate for drawing text
///@arg {real} w								// desired width of text box
///@arg {real} h								// desired height of text box
///@arg {string} message						// the string to be drawn
///@arg {asset.GMSprite} sprite_index			// the sprite to use as the background for the message box
///@arg {real} image_index						// the image index of the sprite
///@arg {Real} [image_alpha]					// image_alpha for the message box
///@arg {real} pad								// text padding
///@arg {bool} shadow							// do you want the text to have a shadow
///@arg {real} [width]							// text wrapping
///@arg {Constant.Color} [text_color]			// text color
///@arg {Constant.Color} [shadow_color]			// shadow color (black by default)
function draw_text_box_v2(x, y, w, h, message, sprite_index, image_index, image_alpha, pad, shadow, width = -1, text_color = #ffffff, shadow_color = #000000) {
	// NEW VERSION OF THIS FUNCTION THAT USES SCRIBBLE
	var c_text = convert_hexcode_to_string(text_color ?? c_white);
	var c_shad = (shadow_color ?? c_black);
	var a_shad = shadow? 0.9 : 0;
	var _2p = pad * 2;
	
	var _text = scribble($"[{c_text}]{message}").padding(pad,pad,pad,pad).shadow(c_shad, a_shad).wrap(width);
	
	// MESSAGE BACKGROUND
	if (sprite_index != noone) {
		// GET TEXT SIZE
		var _bbox = _text.get_bbox(x, y);
		
		var spr_w = 20
		, spr_h = 20
		, _bbox_width = (_bbox.right - _bbox.left)
		, _bbox_height = (_bbox.bottom - _bbox.top) ; 
		
		// MINIMUM SIZE FOR THE TEXT BOXES
		var _size = get_size(_bbox_width, _bbox_height, pad);
		
		var min_w = max(spr_w, _size.w);
		var min_h = max(spr_h, _size.h);
	
		var _w = max(w, min_w);
		var _h = max(h, min_h);
		draw_sprite_stretched_ext(sprite_index, image_index, x - pad, y - pad, _w, _h, c_white, image_alpha);
		
	}
	_text.draw(x, y)
	return;
} 

///@func draw_dialogbox_scribbletypist(x, y, w, h, message, pad, typist, [width], [speaker_obj])
///@desc draw a comicbook-style speech bubble for cutscenes
///@arg {real} x									// x-coordinate for drawing text
///@arg {real} y									// y-coordinate for drawing text
///@arg {real} w									// desired width of text box
///@arg {real} h									// desired height of text box
///@arg {string} message							// the string to be drawn
///@arg {real} pad									// text padding
///@arg {Struct.__scribble_class_typist} typist		// Scribble typist
///@arg {real} [width]								// text wrapping
///@arg {Id.Instance} [speaker_obj]					// the object representing the character speaking
function draw_dialogbox_scribbletypist(x, y, w, h, message, pad, typist, width = -1, speaker_obj = noone) {
	var scrib_current = scribble($"[Font_Dialogbox][c_black]{message}").padding(pad,pad,pad,pad).wrap(width);


	// DRAW SPEECH BUBBLE
	var bbox = scrib_current.get_bbox(x, y)
	,	bbox_width = bbox.right - bbox.left
	,	bbox_height = bbox.bottom - bbox.top
	,	_2p = pad * 2;

	draw_sprite_stretched_ext(sprDialogBoxBack1, 0, x - pad, y - pad, _2p + bbox_width, _2p + bbox_height, c_white, 1);

	// draw the tail of the speech bubble
	if (speaker_obj != noone) {
		if (instance_exists(speaker_obj)) {
			var _INSTANCE_SPEAKER = instance_nearest(x, y, speaker_obj)
			,	_x1 = (_INSTANCE_SPEAKER.bbox_left + _INSTANCE_SPEAKER.bbox_right) div 2
			,	_y1 = _INSTANCE_SPEAKER.bbox_top
			,	_x2 = x
			,	_y2 = y
			,	_x3 = _x2 + 20
			,	_y3 = _y2;
			draw_triangle_color(_x1, _y1, _x2, _y2, _x3, _y3, c_white, c_white, c_white, false);
		}
	}
	scrib_current.draw(x, y, typist); 
	return;
}




///@func draw_hintbox(message, [w], [h])
///@desc Use this for the signpost and gate objects, they always draw in the center of the screen
///@arg {string} message		// message to be drawn
///@arg {real} [w]				// width of message box
///@arg {real} [h]				// height of message box
function draw_hintbox(message, w = 0, h = 0) {
	var pad		=	10
	,	_2p		=	pad * 2
	,	_scrib  =	scribble($"[c_white]{message}").padding(pad,pad,pad,pad).shadow(#000000, 0.8).wrap(300)
	,	_width  =	_scrib.get_width()
	,	_height =	_scrib.get_height()
	,	_draw_x =	(GUI_W div 2) - (_width div 2)
	,	_draw_y =	(room_y_to_gui() <= (GUI_H div 2)) ? (5 * (GUI_H div 6)) - _height : (GUI_H div 6) + _height;
	
	var spr_w = 20
	,	spr_h = 20
			
	// MINIMUM SIZE FOR THE TEXT BOXES
	,	_size = get_size(_width, _height, pad)
	,	min_w = max(spr_w, _size.w)
	,	min_h = max(spr_h, _size.h)
	,	_w = max(w, min_w)
	,	_h = max(h, min_h);
	draw_sprite_stretched_ext(sprMenuBack3NEW, 0, _draw_x - pad, _draw_y - pad, _w, _h, c_white, 1);
		
	_scrib.draw(_draw_x, _draw_y);
	
	return;
}
#endregion



#region TEXT BOXES AND MESSAGES (OLD)

///@func draw_text_outline(x, y, str, _color, [outline_color], [width])
///@desc draw a string with an outline of [outline_color] around it
///@arg {real} x
///@arg {real} y
///@arg {string} str
///@arg {constant.color} _color
///@arg {constant.color} [outline_color]
///@arg {real} [width]
function draw_text_outline(x, y, str, _color, outline_color = #000000, width = -1) {
	var do_fixed_width = (width != -1);
	var c_text = convert_hexcode_to_string(_color ?? COLORS.COLOR_RED), 
		c_line = (outline_color ?? c_black);
	
	// convert c_text into a string
	
	var c_prev = draw_get_colour();
	//draw_set_color(c_text)	
	scribble($"[{c_text}]{str}").shadow(c_black,0).outline(c_line).draw(x, y);
	draw_set_colour(c_prev);
	
	return;
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
///@arg {real} [pad]
function draw_text_drop_shadow(x, y, str, color = COLORS.COLOR_RED, shadow_color = #000000, x_offset = 3, y_offset = 3, width = -1, pad = 1) {
	// IF WIDTH IS SET TO ANYTHING BESIDES THE DEFAULT VALUE (-1) ENTER "FIXED-WIDTH" MODE
	var fixed_width = (width != -1);

	var c_text,c_shad,dx,dy;
	
	// SHADOW DRAWING OFFSET
	dx = x_offset ?? 3; 
	dy = y_offset ?? 3;
	
	// TEXT AND SHADOW COLORS
	c_text = color ?? COLORS.COLOR_RED;
	c_shad = shadow_color ?? c_black;
	
	if (!fixed_width) {
		// DEFAULT
		draw_text_color(x + dx, y+dy, str, c_shad, c_shad, c_shad, c_shad, 0.5);	
		draw_text_color(x, y, str, c_text, c_text, c_text, c_text, 1);	
		
	} else {
		// FIXED-WIDTH
		draw_text_ext_color(x + dx, y + dy, str, -1, width, c_shad, c_shad, c_shad, c_shad, 0.5);	
		draw_text_ext_color(x, y, str, -1, width, c_text, c_text, c_text, c_text, 1);			
	}
	return;
}

///@func get_size(w, h, pad, [tile_size])
///@desc returns multiples of [tile_size] that will fit the message within a box
///@arg {real} w						// width of the message that needs to be boxed
///@arg {real} h						// height of the message that needs to be boxed
///@arg {real} pad						// padding of the message
///@arg {real} [tile_size]				// tile size
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
///@arg {real} x								// x-coordinate for drawing text
///@arg {real} y								// y-coordinate for drawing text
///@arg {real} w								// desired width of text box
///@arg {real} h								// desired height of text box
///@arg {string} message						// the string to be drawn
///@arg {asset.GMSprite} sprite_index			// the sprite to use as the background for the message box
///@arg {real} image_index						// the image index of the sprite
///@arg {real} pad								// text padding
///@arg {bool} shadow							// do you want the text to have a shadow
///@arg {real} [width]							// text wrapping
///@arg {Constant.Color} [text_color]			// text color
///@arg {Constant.Color} [shadow_color]			// shadow color (black by default)
///@arg {Real} [image_alpha]					// image_alpha for the message box
function draw_text_box(x, y, w, h, message, sprite_index, image_index, pad, shadow, width = -1, text_color = #ffffff, shadow_color = #000000, image_alpha = 1) {
	
	// if this argument is set, it will automatically draw it in fixed width mode
	var do_fixed = width != -1;
	
	// really tired of doing this over and over!
	var _2p = pad + pad; 
	
	// backdrop
	if (sprite_index != noone) {
		var spr_w = 40;
		var spr_h = 40;
		
		// multi line ternary statement because I couldn't read the single line one
		// cursed. Note to self to do this as little as humanly possible.
		var _size = do_fixed ? 
			get_size(width, string_height_ext(message, -1,width), pad) 
		:	get_size(string_width(message), string_height(message), pad);
	
		// try not to make the background sprite too small
		var min_w = max(spr_w, _size.w);
		var min_h = max(spr_h, _size.h);
	
		var _w = max(w, min_w);
		var _h = max(h, min_h);
	
		draw_sprite_stretched_ext(sprite_index, image_index, x, y, _w, _h, c_white, image_alpha);
	}
	
	var c_prev = draw_get_colour();
	draw_set_color(text_color);
	if (!shadow) {
		// Draw text without a shadow		
		if (do_fixed) {
			draw_text(x+pad, y+pad, message);
		}
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
	draw_set_colour(c_prev);
	return;
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