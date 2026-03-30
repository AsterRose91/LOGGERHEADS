/// @description DRAW INTERFACE
if (TransitionEffectActive()) {exit;}
if (!DRAW_HUD) {exit;}

draw_set_font(Font_Small);
draw_set_color(c_white);

//if (WAIT_TIMER > 0) {
//		#region WAIT
//		var msg_w = sprite_get_width(sprTIMBER);
//		var msg_h = sprite_get_height(sprTIMBER);
//		var msg_x = (GUI_W div 2) - (msg_w div 2);
//		var msg_y = (GUI_H div 2) - (msg_h div 2);
//		draw_sprite(sprTIMBER,0, msg_x, msg_y);
		
//		#endregion
//}

var draw_x = 8, draw_y = 8, _text, draw_h;

// draw numbers using new function
//_text = $"CHOPS: {CHOPS_COUNTER}";
_text = $"CHOPS: ";
draw_h = string_height(_text);
draw_text_drop_shadow(draw_x, draw_y, _text, c_white, c_black, 2, 2);
draw_y += draw_h + 2;
number_to_sprites(CHOPS_COUNTER, sprGUInumbers, draw_x + 40, draw_y - 10, c_white, 1);


//_text = $"BEST: {GetRoomHighscore(room)}";
_text = $"BEST: ";
draw_text_drop_shadow(draw_x, draw_y, _text, c_white, c_black, 2, 2);
draw_y += draw_h + 2;
number_to_sprites(GetRoomHighscore(room), sprGUInumbers, draw_x + 40, draw_y - 10, c_white, 1);



_text = $"RETRIES: {RETRIES_COUNTER}";
draw_text_drop_shadow(draw_x, draw_y, _text, c_white, c_black, 2, 2);
draw_y += draw_h + 2;

//if (WAIT_TIMER > 0) {
//	_text = $"WAIT...: {WAIT_TIMER}";
//	draw_text_drop_shadow(draw_x, draw_y, _text, c_white, c_black, 2, 2);
//	draw_y += draw_h + 2;
//}

_text = "P- pause menu, \nR- restart level\nC- undo move";
draw_text_drop_shadow(draw_x, draw_y, _text, c_white, c_black, 2, 2);

draw_text(GUI_W - 32, 8, $"{SECRET_VALUE}")

