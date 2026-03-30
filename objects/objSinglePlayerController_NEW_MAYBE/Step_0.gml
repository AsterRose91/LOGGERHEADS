/// @description SINGLE PLAYER MODE LOGIC

// DO NOT DO ANYTHING IF TRANSITION EFFECTS ARE ACTIVE
if (TransitionEffectActive()) {exit;}

// DON'T DRAW THE HUD IN CERTAIN ROOMS
DRAW_HUD = !(getRoomType(room) == ROOMTYPES.FRIEND_HOUSE || getRoomType(room) == ROOMTYPES.YOUR_HOUSE);


// GAME OVER
var _gameOver = false;
with (objPlayer_SP){ _gameOver = (STATE == CHARACTER_STATES.OOPS); }
if (_gameOver){
	if (!instance_exists(objGameOverSpecialEffect)){
		instance_create_layer(x, y, "Player", objGameOverSpecialEffect);
	}
}


// NEW PAUSE GAME LOGIC
if (instance_exists(objParentMenu)) {
	// ERROR MESSAGES AND SETTINGS MENU WILL TAKE PRIORITY
	with (objParentMenu) {
		other.GAME_PAUSED = MENU_ACTIVE;
	}
}

if (input_check_pressed("PAUSE")) {
	if (PAUSE_MENU == noone) {
		PAUSE_MENU = instance_create_layer(x, y, layer, objSinglePlayerModePausemenu_NEW);
	}		
	with (PAUSE_MENU) {MENU_ACTIVE = !MENU_ACTIVE;}
}


switch (LEVEL_STATE) {
	default:
		break;
		
	case LEVEL_STAGE.LEVEL_DURING: {
		// LEVEL COMPLETE
		if (noMoreLogsLeft() && allFriendsBefriended()) {
			// SUCCESS
			event_perform(ev_other, ev_user1);
		}

		// UNDO A STEP
		if ( input_check_pressed("UNDO") ) {
			event_perform(ev_other, ev_user3);
		}

		// STOP USING room_restart();
		if ( input_check_pressed("RESET") ) {
			event_perform(ev_other, ev_user2);
		}		
		break;
	}
	
	case LEVEL_STAGE.LEVEL_TIMBER: {
	
		break;
	}
	
	
}











