/// @description SIMPLE FOUR DIRECTIONAL MOVEMENT

// PREVENT STUFF HAPPENING WHILE THE TRANSITION EFFECT IS PLAYING
if (TransitionEffectActive()) {exit;}

// THIS ACTS THE SAME AS PAUSING THE GAME, BUT YOU CAN'T ALSO HAVE THE PAUSE MENU OPEN WHILE THIS IS OPEN
if (instance_exists(objBobbiesNotebook)) {
	var _JournalOpenCheck = false;
	with (objBobbiesNotebook) {
		_JournalOpenCheck = (JOURNAL_ACTIVE);
	}
	if (_JournalOpenCheck) {exit;}
}

// CREATE AN INSTANCE OF THE PAUSE MENU OBJECT
// OR LATCH ONTO AN EXISTING ONE
if (PAUSE_MENU == noone) {
	if (instance_exists(objSinglePlayerModePausemenu_NEW)) {
		PAUSE_MENU = instance_nearest(x, y, objSinglePlayerModePausemenu_NEW);
	} else {
		PAUSE_MENU = instance_create_layer(x, y, layer, objSinglePlayerModePausemenu_NEW);
	}
}		
// TOGGLE THE PAUSE MENU
if (input_check_pressed("PAUSE")) {
	with (PAUSE_MENU) {MENU_ACTIVE = !MENU_ACTIVE;}
}

// DEBUGGING FEATURE
if (TESTING) {
	if (keyboard_check_pressed(vk_semicolon)) { with (objGatePar) {DISABLED = !DISABLED;} }
}
// DO NOT PROCEED FURTHER IF GAME PAUSED
if (isGamePaused()) {exit;} // THIS ONE WASN'T WORKING EARLIER?


playerInputFunction(true); // MOVEMENT ALONG BOTH AXES

#region PLAYER MOVEMENT AND SPEED
var DY = GO_DOWN - GO_UP;
var DX = GO_RIGHT - GO_LEFT;
var SPEED = clamp(point_distance(0, 0, DX, DY), 0, 1); // WOW

direction = point_direction(0, 0, DX, DY);

var FINAL_XX = lengthdir_x(WALK_SP * SPEED, direction);
XX = approach(XX, FINAL_XX , 0.5);

var FINAL_YY = lengthdir_y(WALK_SP * SPEED, direction);
YY = approach(YY, FINAL_YY , 0.5);
#endregion


#region MEET THE HAT MAN
MEET_HAT = collision_rectangle(bbox_left - 3, bbox_top - 3, bbox_right + 3, bbox_bottom + 3, objMapHatman, false, true);
if (MEET_HAT != noone && instance_exists(MEET_HAT)) {
	if (MEET_HAT.ENABLED) {
		gotoLevelWithTransition(SPECIALROOMS.HATMAN_ROOM, TRANSITION_TYPES.PIXELATE);
	}
}

#endregion


#region GO TO THE LEVEL THAT EACH PORTAL/SIGNPOST CORRESPONDS TO
// INTERACT WITH SIGNPOSTS
ON_SIGNPOST = collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, objLevelSign, false, true);
if (ON_SIGNPOST != noone && instance_exists(ON_SIGNPOST) ) {
	// MAKE THE SIGNPOSTS ANIMATE/GLOW
	// DISPLAY THE INFORMATION OF THE LEVEL THEY CORRESPOND TO
	var GOTO_LEVEL = -1, DO_TELEPORT = false;
	with (ON_SIGNPOST) {
		if (!DEMO_END_FLAG) {
			DO_TELEPORT = true;
			GOTO_LEVEL = LEVEL_ID;
			HIGHLIGHT = true; 
			SHOW_LEVEL_INFO = true; 
		}
	}
	// GOTO THE LEVEL THE SIGNPOST CORRESPONDS TO 
	if (CHOP_LOG && DO_TELEPORT) { 
		// gotoLevel( GOTO_LEVEL ); 
		gotoLevelWithTransition(GOTO_LEVEL, TRANSITION_TYPES.PIXELATE);
	}
	
} else {
	// STOP SIGNPOST GLOW 
	with (objLevelSign) {HIGHLIGHT = false;}
}
#endregion

// RETHINK HOW TO INCORPORATE MULTIPLE HUB AREAS
#region TELEPORT BETWEEN DIFFERENT HUB LEVELS

// DO NOT INTERFERE WITH SIGNPOST TELEPORTATION
ON_PORTAL = collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, objTeleportToHubLevels, false, true);
if (ON_PORTAL != noone && instance_exists(ON_PORTAL) ) {
	var GOTO_HUB = 0;
	with (ON_PORTAL) {
		GOTO_HUB = GOTO_HUB_ID;
	}
	// GO TO THE HUB LEVEL THE PORTAL CORRESPONDS TO
	if (CHOP_LOG) {
		// GO TO CORRESPONDING HUB LEVEL
		global.is_changing_hublevel = true;	
		gotoHubLevelWithTransition(GOTO_HUB, TRANSITION_TYPES.PIXELATE);
	}
}

#endregion

#region DRAW MESSAGE TRIGGER 
var gate = instance_nearest(x, y, objGatePar);
if (gate != noone && instance_exists(gate)) {
	if (distance_to_object(gate) <= 4) {
		with (gate) {DRAW_MESSAGE = true;}
	}
}

gate = instance_nearest(x, y, objGatePar);
if (gate != noone && instance_exists(gate)) {
	if (distance_to_object(gate) <= 4) {
		with (gate) {DRAW_MESSAGE = true;}
	}
}

#endregion

#region MOVE THE PLAYER

// Since the detective is also gonna be moving across the map, I figured what I'd do was move the movement into it's own set of functions
if (!worldmap_move_x(id, "Collision", XX)) {XX = 0;}
if (!worldmap_move_y(id, "Collision", YY)) {YY = 0;}

#endregion