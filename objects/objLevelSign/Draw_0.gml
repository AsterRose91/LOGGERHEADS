/// @description DRAW THE SIGN AND THE LEVEL NUMBER IT POINTS TO

var c, draw_x, draw_y, _offset;
draw_set_font(Font_Small);

switch (SPRITE_TYPE) {
	default:
	case 0:
		// BASE SIGNPOST SPRITE
		draw_sprite_ext(sprSignpost, HIGHLIGHT?1:0, floor(x), floor(y), 1, 1, 0, c_white, 1);
		
		
		// DRAW A NUMBER ON THE SIGN
		// OR A QUESTION MARK
		if (DEMO_END_FLAG) {
			c = c_white;
			_offset = 0; //5 * ( (LEVEL_ID < 10) ? 0 : floor(log10(abs(LEVEL_ID))) );

			draw_x = x + (sprite_width div 2) - 5 - _offset;
			draw_y = y + (sprite_height div 2) - 10;

			//draw_text_color(draw_x, draw_y, string(LEVEL_ID), c, c, c, c, 1);
			//number_to_sprites(LEVEL_ID, sprGUInumbers, draw_x, draw_y, c, 1);
			draw_sprite_ext(sprGUInumbers, 10, draw_x, draw_y, 1, 1, 0, c, 1);
			

		} else {
			// LEVEL NUMBER
			c = hasLevelBeenCleared(LEVEL_ID) ? c_white : c_red;
			// REPLACE NORMAL TEXT DRAWING WITH THE NUMBER SPRITES
			// THIS COULD BE DONE WITH A SPRITE FONT BUT I DON'T HAVE ONE YET
	
			_offset = 5 * ( (LEVEL_ID < 10) ? 0 : floor(log10(abs(LEVEL_ID))) );

			draw_x = x + (sprite_width div 2) - 5 - _offset;
			draw_y = y + (sprite_height div 2) - 10;

			//draw_text_color(draw_x, draw_y, string(LEVEL_ID), c, c, c, c, 1);
			number_to_sprites(LEVEL_ID, sprGUInumbers, draw_x, draw_y, c, 1);
		}
		
		
		
		
		break;
		
	case 1:
		// HOUSE TYPE 1
		draw_sprite_ext(sprHous, HIGHLIGHT?3:2, floor(x), floor(y), 1, 1, 0, c_white, 1);
		break;
	
	case 2:
		// HOUSE TYPE 2
		draw_sprite_ext(sprHous, HIGHLIGHT?5:4, floor(x), floor(y), 1, 1, 0, c_white, 1);
		break;

	case 3:
		// HOUSE TYPE 3
		draw_sprite_ext(sprHous, HIGHLIGHT?1:0, floor(x), floor(y), 1, 1, 0, c_white, 1);
		break;


}







