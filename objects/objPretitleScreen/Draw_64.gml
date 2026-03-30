/// @description LOADING SCREEN

#region LOADING
var draw_x, draw_y, draw_w, draw_h, _text;
draw_set_font(Font_Small);
_text = "PRESS ENTER TO START"
draw_w = string_width(_text);
draw_h = string_height(_text);
draw_x = ( GUI_W div 2 ) - ( draw_w div 2 );
draw_y = ( GUI_H div 2 ) - ( draw_h div 2 );
draw_text_drop_shadow(draw_x, draw_y, _text, c_white, c_dkgrey, 8, 8);
#endregion

