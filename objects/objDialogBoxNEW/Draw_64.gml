/// @description DRAW A MESSAGE
if (isGamePaused()) {exit;}
with (objSinglePlayerController) {DRAW_HUD = false;}


var _X = (GUI_W div 2) - (_MSG_WIDTH div 2)
,	_Y = (GUI_H div 3);



switch _STATE { 
	case DIALOGBOX_STATES.DISPLAYING_DIALOG: {
		draw_dialogbox_scribbletypist(_X, _Y, 0, 0, _CURRENT_MESSAGE, _PAD, _SCRIBBLE_TYPIST, _MSG_WIDTH, _CURRENT_SPEAKER);
		break;
	}
}