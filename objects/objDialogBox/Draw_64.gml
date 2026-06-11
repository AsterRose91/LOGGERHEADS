/// @description DRAW A MESSAGE

if (isGamePaused()) {exit;}

draw_set_font(Font_Dialogbox);

with (objSinglePlayerController) {DRAW_HUD = false;}


var _PAD = 10
,	_X = (GUI_W div 2) - 200
,	_Y = (GUI_H div 3);



switch _STATE { 
	case DIALOGBOX_STATES.DISPLAYING_DIALOG:
		
		var _MSG_STRING = string_copy(_CURRENT_MSG,0,floor(_MSG_ANIM_INDEX));
		_X = (GUI_W div 2) - 200;
		_Y = (GUI_H div 3) - ((string_height_scribble_ext(_MSG_STRING, 400) + (_PAD * 2) ) div 2);
		
		
		// DRAW A TAIL FOR THE SPEECH BUBBLE ORIGINATING FROM THE SPEAKER
		var _INSTANCE_SPEAKER = instance_nearest(x, y, _CURRENT_SPEAKER);
		if (instance_exists(_INSTANCE_SPEAKER)) {
			var _x1 = (_INSTANCE_SPEAKER.bbox_left + _INSTANCE_SPEAKER.bbox_right) div 2
			,	_y1 = _INSTANCE_SPEAKER.bbox_top
			,	_x2 = GUI_W div 2
			,	_y2 = GUI_H div 3
			,	_x3 = _x2 + 20
			,	_y3 = _y2;
			draw_triangle_color(_x1, _y1, _x2, _y2, _x3, _y3, c_white, c_white, c_white, false);
		}

		// USE A DIFFERENT BACKGROUND SPRITE FROM MENU BOXES
		// SET THE FONT COLOR TO BLACK TO SHOW UP AGAINST THE WHITE SPEECH BUBBLE
		draw_text_box(_X, _Y, 0, 0, _MSG_STRING, sprDialogBoxBack1, 0, _PAD, true, 400, c_black, c_white);
		//draw_text_box_v2(_X, _Y, 0, 0, _MSG_STRING, sprDialogBoxBack1, 0, 1, _PAD, true, 400, c_black, c_white);
		break;
	
}

draw_set_font(Font_Small);