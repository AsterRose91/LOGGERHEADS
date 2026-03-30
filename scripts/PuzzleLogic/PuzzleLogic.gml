global.vs_wins = 0;
global.vs_lose = 0;
#macro VS_WINS global.vs_wins
#macro VS_LOSE global.vs_lose


///@func GetLogsMovementDirection([_dir])
///@desc returns a (x, y) tuple based on the value of the DIRECTION enum
///@arg {Real|Enum} [_dir]
///@returns Point
function GetLogsMovementDirection(_dir = DIRECTION.NONE) {
	switch (_dir) {
		default:
		case DIRECTION.NONE:
			return new Point(0,0);
		case DIRECTION.LEFT:
			return new Point(-1,0);
		case DIRECTION.RIGHT:
			return new Point(1,0);
		case DIRECTION.UP:
			return new Point(0,-1);
		case DIRECTION.DOWN:
			return new Point(0, 1);
	}
}




///@func GetLevelState()
///@desc saves the current "state" a level is in, allows you to restart and or undo moves
///@returns Array
function GetLevelState() {
	var _MOVES = 0, _CHOPS = 0;
	with (objSinglePlayerController) {
		_MOVES = MOVES_COUNTER;
		_CHOPS = CHOPS_COUNTER;
	}
	
	var PLAYER_X = 40, PLAYER_Y = 280;
	var PLAYER_OBJ = instance_nearest(x, y, objPlayer_SP);
	with (PLAYER_OBJ) {PLAYER_X = x; PLAYER_Y = y;}

	
	var LEVEL_BLOCKS_STATE = []
	with (objLog_SP) { 
		if (BLOCKSTATE == LOG_STATES.NONE) {
			array_push(LEVEL_BLOCKS_STATE,
				{
					_obj: object_index,  
					_state: BLOCKSTATE,
					_x: x,
					_xx: XX,
					_y: y,
					_yy: YY,
					_dir: DIR,
					_h: V_SIZE,
					_w: SIZE,
					_xs: image_xscale,
					_ys: image_yscale,
					_magnetised: MAGNET_ACTIVE, // idk if this needs to be there but oh well
					_countdown: EXPLODE_COUNTER, // 
				}
			);
		}
	}
	var LEVEL_STATE = {
		_player_x: PLAYER_X,
		_player_y: PLAYER_Y,
		_blocks: LEVEL_BLOCKS_STATE,
		_chops: _CHOPS,
		_moves: _MOVES
	};
	debug_msg($"Level state saved as:/n{LEVEL_STATE}");
	return LEVEL_STATE;
}


///@func RestoreLevelState(level_state_data)
///@desc Returns a level to a previous state
///@arg {Struct} level_state_data
///@returns bool
function RestoreLevelState(level_state_data) {
	try {
		
		// RESTORE LEVEL TO A PREVIOUS STATE?
		with (objFriend) {GIFTED = false; x = xstart; y = ystart;}
		with (objGameOverSpecialEffect) {instance_destroy(self);}
		with (objNewRecordSpecialEffect) {instance_destroy(self);} // FORGOT THIS
		with (objLevelCompleteSpecialEffect) {instance_destroy(self);}
		with (objFriendGift) {instance_destroy(self);}
		with (objLog) {instance_destroy(self);}

		
		
		array_foreach(
			level_state_data._blocks,
			function(n) {
				with ( instance_create_layer(n._x, n._y, "Instances", n._obj) ) {
					XX = n._xx;
					YY = n._yy;
					DIR = n._dir;
					SIZE = n._w;
					V_SIZE = n._h;
					STATE = n._state;
					image_xscale = n._xs;
					image_yscale = n._ys;
					MAGNET_ACTIVE = n._magnetised;
					EXPLODE_COUNTER = n._countdown;
				}
			}
		);

		with (objPlayer_SP) {
			x = level_state_data._player_x; 
			y = level_state_data._player_y;
			STATE = CHARACTER_STATES.NONE;
		}
		
		with (objSinglePlayerController) {
			MOVES_COUNTER = level_state_data._moves;
			CHOPS_COUNTER = level_state_data._chops;
		}
	
		return true;
	} catch (e) {
		debug_msg($"{e}");
	}
	return false;
}


///@func levelRestart()
///@desc restarts a level
function levelRestart() {
	if (instance_exists(objSinglePlayerController)) {
		with (objSinglePlayerController) {
			event_perform(ev_other, ev_user2);
		}
	}
	else { 
		// this should never be called, but it's here as a failsafe
		room_restart();
	}
}

///@func isDialogBoxRunning()
///@desc returns true if there's an active dialog box/speech bubble
///@returns {Bool}
function isDialogBoxRunning() {
	return instance_exists(objDialogBox);
}


