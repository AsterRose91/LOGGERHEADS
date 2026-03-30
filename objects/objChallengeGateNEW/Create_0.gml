/// @description BLOCK OFF ACCESS UNLESS CERTAIN LEVELS OR CONDITIONS ARE MET

image_speed = 0;
image_index = 0;
DRAW_MESSAGE = false;
DISABLED = false;
ALL_DONE = false;

LEVEL_SCORE_CHECK = function(lvl, scr) {
	// pass LEVEL and SCORE_NEEDED into this function 
	var lvl_id = lvl; 
	if ( !hasLevelBeenCleared(lvl_id) ) {return false;}
	
	// NEGATIVE GATES REQUIRE YOU TO HAVE OVER A CERTAIN SCORE
	if (NEGATIVE_MODE) {
		if (GetWorstscore(lvl_id) >= scr) {return true;}
	} else {
		if (GetHighscore(lvl_id) <= scr) {return true;}
	}

	return false;
}

UPDATE_MESSAGE = function(done = false) {
	
	var draw_message = $"This gate {done?"was opened":"shall open"} when\nlevel {LEVEL_NEEDED} {done?"was":"is"} beaten in {SCORE_NEEDED} moves or {NEGATIVE_MODE?"more":"less"}";	
	
	return draw_message;
}
