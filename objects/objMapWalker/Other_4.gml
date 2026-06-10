/// @description GO TO SAVED POSITION
var _X, _Y;
if (global.is_changing_hublevel) {
	// TRANSITIONING TO A NEW HUB/MAP LEVEL
	_X = xstart;
	_Y = ystart;
	
	with (objTeleportToHubLevels) {
		if (GOTO_HUB_ID == global.current_hublevel) {_X = x; _Y =y;} 
	}
	
	x = _X;
	y = _Y;
	global.current_hublevel = getHubID(room);
	global.is_changing_hublevel = false;
	
	// IN SPITE OF MY DISMAY IT DOES APPEAR AS IF THIS CLUSTERFUCK OF VARIABLES IS NEEDED.
	
} else {

	if (room == LEVELSELECT_MAP) {
		x = LEVELSELECT_X;
		y = LEVELSELECT_Y;
	} else {
		// FIND THE objLevelSign INSTANCE WITH THE MATCHING levelID
		// AND GO THERE
		// OTHERWISE GO TO xstart, ystart
		_X = xstart; 
		_Y = ystart;
		with (objLevelSign) {
			if (LEVEL_ID == LAST_VISITED_LEVEL) { _X = x; _Y = y; }
		}
		x = _X; y = _Y;
		debug_msg($"LAST_VISITED_LEVEL: {LAST_VISITED_LEVEL}\nPOSITION: {_X},{_Y}\n");
	}
}