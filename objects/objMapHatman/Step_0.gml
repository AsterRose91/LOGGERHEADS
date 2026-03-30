/// @description Insert description here
if (isGamePaused()) {exit;}
if (TransitionEffectActive()) {exit;}

if (ASSOCIATED_CUTSCENE_FLAG == "none") {exit;}

//if (ENABLE_DETECTIVE_SPAWN) {


if (global.story_flags[$ ASSOCIATED_CUTSCENE_FLAG]) {	
	// make him visible when he's within line of sight?
	//var _player = instance_nearest(x, y, objMapWalker);
	//var _tilemap = layer_tilemap_get_id("Collisions");
	//if (instance_exists(_player)) {
	//	var _los = collision_line(x, y, _player.x, _player.y, objSolid, false, true);
	//	var _los_tile = collision_line(x, y, _player.x, _player.y, _tilemap, false, true);
		
	//	if (_los >= 0 || _los_tile >= 0) {image_alpha = approach(image_alpha, 0, 0.1);} else {image_alpha = approach(image_alpha, 1, 0.1);}
	//}
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