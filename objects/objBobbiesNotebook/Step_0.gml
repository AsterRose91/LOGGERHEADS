/// @description ACTIVATE ON PRESSING THE J KEY
playerInputFunction();

// DON'T WORK WHILE LEVEL TRANSITIONS ARE HAPPENING
if (TransitionEffectActive()) {exit;}


// PREVENT OPENING AND CLOSING TOO FAST
if (BUFFER > 0) {BUFFER--; exit;}

// ACTIVATE AND DEACTIVATE
if (OPEN_JOURNAL) {
	JOURNAL_ACTIVE ^= true; 
	BUFFER = 10;
}



if (!JOURNAL_ACTIVE) {
	// UNBLUR
	layer_set_visible(MENU_BLUR_FX_LAYER, false);
	exit;
} else {
	// BLUR
	layer_set_visible(MENU_BLUR_FX_LAYER, true);
	fx_set_parameter(MENU_BLUR_FILTER, BLUR_PARAM, 1);
	
	// USER INPUT
	
	
	
	
}
