/// @description Insert description here
if (isGamePaused()) {exit;}
if (TransitionEffectActive()) {exit;}

if (ASSOCIATED_CUTSCENE_FLAG == "none") {exit;}

//if (ENABLE_DETECTIVE_SPAWN) {


if (global.story_flags[$ ASSOCIATED_CUTSCENE_FLAG]) {	
	ENABLED = true;
} else {
	image_alpha = approach(image_alpha, 0, 0.1);
	ENABLED = false;
	XX = 0;
	YY = 0;
}


// MOVE THE DETECTIVE
if (!worldmap_move_x(id, "Collision", XX)) {XX = 0;}
if (!worldmap_move_y(id, "Collision", YY)) {YY = 0;}