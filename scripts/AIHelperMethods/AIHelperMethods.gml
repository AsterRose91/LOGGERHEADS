/// scripts for the AI-controlled character in VS. Mode

#region NEW PATHFINDING METHODS BASED ON mp_grid AND CONTROL OBJECT
///@func NewAIPathfind(x1,y1,x2,y2)
///@desc new mp_grid based pathfinding method
///@arg {Real} x1
///@arg {Real} y1
///@arg {Real} x2
///@arg {Real} y2
///@returns {Bool}
function NewAIPathfind(x1,y1,x2,y2) {
	if ( !instance_exists(objVSmodeEnemyPathController) ) { return false; }
	
	with (objVSmodeEnemyPathController) {
		// UPDATE THE PLAYING FIELD
		event_perform(ev_other,  ev_user0);
		
		// CHECK IF LOCATION IS REACHABLE
		if (!mp_grid_path(GRID, PATH, x1, y1, x2, y2, false)) {
			return false;
		}
		else {
			return true;
		}
	}
	
	return false;
}

///@func getAIPath()
///@desc returns the AI path from objVSmodeEnemyPathController
///@returns {Asset.GMPath}
function getAIPath() {
	with (objVSmodeEnemyPathController) { 
		return PATH; 
	}
}

///@func NewLogChooser()
///@desc Finds the best log (max first, then nearest)
function NewLogChooser() {
	if (!instance_exists(objLog)) {return noone;}
	
	var best_id = noone
	, near_id = noone
	, current_dist = 9999
	, best_dist = 9999
	, current_count = 0
	, best_count = 0
	, target_log = noone
	, list_candidates = []
	, OFF = T  div 2
	, START_X = MID_X
	, START_Y = MID_Y
	
	with (objLog) {
		if (BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE)) {
			current_count = getLogsAbove();
			current_dist = Taxicab(x, y, other.x, other.y)
			if (current_count > best_count) {
				best_id = id;
				best_count = current_count;
			}
			if (current_dist >= best_dist) {
				near_id = id;
				best_dist = current_dist;
			}
		}
	}
	
	
	var near_id_left = (near_id != noone) ? NewAIPathfind(START_X, START_Y, near_id.x - T + OFF,  near_id.y + OFF) : false;
	var near_id_right = (near_id != noone) ? NewAIPathfind(START_X, START_Y, near_id.x + T + OFF,  near_id.y + OFF) : false;
	var best_id_left = (best_id != noone) ? NewAIPathfind(START_X, START_Y, best_id.x - T + OFF,  best_id.y + OFF) : false;
	var best_id_right = (best_id != noone) ? NewAIPathfind(START_X, START_Y, best_id.x + T + OFF,  best_id.y + OFF) : false;
	var possible_choices = []
	if (near_id_left) {array_push(possible_choices, [near_id, DIRECTION.LEFT] );}
	if (near_id_right) {array_push(possible_choices, [near_id, DIRECTION.RIGHT] );}
	if (best_id_left) {array_push(possible_choices, [best_id, DIRECTION.LEFT] );}
	if (best_id_right) {array_push(possible_choices, [best_id, DIRECTION.RIGHT] );}
	
	// CHOOSE A LOG
	var len = array_length(possible_choices) 
	if (len > 0) {
		return possible_choices[ irandom_range(0, len - 1)];
	}
	
	// IF THIS INTELLIGENT LOG SELECTION DIDN'T WORK, PICK THE FIRST LOG PATHFINDING IS ABLE TO REACH
	var reach_left = false, reach_right = false;
	with (objLog) {
		if (BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE)) {
			reach_left = NewAIPathfind(START_X, START_Y,  MID_X - T,  MID_Y);
			reach_right = NewAIPathfind(START_X, START_Y, MID_X + T,  MID_Y);
			if (reach_right) {return [id, DIRECTION.RIGHT];}
			if (reach_left) {return [id, DIRECTION.LEFT];}
		}
	}
	
	
	
	
	
	return noone;
}
///@func NewMaxLogFind()
///@desc NewMaxLogFind uses new Pathfinding, so no need for isReachable()? Keep it for now
function NewMaxLogFind() {
	if (!instance_exists(objLog)) {return noone;}
	
	var best_id = noone, current_count = 0, best_count = 0, which_side = DIRECTION.NONE;
	with (objLog) {
		if (BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE)) {
			current_count = getLogsAbove();
		
			if (current_count > best_count) {
				best_id = id;
				best_count = current_count;
				if (isReachable(PLAYERS.PLAYER_1)) {which_side = DIRECTION.LEFT;} 
				else if ( isReachable(PLAYERS.PLAYER_2) ) {which_side = DIRECTION.RIGHT;}
			}
		}
	}
	if (which_side == DIRECTION.NONE) {return noone;}
	return [best_id, which_side]; // return the ID of  the log with the most logs above it + which side to face to chop it.
}

