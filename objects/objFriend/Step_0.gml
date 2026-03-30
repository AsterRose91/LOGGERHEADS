/// @description FACE THE APPROPRIATE DIRECTION
if (TransitionEffectActive()) {exit;}
if (isGamePaused()) {exit;}

if (!GIFTED) {
	// FACE THE PLAYER'S DIRECTION
	var player = instance_nearest(x, y, objPlayer_SP);
	if (player != noone) {
		image_xscale = (player.x > x) ? 1 : -1;
	}
}
else {
	// ERRRM, SECRET JUICE SPRAY
	// HOW TO MAKE IT SPURT LIKE EVERY COUPLE SECONDS?	
	
	//if (PARTICLES_ENABLED) {
	//	part_particles_create(PARTICLE_MAN,MID_X,MID_Y + 5,JUICE,12);
	//}
	if (!START_SPURT) {
		alarm[0] = 1;
		START_SPURT = true;
	}
}