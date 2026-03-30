/// @description BLOCK OFF ACCESS UNLESS CERTAIN LEVELS OR CONDITIONS ARE MET

image_speed = 0;
image_index = 0;
DRAW_MESSAGE = false;

ALL_DONE = false;
//LEVEL_NEEDED = "";
//SCORE_NEEDED = 999;

LEVEL_SCORE_CHECK = function(lvl, scr) {
	// pass LEVEL and SCORE_NEEDED into this function 
	var lvl_id = lvl; 
	if ( !hasLevelBeenCleared(lvl_id) ) {return false;}
	
	if (GetHighscore(lvl_id) <= scr) {return true;}

	return false;
}

UPDATE_MESSAGE = function(done = false) {
	
	var draw_message = $"This gate will open when level {LEVEL_NEEDED} is beaten with a score less than {SCORE_NEEDED}";	
	
	if (done) {
		draw_message = $"This gate opened when level {LEVEL_NEEDED} was beaten with a score less than {SCORE_NEEDED}";	
	}
	
	return draw_message;
}
