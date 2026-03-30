/// @description DRAW A MESSAGE TELLING PLAYER WHAT LEVELS ARE NEEDED
if (!DRAW_MESSAGE) {exit;}

var msg = UPDATE_MESSAGE(ALL_DONE);
var msg_h = string_height_ext(msg, -1, GUI_W);
var _pad = 4
var _x = 0;
var _y = GUI_H - msg_h - (2*_pad);

// DRAW THE MESSAGE
draw_text_box(_x, _y, 0, 0, msg, sprMenuBack, 0, _pad, true, GUI_W);

DRAW_MESSAGE = false;