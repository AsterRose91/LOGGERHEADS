/// @description DRAW A HINT

if (isGamePaused()) {exit;}

if (!SHOW_HINT) { exit;}

with (objSinglePlayerController) {DRAW_HUD = false;}
draw_set_font(Font_Small);
draw_set_color(c_white);
var _PAD = 12;
var _X = (GUI_W div 2) - 128;
var _Y = (GUI_H div 3) - ((string_height_ext(HINT_STRING, -1, 256) + (_PAD * 2) ) div 2);
draw_text_box(_X, _Y, 0, 0, HINT_STRING, sprMenuBack1NEW, 0, _PAD, true, 256);
//with (objSinglePlayerController) {DRAW_HUD = true;}