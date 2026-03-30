/// @description LEVEL END
if (!LEVEL_WON) {
	
	// ONLY RUN THIS CODE ONCE.
	LEVEL_WON = true;
	
	// SET LEVEL TO CLEARED
	LevelCleared(room);
	
	if (!atFriendsHouse(room)) {
		// CONGRATULATE PLAYER FOR FINISHING LEVEL
		instance_create_layer(x, y, "Player", objLevelCompleteSpecialEffect);
		with (objMusicMan) {event_perform(ev_other, ev_user0);}
		
		if ( SetHighscore(room, CHOPS_COUNTER) ) {
			// CONGRATULATE PLAYER ON NEW RECORD
			instance_create_layer(x, y, "Player", objNewRecordSpecialEffect);
		}
	}
	
	with (objFinishFlag) { event_perform(ev_other, ev_user0); } // CHANGE SPRITE
	
	
	// SAVE GAME DATA
	Save();
	
	LEVEL_STATE = LEVEL_STAGE.LEVEL_END;
	exit;
}
