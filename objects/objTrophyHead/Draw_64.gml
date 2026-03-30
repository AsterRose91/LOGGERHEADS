/// @description Insert description here
// You can write your code in this editor

if (isGamePaused()) {exit;}

if (!DRAW_FRIEND_BIO || !have_met_friend(FRIEND_ID)) {exit;}

var FRIEND_BIO = getFriendBiography(FRIEND_ID);
var FRIEND_STRING = $"This is {FRIEND_BIO.name}.\n{FRIEND_BIO.desc}"

with (objSinglePlayerController) {DRAW_HUD = false;}

draw_set_font(Font_Small);
draw_set_color(c_white);
var _PAD = 8;
var _X = (GUI_W div 2) - 128;
var _Y = (GUI_H div 3) - ((string_height_ext(FRIEND_STRING, -1, 256) + (_PAD * 2) ) div 2);
draw_text_box(_X, _Y, 0, 0, FRIEND_STRING, sprMenuBack1NEW, 0, _PAD, true, 256);

//with (objSinglePlayerController) {DRAW_HUD = true;}