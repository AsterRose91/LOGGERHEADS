/// @description BASIC SHIT
if (TransitionEffectActive()) {exit;}
if (isGamePaused()) {exit;}

// HIDE
// if (ENABLE_DETECTIVE_SPAWN) { ENABLED = true; } else { ENABLED = false; }



// FACE THE PLAYER'S DIRECTION
var player = instance_nearest(x, y, objPlayer_SP);
if (player != noone) {
	image_xscale = (player.x > x) ? 1 : -1;
}

if (DISAPPEAR) {
	image_index = 1;
	image_alpha = approach(image_alpha, 0, 0.1);
}