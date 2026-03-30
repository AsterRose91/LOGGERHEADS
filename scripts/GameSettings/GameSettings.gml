global.show_grid = false;
#macro SHOWGRID_SETTING global.show_grid

global.particles_enabled = true;
#macro PARTICLES_ENABLED global.particles_enabled

global.game_fullscreen = false;
#macro FULLSCREEN_MODE global.game_fullscreen

global.movement_hints = false;
#macro MOVEMENT_HINTS global.movement_hints

global.movement_speed = DEFAULT_MOVESPEED;
#macro MOVEMENT_SPEEDSETTING global.movement_speed

global.randomizer = 0;
#macro SECRET_VALUE global.randomizer

global.enable_secrets = true;
#macro ENABLE_SECRETS global.enable_secrets



///@func defaultSettings()
///@desc Returns the default settings for the game's options
///@returns {Struct}
function defaultSettings() {
	var _settings = {
		// THESE VALUES ARE ALREADY SET TO THEIR DEFAULT
		// THE PURPOSE OF THIS STRUCT IS TO SAVE/LOAD TO/FROM FILE
		bgm_vol: 0.5 //BGM_VOL												// MUSIC VOLUME
		,	sfx_vol: 0.5 //SFX_VOL											// SOUND VOLUME
		,	particles_enabled: true //PARTICLES_ENABLED						// PARTICLES
		,	fullscreen_enabled: false //FULLSCREEN_MODE						// FULLSCREEN
		,	movement_hints: false //MOVEMENT_HINTS							// MOVEMENT HINTS
		,	movement_speed: DEFAULT_MOVESPEED //MOVEMENT_SPEEDSETTING		// MOVEMENT SPEED
		,	show_grid: false												// SHOW THE GRID
		,	error_correction: SECRET_VALUE ?? 0		 						// RANDOMIZATION
		,	enable_error_correction : ENABLE_SECRETS ?? true
	};
	return _settings;
}
global.gameSettings = defaultSettings();			// LOAD THE DEFAULT SETTINGS
#macro SETTINGS global.gameSettings

///@func saveSettings([_filename])
///@desc Save the game settings to a file
///@arg {String} [_filename]
///@returns {bool}
function saveSettings( _filename = "settings" ) {
	try {
		
		var _file = file_text_open_write(_filename);
		var _gameSettings = json_stringify(SETTINGS);
		
		debug_msg( $"Attempting to save settings: {_gameSettings}" );
		file_text_write_string(_file, _gameSettings);
		file_text_close(_file);
		return true;
	
	} catch (e) { debug_msg(e); }
	return false;
}


///@func loadSettings([_filename])
///@desc Load the game settings from a file
///@arg {String} [_filename]
///@returns {bool}
function loadSettings( _filename = "settings" ) {
	var _settings; //JESUS FUCKING CHRIST
	var _success = false;
	
	try {
		debug_msg("Attempting to load settings from file");
		var _file = file_text_open_read(_filename);
		var _getSettings = file_text_read_string(_file);
		_settings = json_parse(_getSettings);
		file_text_close(_file);
		_success = true; // SUCCESSFULLY LOADED SETTINGS FROM FILE
		
	} catch (e) {
		// FAILURE, INVESTIGATE
		_settings = defaultSettings(); // THIS IS REDUNDANT BUT THE LOGIC DOESN'T WANNA BEHAVE
		_success = false;
		debug_msg(e); 	
	}
	
	applySettings(_settings);
	return _success;
}


///@func applySettings(_settings)
///@desc Separate out the code to apply a settings struct to 
///@arg {Struct} _settings
///@returns {Bool}
function applySettings(_settings) {
	_settings = _settings ?? defaultSettings();
	try {
		
		// APPLY SETTINGS TO INGAME VARIABLES 
		BGM_VOL = _settings[$"bgm_vol"];
		SFX_VOL = _settings[$"sfx_vol"];
		PARTICLES_ENABLED = _settings[$"particles_enabled"];
		FULLSCREEN_MODE = _settings[$"fullsceen_enabled"];
		MOVEMENT_HINTS = _settings[$"movement_hints"];
		MOVEMENT_SPEEDSETTING = _settings[$"movement_speed"];
		window_set_fullscreen(FULLSCREEN_MODE);		
		SHOWGRID_SETTING = _settings[$"show_grid"];
		SECRET_VALUE = _settings[$"error_correction"] ?? 0;
		ENABLE_SECRETS = _settings[$"enable_error_correction"] ?? true;
		
		SETTINGS = _settings;
		return true;
	}
	catch (e) {debug_msg(string(e));}
	return false;
}