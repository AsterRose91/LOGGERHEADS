/// @description MAGNETISM!

if (MAGNET_ACTIVE) {
	// MAGNET ON
	with (objLog_Heavy_SP) {
	
		if ( abs(y - other.y) < (T div 2) ) {
			if (x > other.x) {
				DIR = DIRECTION.LEFT;
				WaitTimerIncrement();
				BLOCKSTATE = LOG_STATES.MAGNET_PULL;
			}
	
			// heavy block is to the left of the magnet
			if (x < other.x) { 
				DIR = DIRECTION.RIGHT;
				WaitTimerIncrement();
				BLOCKSTATE = LOG_STATES.MAGNET_PULL;
			}
		} else {
			BLOCKSTATE = LOG_STATES.NONE;
		}
	}
} else {
	
	// MAGNET OFF
	with (objLog_Heavy_SP) {
		if (BLOCKSTATE == LOG_STATES.MAGNET_PULL) {
			WaitTimerDecrement();
			BLOCKSTATE = LOG_STATES.NONE;
		}
	}
	
}