///@func isGamePaused()
///@desc rather than relying on global variables to discern if a game is paused I'm gonna try this
///@returns {Bool}
function isGamePaused() {
	var _ = noone, _dopause = false;
	switch room {
		// REGULAR LEVELS
		default:
			_ = instance_nearest(0,0, objSinglePlayerController);
			if (_ != noone) { if (_.GAME_PAUSED) {return true;} }
			break;
			
		// LEVEL SELECT
		case Hub0:
		case Hub1:
			_ = instance_nearest(0,0, objSinglePlayerModePausemenu_NEW);
			if (_ != noone) { if (_.MENU_ACTIVE) {return true;} }
			
			_ = instance_nearest(0,0, objSettingsMenu);
			if (_ != noone) { if (_.MENU_ACTIVE) {return true;} }
			break;
		
		// TITLE SCREEN
		case titleScreen:
			break;
		
		// VS. MODE
		case VSmode:
			_ = instance_nearest(0,0,objVSmodeController);
			if (_ != noone) { if (_.GAME_PAUSED) {return true;} }
			break;
	}
		
	return false;
}

///@func logsBelow(x,y)
///@desc returns true if there's a log below you
///@arg {real} x
///@arg {real} y
///@returns {bool}
function logsBelow(x, y) { return place_meeting(x, y + 1, objLog); }

///@func logsAbove(x,y)
///@desc returns true if there's a log above you
///@arg {real} x
///@arg {real} y
///@returns {bool}
function logsAbove(x, y) {return place_meeting(x, y - 1, objLog); }

///@func stumpBelow(x,y)
///@desc returns true if there's a stump below you
///@arg {real} x
///@arg {real} y
///@returns {bool}
function stumpBelow(x, y) { return place_meeting(x, y + 1, objStump); }

///@func willLogFall(x, y, [onlyLogs])
///@desc returns true if the log will fall
///@arg {real} x
///@arg {real} y
///@arg {bool} [onlyLogs] if true, function will return true only if there are no logs below you
///@returns {bool}
function willLogFall(x, y, onlyLogs = false) {
	//var _onlyLogs = is_null(argument[2], false);
	if (onlyLogs) {
		// horizontal logs can only be supported from below by logs, not by stumps
		return !logsBelow(x, y);
	}
	
	return !( stumpBelow(x, y) || logsBelow(x,y) );
}

///@func willLogRise(x,y)
///@desc returns true if an alien log will rise
///@arg {real} x
///@arg {real} y
///@returns {bool}
function willLogRise(x, y) {
	
	return !logsAbove(x,y);
}

///@func canChopLog(playerColor, logColor, [singlePlayer])
///@desc returns true if the player can chop a particular log
///@arg {real} playerColor
///@arg {real} logColor
///@arg {bool} [singlePlayer]
///@returns {bool}
function canChopLog(playerColor, logColor, singlePlayer = false) {

	// VS MODE
	if (!singlePlayer) {
		return (playerColor == logColor || logColor == LOG_COLORS.GREEN || logColor == LOG_COLORS.NONE);
	}
	
	// SINGLE PLAYER MODE
	if (logColor == LOG_COLORS.MAGIC || logColor == LOG_COLORS.HEAVY || logColor = LOG_COLORS.HORIZONTAL) {
		return false;
	}
	
	
	return true;
}

///@func isMagnetDestroyable(log_type)
///@desc Can this log destroy the Magnet block type?
///@arg {real} log_type
///@returns {bool}
function isMagnetDestroyable(log_type){
	
	if (log_type == LOG_COLORS.STATIONARY) {return false;}
	if (log_type == LOG_COLORS.MAGIC) {return false;}
	
	return true;
}

///@func isCrushDestroyable(log_type)
///@desc is this block type crushable
///@arg {real} log_type
///@returns {bool}
function isCrushDestroyable(log_type){
	return (log_type != LOG_COLORS.MAGNET || log_type != LOG_COLORS.MAGIC);
}


///@func isRottable(log_type)
///@desc is this block type Rottable
///@arg {real} log_type
///@returns {bool}
function isRottable(log_type){
	return (log_type == LOG_COLORS.NONE || log_type == LOG_COLORS.RED || log_type == LOG_COLORS.BLUE );
}

///@func allFriendsBefriended()
///@desc you befriended all your friends
///@returns {bool}
function allFriendsBefriended() {
	if (!instance_exists(objFriend)) {return true;}
	
	var any_left = true;
	with (objFriend) {
		if (!GIFTED) {any_left = false;}
	}
	return any_left;
}




///@func WaitTimerIncrement()
///@desc increments the wait timer in objVSmodeController (maybe also in Single player?)
///@returns {bool}
function WaitTimerIncrement(){
	var _obj = noone;
	if (instance_exists(objVSmodeController)) {_obj = objVSmodeController;}
	else if (instance_exists(objSinglePlayerController)) {_obj = objSinglePlayerController;}
	
	if (_obj == noone) {return false;}
	
	with (_obj) {
		//DO_WAIT = true;
		WAIT_TIMER++; //increase
	}
	return true;
}

