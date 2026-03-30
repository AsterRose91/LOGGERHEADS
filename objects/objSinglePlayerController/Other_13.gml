/// @description UNDO A MOVE
if (getRoomType(room) == ROOMTYPES.FRIEND_HOUSE || getRoomType(room) == ROOMTYPES.YOUR_HOUSE) {exit;}

// NO REASON TO DO THIS ONCE YOU'VE WON
if (LEVEL_WON) {exit;}


// SILLY NOISES
play_sfx(choose(sfxReset0, sfxReset1, sfxReset2, sfxReset3));

if (array_length(LEVEL_HISTORY_STACK) > 0) {
	
	var _RESTORE_PREVIOUS_STATE = array_pop(LEVEL_HISTORY_STACK);
	RestoreLevelState(_RESTORE_PREVIOUS_STATE);	
	
} 