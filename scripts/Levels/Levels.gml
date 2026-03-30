/// DECOUPLE LEVEL INFORMATION AND LEVEL COMPLETION STATUS FROM EACH OTHER
/// THE FACT THAT WE WENT THIS LONG KEEPING THEM INTERMINGLED IS UNACCEPTABLE

global.new_level_details = [];
global.new_level_completion = []; // need to figure out a way to handle this getting bigger as more levels are added

// STORES LEVEL INFORMATION
#macro NEW_LEVEL_INFO global.new_level_details 
#macro NEW_LEVEL_SCORE global.new_level_completion

#region WORLD MAP POSITION VARIABLES
// keep track of where you are on the level select screen
global.last_visited_level = SPECIALROOMS.PLAYER_HOUSE; // keep track of where you were previously
global.level_select_map = Hub0; // for when multiple hub levels are added to the game
global.level_select_xstart = 32;
global.level_select_ystart = 64;
global.level_select_x = global.level_select_xstart;
global.level_select_y = global.level_select_ystart;

global.is_changing_hublevel = false;
global.current_hublevel = 0;


#macro LAST_VISITED_LEVEL global.last_visited_level
#macro LEVELSELECT_MAP global.level_select_map
#macro LEVELSELECT_XSTART global.level_select_xstart
#macro LEVELSELECT_YSTART global.level_select_ystart
#macro LEVELSELECT_X global.level_select_x
#macro LEVELSELECT_Y global.level_select_y
#endregion

