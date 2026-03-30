/// @description VARIOUS CODE

if (TransitionEffectActive()) {exit;}
//DO_WAIT = checkForMovingLogs();

var OTHER_PLAYER = (CURRENT_TURN == PLAYERS.PLAYER_1) ? PLAYERS.PLAYER_2 : PLAYERS.PLAYER_1;


switch (MATCH_STATE) {

	default: {
		break;
	}
	
	case MATCH_STAGE.MATCH_START: {
		with (objVSModeMenu) {MENU_ACTIVE = false;}
		break;
	}
	
	case MATCH_STAGE.MATCH_DURING: {
		if (!AnyValidLogs(CURRENT_TURN)) {event_perform(ev_other, ev_user0);}
		#region increase clock , pause/unpause match
		
		if (WAIT_TIMER != 0) {
		//if (DO_WAIT) {
			MATCH_STATE = MATCH_STAGE.MATCH_TIMBER;
			break;
		}
		
		if (!GAME_PAUSED) { 
			// TIMER INCREASES ONCE EVERY SECOND	
			// USE AN ALARM INSTEAD?
			TIMER += 1 / GAMESPEED; 
		}
		if (input_check_pressed("PAUSE")) {
			if (WAIT_TIMER <= 0) {
			//if (!DO_WAIT) {
				GAME_PAUSED ^= true; //TOGGLE PAUSE
			}
		}
		#endregion
		break;
	}
	
	case MATCH_STAGE.MATCH_TIMBER: {
		if (WAIT_TIMER <= 0) {
		//if (!DO_WAIT) {
			event_perform(ev_other, ev_user0);
			break;
		}
		break;
	}
		
	case MATCH_STAGE.FINISH_HER: {
		var KilledPlayerYet = false;
		with (PLAYER_1_OBJ) {if (GIFTED) {KilledPlayerYet = true;} }
		with (PLAYER_2_OBJ) {if (GIFTED) {KilledPlayerYet = true;} }
		if (KilledPlayerYet) {}
		break;
	}
		
	case MATCH_STAGE.MATCH_END: {
		#region RESTART THE MATCH
		//// TIME TO RESET THE MATCH
		var KilledPlayerYet = false;
		with (PLAYER_1_OBJ) {if (GIFTED) {KilledPlayerYet = true;} }
		with (PLAYER_2_OBJ) {if (GIFTED) {KilledPlayerYet = true;} }
		if (KilledPlayerYet) { 
			// PRESS ANY KEY TO CONTINUE
			if input_check_pressed("CHOP") {
				with (objVSModeMenu) {MENU_ACTIVE = true;}
			}
			
		}
		#endregion
		break;
	}

}