///@func WaitTimerDecrement()
///@desc decrements the wait timer in objVSmodeController
///@returns {bool}
function WaitTimerDecrement(){
	var _obj = noone;
	if (instance_exists(objVSmodeController)) {_obj = objVSmodeController;}
	else if (instance_exists(objSinglePlayerController)) {_obj = objSinglePlayerController;}
	
	if (_obj == noone) {return false;}
	
	with (_obj) {
		WAIT_TIMER = max(0, WAIT_TIMER - 1); // DECREASE BUT NOT GO BELOW ZERO
	}
	return true;
}

///@func isWaiting()
///@desc checks the wait timer in objVSmodeController
///@returns {bool}
function isWaiting(){
	var _obj = noone;
	
	if (instance_exists(objVSmodeController)) {_obj = objVSmodeController;}
	else if (instance_exists(objSinglePlayerController)) {_obj = objSinglePlayerController;}
	if (_obj == noone) {return false;}
	with (_obj) {
		//return (DO_WAIT);
		return (WAIT_TIMER > 0);
	}
}

///@func checkForMovingLogs()
///@desc returns true if there are any logs that are moving
function checkForMovingLogs() {
	with (objLog) {
		if (XX != 0 || YY != 0) {
			return true;
		}
	}
	return false;
}



///@func NotNeededToComplete(blocktype)
///@desc Certain logs are not needed for the level to be complete
///@returns {bool}
function NotNeededToComplete(blocktype) {
	switch blocktype {
		default:
			return false;
		case LOG_COLORS.STATIONARY:
		case LOG_COLORS.MAGNET:
		case LOG_COLORS.POTION:
		case LOG_COLORS.BOMB:
			return true;
	}
}

///@func noMoreLogsLeft()
///@desc check that there's no more logs
///@returns {bool}
function noMoreLogsLeft() {
	if (!instance_exists(objLog)) {return true;}
	
	var logs_counter = 0;
	with (objLog) {
		// stationary logs do not count/matter
		logs_counter += !NotNeededToComplete(BLOCKTYPE);
	}
	return (logs_counter <= 0);
}

///@func MatchSetup()
///@desc set up a match
function MatchSetup() {
	debug_msg("WELL, OFF TO MAKE A LEVEL");
		
	part_particles_clear(PARTICLE_MAN);
		
	//create/move player objects
	#region PLAYER SETUP
	if (!instance_exists(PLAYER_1_OBJ)) {
		instance_create_layer(x, y, layer, PLAYER_1_OBJ);
	}
	with (PLAYER_1_OBJ) { x = 0; y = room_height - (2 * T); event_perform(ev_create,0);} 
				
	if (!instance_exists(PLAYER_2_OBJ)) {
		instance_create_layer(x, y, layer, PLAYER_2_OBJ);
	}
	with (PLAYER_2_OBJ) { x = room_width - T; y = room_height - (2 * T); event_perform(ev_create,0);} 
	#endregion

	//delete existing logs/blocks
	with (objLog) {instance_destroy(self);}
	#region LEVEL SETUP
	var makeHoriLogs = irandom_range(1, 4);
	//create logs
	with (objStump) {
		//randomly create logs
		var yy = y, h = 0, makeLogs = irandom_range(3,7);
		repeat(makeLogs) {
			yy -= T;
			h = abs( ( yy - y ) div T );
				
			instance_create_layer(x, yy, layer, objLog); //place a log
				
			if (instance_number(objLogHorizontal) < makeHoriLogs) { 
				// not too low, not too crowded
				if ( h >= 2 && !place_meeting(x + T, yy + T, objLogHorizontal) && !place_meeting(x, y, objLogHorizontal)) {
					var horiLogSize = choose(3, 5, 7);
					var sizeCheck = (horiLogSize - 1) * T;
					if (place_meeting(x + sizeCheck, yy + T, objLog)) {
						makeHorizontalLog(x, yy, horiLogSize);
					}
				}
			}
		}
	}
		
	with (objLog) { if (place_meeting(x, y, objLogHorizontal)) {with (self) {instance_destroy();} } }
		
	#endregion
}

///@func MatchRestart()
///@desc perform the match restart code in objVSmodeController
function MatchRestart() {
	with (objVSmodeController){
		event_perform(ev_other, ev_user1);
	}
}

///@func makeHorizontalLog(x, y, size)
///@desc quick function to make a log
///@arg {real} x
///@arg {real} y
///@arg {real} size
function makeHorizontalLog(x, y, size) {
	var createLog = instance_create_layer(x, y, layer, objLogHorizontal_size2); 
	with (createLog) {
		image_xscale = (size * T)/sprite_width;
		SIZE = size;
	}
	return;
}