///@func NewNearLogFind()
///@desc new pathfinding version of NearLogFind.
function NewNearLogFind() {
	if (!instance_exists(objLog)) {return noone;}
	
	var best_id = noone, current_dist = 9999, best_dist = 9999, which_side = DIRECTION.NONE;
	with (objLog) {
		if ( BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE) ) {
			current_dist = Taxicab(x, y, other.x, other.y);
		
			if (current_dist <= best_dist) {
				best_id = id;
				best_dist = current_dist;
				if (isReachable(PLAYERS.PLAYER_1)) {which_side = DIRECTION.LEFT;} 
				else if ( isReachable(PLAYERS.PLAYER_2) ) {which_side = DIRECTION.RIGHT;}
			}
		}
	}
	if (which_side == DIRECTION.NONE) {return noone;}
	return [best_id, which_side]; // return the ID of nearest log + which side to face to chop it.
}
///@func NewFindLogs(_color)
///@desc Returns true if there is at least one log that the AI can reach
///@arg {Real} _color
function NewFindLogs(_color) {
	var found = false;
	with (objLog) { if (BLOCKTYPE == _color 
		&& ( isReachable(PLAYERS.PLAYER_1) || isReachable(PLAYERS.PLAYER_2) ) ) 
		{ 
			found = true; 
			break; 
		} 
	}
	return found;
}
#endregion	



#region OLDER FUNCTIONS (DON'T DELETE YET)
///@func Taxicab(x1,y1,x2,y2)
///@desc Gets the Taxicab distance between two points
///@arg {Real} x1
///@arg {Real} y1
///@arg {Real} x2
///@arg {Real} y2
function Taxicab(x1, y1, x2, y2) {
	return  abs(x2 - x1) + abs(y2 - y1);
}

///@func Navigate(x,y,x_final,y_final)
///@desc Helps the AI figure out how to move next
///@arg {real} x
///@arg {real} y
///@arg {real} x_final
///@arg {real} y_final
function Navigate(x,y,x_final,y_final) {
	//prioritize x-movement over y-movement
	var dx, dy;
	if (x != x_final) {
		// Climb down first
		if (!isFloorBelow(x,y)) {
			moveTo(0, T);
		}
		dx = sign(x_final - x) * T;
		moveTo(dx, 0);
		
	} else {
		// Climb up/down
		if (y != y_final)  { 
			dy = sign(y_final - y) * T;	
			moveTo(0, dy);
		}	
	}
}

///@func getLogsAbove()
///@desc returns number of logs above the object that calls this function
function getLogsAbove() {
	var logCount = 0;
	with (objLog) {
		if (id != other.id && y < other.y && x == other.x) {logCount++;}
	}
	return logCount;
}

