/// @description THE DETECTIVE.
if (isGamePaused()) {exit;}
if (TransitionEffectActive()) {exit;}



// ACTIVATE ONLY DURING CERTAIN PARTS OF THE STORY
if (ASSOCIATED_CUTSCENE_FLAG == "none") {exit;}

if (global.story_flags[$ ASSOCIATED_CUTSCENE_FLAG]) { ENABLED = true; }
else { ENABLED = false; }

// YOU CAN'T JUST SLIP PAST HIM ANYMORE
var FINAL_XX = 0, FINAL_YY = 0;
if (ENABLED) {
	var _player = instance_nearest(x, y, objMapWalker);
	
	if (instance_exists(_player)) {
		var _direction = point_direction(x, y, _player.x, _player.y);
		var _distance = point_distance(x, y, _player.x, _player.y);
		var _lineofsight = collision_line(x, y, _player.x, _player.y, LOS_CHECK, false, true) < 0;
		
		if (_lineofsight && _distance <= 32) {
			// CREEPY JUMPSCARE
			image_alpha = approach(image_alpha, 1, 0.2);
			FINAL_XX = lengthdir_x(WALK_SP, _direction);
			FINAL_YY = lengthdir_y(WALK_SP, _direction);
		}
		else {
			image_alpha = approach(image_alpha, 0, 0.2);
		}
	}
	XX = approach(XX, FINAL_XX, 0.6)
	YY = approach(YY, FINAL_XX, 0.6)
} else {
	image_alpha = 0;
	XX = 0;
	YY = 0;
}


// MOVE THE DETECTIVE
if (!worldmap_move_x(id, "Collision", XX)) {XX = 0;}
if (!worldmap_move_y(id, "Collision", YY)) {YY = 0;}