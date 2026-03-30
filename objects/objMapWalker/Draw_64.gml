/// @description DRAW LEVEL INFO WHEN YOU'RE STANDING ON A SIGNPOST

if (isGamePaused()) {exit;} // THIS GOD FORSAKEN FUNCTION DOESN'T WORK?

// if (PAUSE_MENU != noone) {if (PAUSE_MENU.MENU_ACTIVE) { exit; } }

// DRAW SOME DIAGNOSTIC STUFF HERE?
var _position_string = $"POSITION: ({x}, {y})";
draw_text(GUI_W - string_width(_position_string), GUI_H - string_height(_position_string), _position_string)


if (ON_SIGNPOST == noone) {exit;}

var MSG = "";

if (ON_SIGNPOST.DEMO_END_FLAG) {
	// DRAW A SPECIAL MESSAGE
	MSG = "THAT'S ALL FOR NOW FOLKS. HAVE A GREAT REST OF YOUR DAY.";
} else {
	// LEVEL INFORMATION
	var LVL_ID = ON_SIGNPOST.LEVEL_ID
	var LVL_DATA = NewGetLevelInformation(LVL_ID);
	var LVL_SCORE = GetHighscore(LVL_ID);
	var LVL_WORST = GetWorstscore(LVL_ID);
	var LVL_COMPLETE = hasLevelBeenCleared(LVL_ID);


	if (LVL_DATA.room_type == ROOMTYPES.NORMAL) {
		// MESSAGE NORMALLY DISPLAYS HIGH SCORE INFORMATION
		MSG = $"Level {LVL_ID}: {LVL_DATA[$"name"]}\nLeast moves: {LVL_SCORE}\nMost moves: {LVL_WORST}\nCleared: {LVL_COMPLETE ? "YES" : "NO"}";

	} else {
		// FOR PLAYER BASE AND FRIEND HOMES, IT DOESN'T.
		MSG = $"{LVL_DATA[$"name"]}\n";
	}
}

// MESSAGE DRAWING POSITIONS
var MSG_W = 300;
var MSG_H = string_height_ext(MSG, -1, MSG_W);
var PAD = 20;
var _X = (GUI_W div 2) - (MSG_W div 2);

// CHANGE THE Y-LOCATION OF THE MESSAGE BASED ON BOBBIE'S POSITION ON THE SCREEN
var _Y = (GUI_H div 4) - MSG_H - (2 * PAD);
if (room_y_to_gui() <= (GUI_H div 2)) {
	_Y = (3 * (GUI_H div 4)) + (MSG_H - (2 * PAD));
}

// DRAW THE MESSAGE
draw_text_box(_X, _Y, 0, 0, MSG, sprMenuBack3, 0, PAD, true, MSG_W);