// Lets us know if the a character can reach the log when it's above a sideways log
// AI is always on the right hand side of the screen
// so logs above the right edge of the log are accessible
///@func isReachable([player])
///@desc let's us know if a character can reach a log. Used by the AI
///@arg {Real} [player] either PLAYERS.PLAYER1 or PLAYERS.PLAYER2
function isReachable(player = PLAYERS.PLAYER_2) {
	
	//var p = is_null(player, PLAYERS.PLAYER_2); //by default, it'll assume the AI is calling the method
	var t = (player == PLAYERS.PLAYER_2) ? T : -T;
	
	if (BLOCKSTATE != LOG_STATES.NONE) {return false;}
	
	var yy = y;
	var xx = x;
	var Reachable = true;
	
	repeat(32) {
		yy += T;
		if (place_meeting (xx + t, yy, objBlock)) {break;} //reached the ground
		if (place_empty(xx, yy)) {Reachable = false; break;}
		if (place_meeting (xx + t, yy, objLogHorizontal)) { Reachable = false; break;} //ran into a horizontal log
		if (place_meeting (xx + t, yy, objLog)) { Reachable = false; break;} //ran into another log
		if (yy > room_height) {break;}
	}
	
	return Reachable;
}

function ColorsMatch(player_color, log_color) {
	
	// Player one can cut red logs
	if (player_color == PLAYERS.PLAYER_1 && log_color == LOG_COLORS.RED) {return true;}
	
	// Player two can cut blue logs
	if (player_color == PLAYERS.PLAYER_2 && log_color == LOG_COLORS.BLUE) {return true;}
	
	// Anyone can cut green logs, colorless logs, or bombs
	if (log_color == LOG_COLORS.GREEN || log_color == LOG_COLORS.NONE || log_color == LOG_COLORS.BOMB) {return true;}
	
	
	return false;

}

///@function FindLogs(color, isPlayer)
///@description Returns true if there is at least one log that the AI can reach
function FindLogs(_color, _player) {
	
	var player = (_player ?? PLAYERS.PLAYER_2); //is_null(_player, PLAYERS.PLAYER_2);
	var found = false;
	//with (objLog) { if (BLOCKTYPE == _color && isReachable(player) ) { found = true; break; } }
	with (objLog) { if (BLOCKTYPE == _color && isReachable(player) ) { found = true; break; } }
	return found;
}

///@function AnyValidLogs(player)
///@description checks to see if there are any logs the AI player can reach and chop
function AnyValidLogs(player) {
	
	if (noMoreLogsLeft()) {return false;}
	
	var found = false;
	if (player == PLAYERS.PLAYER_1) {
		if (FindLogs(LOG_COLORS.BLUE, PLAYERS.PLAYER_1) 
		|| FindLogs(LOG_COLORS.NONE, PLAYERS.PLAYER_1) )
		{ found = true; }
	}
	
	if (player == PLAYERS.PLAYER_2) {
		if ( FindLogs(LOG_COLORS.RED, PLAYERS.PLAYER_2)  
		|| FindLogs(LOG_COLORS.NONE, PLAYERS.PLAYER_2) )
		{ found = true; }
	}
	
	return found;
}

///@function MaxLogFind([player])
///@description maxLogFind is used by the AI, so isReachable() within it should (by default) be AI player (2)
function MaxLogFind(_player = PLAYERS.PLAYER_2) {
	
	//var _player = is_null(argument0, PLAYERS.PLAYER_2);
	if (!instance_exists(objLog)) {return noone;}
	
	var best_id = noone, current_count = 0, best_count = 0;
	with (objLog) {
		if (BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE) && isReachable(_player)) {
			current_count = getLogsAbove();
		
			if (current_count > best_count) {
				best_id = id;
				best_count = current_count;
			}
		}
	}
	return best_id; // return the ID of  the log with the most logs above it.
}

///@function NearLogFind()
///@description NearLogFind is used by the AI, so isReachable() within it should be AI player (2)
function NearLogFind() {
	if (!instance_exists(objLog)) {return noone;}
	
	var best_id = noone, current_dist = 9999, best_dist = 9999;
	with (objLog) {
		if (BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE) && isReachable(PLAYERS.PLAYER_2)) {
			current_dist = Taxicab(x, y, other.x, other.y);
		
			if (current_dist <= best_dist) {
				best_id = id;
				best_dist = current_dist;
			}
		}
	}
	return best_id; // return the ID of  nearest valid log.
}
#endregion