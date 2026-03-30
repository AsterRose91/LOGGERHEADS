/// @description DRAW A MESSAGE TELLING PLAYER WHAT LEVELS ARE NEEDED

/// @description DRAW A MESSAGE TELLING PLAYER WHAT LEVELS ARE NEEDED
if (isGamePaused()){exit;}

if (!DRAW_MESSAGE) {exit;}

var MSG = UPDATE_MESSAGE(ALL_DONE);
var MSG_W = 300;
var MSG_H = string_height_ext(MSG, -1, MSG_W);
var PAD = 20;
var _X = (GUI_W div 2) - (MSG_W div 2);

// CHANGE THE Y-LOCATION OF THE MESSAGE BASED ON BOBBIE'S POSITION ON THE SCREEN
var _Y = (GUI_H div 4) - MSG_H - (2 * PAD);
if (room_y_to_gui() <= (GUI_H div 2)) {
	_Y = (3 * (GUI_H div 4)) + (MSG_H - (2 * PAD));
}

// DRAW THE MESSAGE
draw_text_box(_X, _Y, 0, 0, MSG, sprMenuBack3, 0, PAD, true, MSG_W);

DRAW_MESSAGE = false;



//if (!DRAW_MESSAGE) {exit;}

//var msg = UPDATE_MESSAGE(ALL_DONE);
//var msg_h = string_height_ext(msg, -1, GUI_W);
//var _pad = 4
//var _x = 0;
//var _y = GUI_H - msg_h - (2*_pad);

//// DRAW THE MESSAGE
//draw_text_box(_x, _y, 0, 0, msg, sprMenuBack, 0, _pad, true, GUI_W);

//DRAW_MESSAGE = false;