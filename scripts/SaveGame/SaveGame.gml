global.enable_save_encryption = false;
#macro ENABLE_ENCRYPTION global.enable_save_encryption

///@func defaultGameInformation()
///@desc returns the default game state/save data
///@returns Struct
function defaultGameInformation() {
	var gameState={
		test : GAME_VERSION_THINGY
		,	date: string(date_current_datetime())
		,	current_hublevel : global.current_hublevel
		,	last_visited_level : LAST_VISITED_LEVEL ?? SPECIALROOMS.PLAYER_HOUSE
		,	worldmap_id: LEVELSELECT_MAP ?? Hub0
		,	worldmap_x: LEVELSELECT_XSTART ?? 32
		,	worldmap_y: LEVELSELECT_YSTART ?? 64
		,	friends_met: SetupFriendInformation()
		,	level_scores: SetupLevelScoringInformation()
		,	vs_wins : 0
		,	vs_lose : 0
		,	story_flags:  SetupStoryFlags()
		};
	return gameState;
}

///@func menuDeleteSaveData()
///@desc used by objConfirmDeleteSaveDataMenu to reset game data
function menuDeleteSaveData() {
	debug_msg("Resetting game data...");
	setGameData( defaultGameInformation() );
	ActivateMenu(objSettingsMenu, objConfirmDeleteSaveDataMenu);
}

///@func setGameData(_data)
///@desc sets the game state/information to a specific state
///@arg {Struct} _data
function setGameData(_data) {
	var gameState = (_data ?? defaultGameInformation() ); //is_null(_data, defaultGameInformation());
	try {
		LAST_VISITED_LEVEL = gameState[$"last_visited_level"] ?? SPECIALROOMS.PLAYER_HOUSE;
		global.current_hublevel = gameState[$"current_hublevel"] ?? 0;
		LEVELSELECT_MAP = gameState[$"worldmap_id"] ?? Hub0;
		LEVELSELECT_X = gameState[$"worldmap_x"] ?? 32;
		LEVELSELECT_Y = gameState[$"worldmap_y"] ?? 64;
		NEW_LEVEL_SCORE = gameState[$"level_scores"];
		FRIENDS_MET = gameState[$"friends_met"];
		VS_WINS = gameState[$"vs_wins"];
		VS_LOSE = gameState[$"vs_lose"];
		STORY_FLAGS = gameState[$"story_flags"];
		
		return true;
	} catch (e) { debug_msg(e); }
	return false;
}

///@func Save([filename])
///@desc save the game's data to a file
///@arg {string} [filename]
///@returns Struct
function Save(filename ="save"){
	// save all the game's data to a file.
	var gameState = {
		test: GAME_VERSION_THINGY
		// DATE OF SAVE
		,	date: date_datetime_string(date_current_datetime())
		// WORLD MAP POSITION
		,	last_visited_level: LAST_VISITED_LEVEL
		,	current_hublevel : global.current_hublevel
		,	worldmap_id: LEVELSELECT_MAP
		,	worldmap_x: LEVELSELECT_X
		,	worldmap_y: LEVELSELECT_Y
		// FRIENDS DATA
		,	friends_met: FRIENDS_MET
		// LEVEL DATA
		,	level_scores: NEW_LEVEL_SCORE
		// GAME SETTINGS (NOW IN A SEPARATE FILE)
		//,	game_settings: SETTINGS
		// VS MODE WINS/LOSES
		,	vs_wins : VS_WINS
		,	vs_lose : VS_LOSE
		,	story_flags : STORY_FLAGS
	};
	
	try {
		var file = file_text_open_write(filename);
		
		// turn the game state into a JSON string
		var saveToFile = json_stringify(gameState);		
		// this will be written to a file
		debug_msg( $"Attempting to save game: {saveToFile}" );
		// if encryption is enabled, the file is stored in base64 form
		if (ENABLE_ENCRYPTION) {
			saveToFile = base64_encode(json_stringify(gameState));
		}
		file_text_write_string(file, saveToFile);
		file_text_close(file);
		
	} catch (e) { debug_msg(e); }
	
	ErrorCorrection();
	return gameState;
}

///@func Load([filename])
///@desc Load the game state from a file
///@arg {String} [filename]
function Load(filename = "save") {
	var gameState;
	try {
		// load a saved game
		// set the game variables appropriately
		debug_msg("Attempting to load game");
		var file = file_text_open_read(filename);
		
		var _getData;
		if (ENABLE_ENCRYPTION) {
			_getData = base64_decode(file_text_read_string(file));
		} else {
			_getData = file_text_read_string(file);
		}
		gameState = json_parse(_getData);
		debug_msg( json_stringify(gameState) );	
		file_text_close(file);
		if (gameState.test != GAME_VERSION_THINGY) {
			throw ("OLD FUCKING SAVE FILE");
		}
		
	} catch(e) {
		debug_msg(e);
		gameState = defaultGameInformation();
	}
	setGameData(gameState);	
	ErrorCorrection();
	return;
}