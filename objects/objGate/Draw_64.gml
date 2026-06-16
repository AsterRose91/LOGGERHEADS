/// @description DRAW A MESSAGE TELLING PLAYER WHAT LEVELS ARE NEEDED
if (isGamePaused()){exit;}

if (!DRAW_MESSAGE) {exit;}


var MSG = UPDATE_MESSAGE(LEVELS_NEEDED_ARR)

draw_hintbox(MSG);
//,	MSG_W = string_width_scribble(MSG)
//,	MSG_H = string_height_scribble_ext(MSG, MSG_W) 
//,	PAD = 10
//,	_X = (GUI_W div 2) - (MSG_W div 2);

//// CHANGE THE Y-LOCATION OF THE MESSAGE BASED ON BOBBIE'S POSITION ON THE SCREEN
//var _Y = (GUI_H div 4) - (MSG_H + (2 * PAD));
//if (room_y_to_gui() <= (GUI_H div 2)) {
//	_Y = (3 * (GUI_H div 4)) - (MSG_H + (2 * PAD));
//}

//// DRAW THE MESSAGE
//draw_text_box_v2(_X, _Y, 0, 0, MSG, sprMenuBack3NEW, 0, 1, PAD, true, MSG_W);

DRAW_MESSAGE = false;