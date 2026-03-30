/// @description advance dialog?
if (TransitionEffectActive()) {exit;}

if (isGamePaused()) {exit;}

switch _STATE {
	default:
	case DIALOGBOX_STATES.NONE: {
		_DIALOGS_LIST_LEN = array_length(_DIALOGS);
		_INDEX = -1;
		_STATE = DIALOGBOX_STATES.LOADING_NEW_DIALOG;
		break;
	}
	
	case DIALOGBOX_STATES.LOADING_NEW_DIALOG: {
		_INDEX++;
		if (_INDEX == _DIALOGS_LIST_LEN) {
			_STATE = DIALOGBOX_STATES.ENDING_DIALOG;
			break;
		}
		
		// IT SHOULDN'T REACH THIS POINT,
		_MSG_ANIM_INDEX = 0;
			
		_CURRENT_MSG = _DIALOGS[_INDEX].message;			
		_CURRENT_SPEAKER = _DIALOGS[_INDEX].speaker;
		_CURRENT_TALKSOUND = _DIALOGS[_INDEX].talksound;
			
		_MSG_LEN = string_length(_CURRENT_MSG);
			
			
		_STATE = DIALOGBOX_STATES.DISPLAYING_DIALOG;
		break;	
	}
	
	case DIALOGBOX_STATES.DISPLAYING_DIALOG: {
		
		if (_PAUSE > 0) { _PAUSE = approach(_PAUSE, 0, 1.3); }
		else {
		
			// TYPEWRITER EFFECT
			_MSG_ANIM_INDEX = approach(_MSG_ANIM_INDEX, _MSG_LEN, _MSG_SPEED); 
		
			if (_MSG_ANIM_INDEX < _MSG_LEN) { 
				// SPEED UP
				if (input_check("CHOP")) {_MSG_SPEED = 1.5;} else {_MSG_SPEED = 0.7;}
			
			
				// THIS IS SO NOT GOING TO WORK
				var _CHAR = string_char_at( _CURRENT_MSG, floor(_MSG_TIMER) );
				if (_CHAR == "," || _CHAR == "." || _CHAR == "!" || _CHAR == "?") {
					if (_PAUSE <= 0) { _PAUSE += 10; }
				}
			
			
				// TALKSOUND TIMER
				_MSG_TIMER += _MSG_SPEED;
			

			
				if (_MSG_TIMER > 2) { play_sfx(_CURRENT_TALKSOUND); _MSG_TIMER -= 2; }
			} else {
			
				// PROCEED TO THE NEXT MESSAGE
				if (input_check_pressed("CHOP")) {
					_STATE = DIALOGBOX_STATES.LOADING_NEW_DIALOG;
					break;			
				}
		
			}
		}
		break;
	}
	
	case DIALOGBOX_STATES.ENDING_DIALOG: {
		// THE END OF THE DIALOG
		instance_destroy(self);
		break;
	}
}



