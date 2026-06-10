/// @description DRAW A HINT

if (isGamePaused()) {exit;}

if (!SHOW_HINT) { exit;}

with (objSinglePlayerController) {DRAW_HUD = false;}
draw_set_font(Font_Small);
draw_set_color(c_white);
var _PAD = 10;
var _MSG_W = 300;
var _MSG_H = string_height_scribble_ext(HINT_STRING, _MSG_W) + (_PAD * 2);
var _X = (GUI_W div 2) - (_MSG_W div 2);
var _Y = (GUI_H div 3) - (_MSG_H div 2);
draw_text_box_v2(_X, _Y, 0, 0, HINT_STRING, sprMenuBack1NEW, 0, 1, _PAD, true, _MSG_W);