#region LEVEL NAMES, DESCRIPTIONS, TYPES
NEW_LEVEL_INFO = 
	[
		{
			//0
			id: -666
			, room: SinglePlayerTest 
			, name: "IF YOU SEE THIS, SOMETHING IS VERY ABSOLUTELY FUCKED."
			, theme : 0
			, room_type : ROOMTYPES.OTHER
		}
	,	{
			//1
			id: SPECIALROOMS.PLAYER_HOUSE
			, room: PlayerHomeBase 
			, name: "Bobbie's House!"
			, theme : 0
			, room_type : ROOMTYPES.YOUR_HOUSE
		}
	,	{
			//2
			id: 0
			, room: SinglePlayerRoom00 
			, name: "One and Done"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//3
			id: 1
			, room: SinglePlayerRoom01
			, name: "Long, Long Logs"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}		
	,	{
			//4
			id: 2
			, room: SinglePlayerRoom02
			, name: "a Quick Turnaround"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
		
	,	{
			//5
			id: 3
			, room: SinglePlayerRoom03
			, name: "MMMMMMM, Bombs?"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//6
			id: 4
			, room: SinglePlayerRoom04
			, name: "Red and Blue!"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//7
			id: 5
			, room: SinglePlayerRoom05
			, name: "Ulp, I think I'm gonna be sick!"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//8
			id: 6
			, room: SinglePlayerRoom06
			, name: "Dahlia's house"
			, theme : 0
			, room_type : ROOMTYPES.FRIEND_HOUSE
		}
	,	{
			//9
			id: 7
			, room: SinglePlayerRoom07
			, name: "Crush 'em"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//10
			id: 8
			, room: SinglePlayerRoom08
			, name: "Magic! *Snort snort*"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//11
			id: 9
			, room: SinglePlayerRoom09
			, name: "Up or Down"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}		
	,	{
			//12
			id: 10
			, room: SinglePlayerRoom0A
			, name: "Towers"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//13
			id: 11
			, room: SinglePlayerRoom0B
			, name: "Get down from there!"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//14
			id: 12
			, room: SinglePlayerRoom0C
			, name: "How do THEY work?"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//15
			id: 13
			, room: SinglePlayerRoom0D
			, name: "The Scratch House"
			, theme : 0
			, room_type : ROOMTYPES.FRIEND_HOUSE
		}	
	,	{
			//16
			id: 14
			, room: SinglePlayerRoom0E
			, name: "Sequences"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//17
			id: 15
			, room: SinglePlayerRoom0F
			, name: "Pyramid"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//18
			id: 16
			, room: SinglePlayerRoom10
			, name: "Shut that thing off!"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{	
			//19
			id: 17
			, room: SinglePlayerRoom11
			, name: "Nutmeg's house"
			, theme : 0
			, room_type : ROOMTYPES.FRIEND_HOUSE
		}	
	,	{
			//20
			id: 18
			, room: SinglePlayerRoom12
			, name: "Carry on"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//21
			id: 19
			, room: SinglePlayerRoom13
			, name: "In between"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}	
	,	{
			//22
			id: 20
			, room: SinglePlayerRoom14
			, name: "Rainbow Voodoo"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//23
			id: 21
			, room: SinglePlayerRoom15
			, name: "Don't catch you slippin' now"
			, theme : 0
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//24
			id: 22
			, room: SinglePlayerRoom16
			, name: "Serena's house!"
			, room_type : ROOMTYPES.FRIEND_HOUSE
		}
	,	{
			//25
			id: 23
			, room: SinglePlayerRoom17
			, name: "Stairway to Heaven"
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//26
			id: 24
			, room: SinglePlayerRoom18
			, name: "Legalize Nuclear Bombs"
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//27
			id: 25
			, room: SinglePlayerRoom19_hatman
			, name: "Agent Nasser"
			, room_type : ROOMTYPES.HATMAN_ENCOUNTER
		}
	,	{
			//28
			id: 26
			, room: SinglePlayerRoom1A
			, name: "All your ducks in a row"
			, room_type : ROOMTYPES.NORMAL
		}
	,	{
			//29
			id: 27
			, room: SinglePlayerRoom1A
			, name: "All your ducks in a row"
			, room_type : ROOMTYPES.NORMAL
		}
	];
#endregion

///@func SetupLevelScoringInformation()
///@desc On new game or clearing saved game, set up level completion status
///@returns Array{<Struct>}
function SetupLevelScoringInformation() {
	var array_new = [];
	array_foreach(
		NEW_LEVEL_INFO,
		method(
			{target: array_new},
			function(lvl) {
				var _score = (lvl.id != -666) ? 999 : -666;
				var _worst = 0;
				array_push(
					target,
					{id: lvl.id, cleared: false, best_score: _score, worst_score: _worst}
				)
			}
		)
	);
	return array_new;
}
NEW_LEVEL_SCORE = SetupLevelScoringInformation();
debug_msg($"INITIALIZING LEVEL COMPLETION ARRAY:\n{NEW_LEVEL_SCORE}");

///@func UpdateHighScoreForNewLevels()
///@desc Updates the high score table to include newly added levels
///@returns {Bool}
function UpdateHighScoreForNewLevels() {
	
	var lvl_score_len = array_length(NEW_LEVEL_SCORE), lvl_info_len = array_length(NEW_LEVEL_INFO);
	
	// NO UPDATES NEED TO BE PERFORMED
	if (lvl_score_len == lvl_info_len) {
		return false;	
	}
	
	// UPDATES DO NEED TO BE PERFORMED
	if (lvl_score_len < lvl_info_len) {
		for (var lvl_id = lvl_score_len; lvl_id < lvl_info_len - 1; lvl_id++) {	
			var lvl = NEW_LEVEL_INFO[lvl_id];
			var _score = (lvl.id != -666) ? 999 : -666;
			var _worst = 0;
			array_push(
				NEW_LEVEL_SCORE,
				{id: lvl.id, cleared: false, best_score: _score, worst: _worst}
			);
		}
	}
	
	return true;
	
}

///@func LevelFindByID(level_ID)
///@desc get the index for a level with the specified level ID in global.new_level_details array
///@arg {real} level_ID
///@returns {real}
function LevelFindByID(level_ID) {
	// RETURN THE FIRST STRUCT WITH id == level_ID
	// USE method() BECAUSE SHIT'S FUNKY AND NEEDS TO BE SCOPED
	return array_find_index(
		NEW_LEVEL_INFO
		,method( {j: level_ID}, function(lvl) {return lvl.id == j;} ) 
	);
}

///@func LevelFindByRoom(room)
///@desc get the index for a level with the specified room in global.new_level_details array
///@arg {Asset.GMRoom} room
///@returns {Real}
function LevelFindByRoom(room){
	return array_find_index(
		NEW_LEVEL_INFO
		,method({j: room}, function(lvl) {return lvl.room == j;} ) 
	);
}

///@func getRoomType(room)
///@desc quickly get the room type based on the room index in global.new_level_details array
///@arg {Asset.GMRoom} room
///@returns {real}
function getRoomType(room) {
	var _i = LevelFindByRoom(room);
	if (_i != -1) {
		return NEW_LEVEL_INFO[_i].room_type;
	}
	return ROOMTYPES.OTHER;
}

///@func atFriendsHouse(room)
///@desc returns true if you're in the player base or at the friend houses
///@arg {Asset.GMRoom} room
///@returns {bool}
function atFriendsHouse(room){
	return (getRoomType(room) == ROOMTYPES.FRIEND_HOUSE || getRoomType(room) == ROOMTYPES.YOUR_HOUSE || getRoomType(room) == ROOMTYPES.HATMAN_ENCOUNTER);
}

///@func NewGetLevelInformation(level_ID)
///@desc returns the level struct with the specified level_ID
///@arg {real} level_ID
///@returns {struct}
function NewGetLevelInformation(level_ID){
	// RETURN THE FIRST STRUCT WITH ID == SEARCH_ID
	var _i = LevelFindByID(level_ID);
	return (_i != -1) ? NEW_LEVEL_INFO[_i] : NEW_LEVEL_INFO[0];
}

///@func GetHighscore(level_ID)
///@desc get the high score for a level from global.new_level_completion
///@arg {real} level_ID
///@returns {real}
function GetHighscore(level_ID) {
	UpdateHighScoreForNewLevels();
	
	var _i = LevelFindByID(level_ID);
	var _score = 999;
	try {
		if (_i != -1) {
			
			if (_i > 0 && _i < array_length(NEW_LEVEL_SCORE)) {
				_score = NEW_LEVEL_SCORE[_i].best_score;
			}
		}
		return _score;	
	} catch (e) { debug_msg(string(e)); }
}

///@func GetWorstscore(level_ID)
///@desc get the Worst score for a level from global.new_level_completion
///@arg {real} level_ID
///@returns {real}
function GetWorstscore(level_ID) {
	UpdateHighScoreForNewLevels();
	
	var _i = LevelFindByID(level_ID);
	var _score = 0;
	try {
		if (_i != -1) {
			
			if (_i > 0 && _i < array_length(NEW_LEVEL_SCORE)) {
				_score = NEW_LEVEL_SCORE[_i].worst_score;
			}
		}
		return _score;	
	} catch (e) { debug_msg(string(e));	}
}


///@func GetRoomHighscore(room)
///@desc get the high score for a level from global.new_level_completion
///@arg {Asset.GMRoom} room
///@returns {real}
function GetRoomHighscore(room) {
	UpdateHighScoreForNewLevels();
	
	var _i = LevelFindByRoom(room);
	var _score = 999;
	try {
		if (_i != -1) {
			if (_i > 0 && _i < array_length(NEW_LEVEL_SCORE)) {
				_score = NEW_LEVEL_SCORE[_i].best_score;
			}
		
		}
		return _score;
	} catch (e) { debug_msg(string(e)); }
}

///@func GetRoomWorstscore(room)
///@desc get the worst score for a level from global.new_level_completion
///@arg {Asset.GMRoom} room
///@returns {real}
function GetRoomWorstscore(room) {
	UpdateHighScoreForNewLevels();
	
	var _i = LevelFindByRoom(room);
	var _score = 0;
	try {
		if (_i != -1) {
			if (_i > 0 && _i < array_length(NEW_LEVEL_SCORE)) {
				_score = NEW_LEVEL_SCORE[_i].worst_score;
			}
		} 
		return _score;
	} catch (e) {debug_msg(string(e));}
}

///@func SetHighscore(room, new_score)
///@desc update the high score for a level
///@arg {Asset.GMRoom} room
///@arg {Real} new_score
///@returns {Bool}
function SetHighscore(room, new_score) {
	UpdateHighScoreForNewLevels(); // UPDATES HIGH SCORE RECORDS TO INCLUDE NEW LEVELS
	
	var _i = LevelFindByRoom(room);
	if (_i != -1) {
		// ERROR PROOFING STUFF
		var current_score = NEW_LEVEL_SCORE[_i].best_score ?? 666;
		var current_worst = NEW_LEVEL_SCORE[_i].worst_score ?? 0;
		
		if (new_score > current_worst) {
			NEW_LEVEL_SCORE[_i].worst_score = new_score;
		}
		
		
		if (new_score  < current_score) {
			NEW_LEVEL_SCORE[_i].best_score = new_score;	
			return true;
		}
		return false;
	}
	return false;
}

///@func isHubLevel(_room)
///@desc returns true if the room you're currently in is a hub level
///@arg {Asset.GMRoom} _room
///@returns {bool}
function isHubLevel(_room){
	var _isHub = false;
	switch (_room) {
		default: {
			_isHub = false;
			break;
		}
		
		case Hub0: 
		case Hub1: {
			_isHub = true;
			break;
		}	
	}
	return _isHub;
}


#region Teleport to hub levels

///@func getHubID(_room)
///@desc I don't even fucking know anymore
///@arg {Asset.GMRoom} _room
///@returns {real}
function getHubID(_room) {
	switch (_room) {
		default:
		case Hub0:
			return 0;
		case Hub1:
			return 1;
	}
}

///@func gotoHubLevel(hub_ID)
///@desc go to a Hub level from another Hub level?
///@arg {real} hub_ID
function gotoHubLevel(hub_ID) {
	gotoHubLevelWithTransition(hub_ID, TRANSITION_TYPES.NONE);
}
///@func gotoHubLevelWithTransition(hub_ID, [transition_type])
///@desc same as gotoHubLevel but with animation
///@arg {Real} hub_ID
///@arg {Real} [transition_type]
function gotoHubLevelWithTransition(hub_ID = Hub0, transition_type = TRANSITION_TYPES.PIXELATE) {
	debug_msg($"GOING TO Hub {hub_ID} WITH TRANSITION EFFECT {transition_type}");
	// SAVE BOBBIE'S POSITION ON THE WORLD MAP
	if (isHubLevel(room)) {
		with (objMapWalker) { LEVELSELECT_X = x; LEVELSELECT_Y = y; LEVELSELECT_MAP = room; }
	}
	var _transition, _destination;
	
	// Go to a hub level
	switch hub_ID {
		case 0: {
			_destination = Hub0;
			break;
		}	
		case 1: {
			_destination = Hub1;
			break;
		}
	}
	// room transition animations
	switch transition_type {
		default:
		case TRANSITION_TYPES.NONE:
			room_goto(_destination);
			break;
		case TRANSITION_TYPES.PIXELATE:
			//pixelate
			_transition = instance_create_layer(0, 0, "Instances", objTransitionPixelate);
			_transition.target_room = _destination;
			break;
		case TRANSITION_TYPES.LINEARBLUR:
			// linear blur
			_transition = instance_create_layer(0, 0, "Instances", objTransitionLinearBlur);
			_transition.target_room = _destination;
			break;
	}
	return;
}

#endregion


#region Teleport to normal levels
///@func gotoLevel(level_ID)
///@desc go to a level
///@arg {Real} level_ID
function gotoLevel(level_ID) {
	gotoLevelWithTransition(level_ID, TRANSITION_TYPES.NONE); // NOT SURE HOW ELSE TO REMOVE REDUNDANT CODE
	return;
}

///@func gotoLevelWithTransition(level_ID, [transition_type])
///@desc same as gotoLevel but with animation
///@arg {Real} level_ID
///@arg {Real} [transition_type]
function gotoLevelWithTransition(level_ID, transition_type = TRANSITION_TYPES.PIXELATE) {
	debug_msg($"GOING TO LEVEL {level_ID} WITH TRANSITION EFFECT {transition_type}");
	// SAVE BOBBIE'S POSITION ON THE WORLD MAP
	if (isHubLevel(room)) {
		with (objMapWalker) { LEVELSELECT_X = x; LEVELSELECT_Y = y; LEVELSELECT_MAP = room; }
		LAST_VISITED_LEVEL = level_ID; 
	}
	
	var _transition, _destination = getDestinationRoomID(level_ID);
	
	switch transition_type {
		default:
		case TRANSITION_TYPES.NONE:
			room_goto(_destination);
			break;
		case TRANSITION_TYPES.PIXELATE:
			//pixelate
			_transition = instance_create_layer(0, 0, "Instances", objTransitionPixelate);
			_transition.target_room = _destination;
			break;
		case TRANSITION_TYPES.LINEARBLUR:
			// linear blur
			_transition = instance_create_layer(0, 0, "Instances", objTransitionLinearBlur);
			_transition.target_room = _destination;
			break;
	}
	return;
}
#endregion


///@func getDestinationRoomID(level_ID)
///@desc gets the room of the level with the specified level_ID
///@arg {real} level_ID
function getDestinationRoomID(level_ID = -1){
	
	switch (level_ID) {
		// NORMAL LEVELS
		default: {
			var _i = LevelFindByID(level_ID);
			if (_i != -1) {return NEW_LEVEL_INFO[_i].room;}
			return SinglePlayerTest;
		}
			
		case SPECIALROOMS.LEVEL_SELECT: {
			return LEVELSELECT_MAP; // this should store the ID of the last hub level you were in
		}
		
		case SPECIALROOMS.HATMAN_ROOM: {
			return SinglePlayerRoom19_hatman;
		}
		
		case SPECIALROOMS.TITLE_SCREEN: {
			return titleScreen;
		}
			
		case SPECIALROOMS.VERSUS_MODE: {
			return VSmode;
		}
			
		case SPECIALROOMS.HUB_LEVEL_0: {
			return Hub0;
		}
			
		case SPECIALROOMS.HUB_LEVEL_1: {
			return Hub1;
		}
	}	
}

///@func hasLevelBeenCleared(level_ID)
///@desc returns true if level with the specified level_ID has been cleared
///@arg {real} level_ID
///@returns {bool}
function hasLevelBeenCleared(level_ID) {
	var i = LevelFindByID(level_ID);
	var _cleared = false;
	try {		
		// THIS NEEDS EDITING TO BETTER HANDLE WHEN NEW LEVELS ARE ADDED TO THE GAME.
		if (i != -1) { _cleared = NEW_LEVEL_SCORE[i].cleared; }
	} catch (e) {
		debug_msg(string(e));
	}
	
	return _cleared;
}

///@func LevelCleared(_room)
///@desc sets the level to cleared in the room array
///@arg {Asset.GMRoom} _room
///@returns {bool}
function LevelCleared(_room) {
	var i = LevelFindByRoom(_room);
	if (i  != -1) {
		NEW_LEVEL_SCORE[i].cleared = true;
		return true;
	}
	return false;
}

///@func countLevelsCleared()
///@desc count the number of levels you've beaten so far
///@returns {Real}
function countLevelsCleared() {
	var count = -1;
	try {
		count = array_length( array_filter( NEW_LEVEL_SCORE, function(e, i) {return e.cleared == true;} ) );
	} catch (e) {
		debug_msg( string(e) );
	}
	return count;
}