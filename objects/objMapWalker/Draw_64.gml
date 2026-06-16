/// @description DRAW LEVEL INFO WHEN YOU'RE STANDING ON A SIGNPOST

if (isGamePaused()) {exit;} // THIS GOD FORSAKEN FUNCTION DOESN'T WORK?
//if (ON_SIGNPOST == noone) {exit;}

//draw_set_font(Font_Small);

//var MSG = "";

//if (ON_SIGNPOST.DEMO_END_FLAG) {
//	// DRAW A SPECIAL MESSAGE
//	MSG = "THAT'S ALL FOR NOW FOLKS. HAVE A GREAT REST OF YOUR DAY.";
//} else {
//	// LEVEL INFORMATION
//	var LVL_ID = ON_SIGNPOST.LEVEL_ID
//	,	LVL_DATA = NewGetLevelInformation(LVL_ID);

//	if (LVL_DATA.room_type == ROOMTYPES.NORMAL) {
//		var LVL_SCORE = GetHighscore(LVL_ID)
//		,	LVL_WORST = GetWorstscore(LVL_ID)
//		,	LVL_COMPLETE = hasLevelBeenCleared(LVL_ID);
		
//		// MESSAGE NORMALLY DISPLAYS HIGH SCORE INFORMATION
//		MSG = $"LEVEL {LVL_ID}: {LVL_DATA[$"name"]}\nLEAST MOVES: {LVL_SCORE}\nMOST MOVES: {LVL_WORST}\nCLEARED: {LVL_COMPLETE ? "[c_lime]YES[/c]" : "[c_red]NO[/c]"}";

//	} else {
//		// FOR PLAYER BASE AND FRIEND HOMES, IT DOESN'T.
//		MSG = $"{LVL_DATA[$"name"]}\n";
//	}
//}

//// MESSAGE DRAWING 
//var MSG_W = string_width_scribble(MSG);
//var MSG_H = string_height_scribble_ext(MSG, MSG_W); 
//var PAD = 10;
//var _X = (GUI_W div 2) - (MSG_W div 2);

//// CHANGE THE Y-LOCATION OF THE MESSAGE BASED ON BOBBIE'S POSITION ON THE SCREEN
//var _Y = (GUI_H div 4) - (MSG_H + (2 * PAD));
//if (room_y_to_gui() <= (GUI_H div 2)) {
//	_Y = (3 * (GUI_H div 4)) - (MSG_H + (2 * PAD));
//}

//// DRAW THE MESSAGE
//draw_text_box_v2(_X, _Y, 0, 0, MSG, sprMenuBack3, 0, 1, PAD, true, MSG_W);