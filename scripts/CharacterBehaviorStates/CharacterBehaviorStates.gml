#region NEW THINKING
// CHARACTER_STATES.THINKING
// CHARACTER_STATES.NONE
// objPlayer2 thinking

///@func characterThinksBetterPF()
///@desc AI character thinking algo now with better pathfinding
function characterThinksBetterPF() {
	//Don't do anything if it's not your turn
	if (!myTurn(PLAYER_ID) || isMatchOver()) {return;}
	
	
	if (path_exists(PATH)) {
		// FOLLOW THE PATH
		//if (Taxicab(MID_X, MID_Y, FINAL_X, FINAL_Y) > T ) {
		if (PATH_INDEX < path_get_number(PATH) ) { 	
			
			var TO_X = path_get_point_x(PATH, PATH_INDEX);
			var TO_Y = path_get_point_y(PATH, PATH_INDEX)
			if (MID_Y > TO_Y ) {moveTo(0, -T);}
			else if (MID_Y < TO_Y) {moveTo(0, T);}
			else if (MID_X > TO_X ) {moveTo(-T, 0);}
			else if (MID_X < TO_X ) {moveTo(T, 0);}
			PATH_INDEX++;
		} else {
			FACING = -FINAL_DIR; // FACE LOG
			FINAL_X = -1;
			FINAL_Y = -1;
			STATE = CHARACTER_STATES.CHOPPING;
			PATH = noone;// CLEAR PATH
			PATH_INDEX = 0;
			return 0;
		}
	} else {
		// GET PATH
		var LOG_CHOICE = NewLogChooser();
		if (LOG_CHOICE != noone) {
			var OFF = T div 2;
			FINAL_X = LOG_CHOICE.id.x + OFF;  //LOG_CHOICE[0].x + OFF;
			FINAL_Y = LOG_CHOICE.id.y + OFF;  //LOG_CHOICE[0].y + OFF;
			FINAL_DIR = LOG_CHOICE.direction; //LOG_CHOICE[1];
			NewAIPathfind(MID_X, MID_Y, FINAL_X, FINAL_Y);
			PATH = getAIPath();
			PATH_INDEX = 0;
			return 0;
		}
		return -1;
	}
}

///@func characterThinksNew()
///@desc AI character thinking
function characterThinksNew() {
	//Don't do anything if it's not your turn
	//This function allows turning around
	if (!myTurn(PLAYER_ID) || isMatchOver()) {return;}
	// AI character code
	// Find a log, and start navigating to it
	var MAX_LOG = noone, NEAR_LOG = noone;
	if (FINAL_X == -1 && FINAL_Y == -1) {	//only search if FINAL_X and FINAL_Y are not set
		MAX_LOG = NewMaxLogFind();
		NEAR_LOG = NewNearLogFind();	
						
		// prioritize the "maximum" over the nearest log
		if (MAX_LOG != noone) {
			FINAL_DIR = MAX_LOG[1];
			FINAL_X = MAX_LOG[0].x + (T * FINAL_DIR);
			FINAL_Y = MAX_LOG[0].y;
		} else if (NEAR_LOG != noone) {
			FINAL_DIR = NEAR_LOG[1];
			FINAL_X = NEAR_LOG[0].x + (T * FINAL_DIR);
			FINAL_Y = NEAR_LOG[0].y;
		}
		if (MAX_LOG == noone && NEAR_LOG == noone) {return -1;}
	}
	else {
		// MOVE TOWARDS LOG
		if (Taxicab(x, y, FINAL_X, FINAL_Y) > 0) {
			Navigate(x, y, FINAL_X, FINAL_Y);
		}
		// CHOP LOG
		else {
			FACING = -FINAL_DIR; // ???
			FINAL_X = -1;
			FINAL_Y = -1;
			STATE = CHARACTER_STATES.CHOPPING;
			return 0;
		}
	}
		
	return -1;
}



///@func seekThePlayerToKill()
///@desc FINISH HER!
function seekThePlayerToKill(){
	if (!instance_exists(PLAYER_1_OBJ)) {return -1;}
	var _TARGET = noone; //instance_nearest_other(x, y, PLAYER_1_OBJ);
	
	with (PLAYER_1_OBJ) { 
		if (object_index != PLAYER_2_OBJ) {
			_TARGET = id;
			if (GIFTED) {return -1;}
		} 
	}

	if (_TARGET == noone) {return -1;}
	with (_TARGET) { if ( (!CAN_DIE) || GIFTED) {return -1;} }
	
	if (path_exists(PATH)) {
		// FOLLOW THE PATH
		//if (Taxicab(MID_X, MID_Y, FINAL_X, FINAL_Y) > T ) {
		if ( PATH_INDEX < path_get_number(PATH) ) { 	
			
			var TO_X = path_get_point_x(PATH, PATH_INDEX);
			var TO_Y = path_get_point_y(PATH, PATH_INDEX)
			if (MID_Y > TO_Y ) {moveTo(0, -T);}
			else if (MID_Y < TO_Y) {moveTo(0, T);}
			else if (MID_X > TO_X ) {moveTo(-T, 0);}
			else if (MID_X < TO_X ) {moveTo(T, 0);}
			PATH_INDEX++;
		} else {
			FACING = -FINAL_DIR; // FACE LOG
			FINAL_X = -1;
			FINAL_Y = -1;
			STATE = CHARACTER_STATES.CHOPPING;
			PATH = noone;// CLEAR PATH
			PATH_INDEX = 0;
			return 0;
		}
	} else {
		// GET PATH
		if (_TARGET != noone) {
			var OFF = T div 2;
			FINAL_DIR = choose(DIRECTION.LEFT, DIRECTION.RIGHT);
			FINAL_X = _TARGET.x + (FINAL_DIR * T) + OFF;
			FINAL_Y = _TARGET.y + OFF;
			NewAIPathfind(MID_X, MID_Y, FINAL_X, FINAL_Y);
			PATH = getAIPath();
			PATH_INDEX = 0;
			return 0;
		}
		return -1;
	}
}


#region OLD PLAYER FATALITY CODE
///@func seekThePlayerToKillOLD()
///@desc AI character thinking
function seekThePlayerToKillOLD() {
	if (!isMatchOver()) {return;}
	
	if (path_exists(PATH)) {
		// FOLLOW THE PATH
		if (PATH_INDEX < path_get_number(PATH) ) {
			var TO_X = path_get_point_x(PATH, PATH_INDEX);
			var TO_Y = path_get_point_y(PATH, PATH_INDEX)
			if (MID_Y > TO_Y ) {moveTo(0, -T);}
			else if (MID_Y < TO_Y) {moveTo(0, T);}
			else if (MID_X > TO_X ) {moveTo(-T, 0);}
			else if (MID_X < TO_X ) {moveTo(T, 0);}
			PATH_INDEX++;
		} else {
			FACING = -FINAL_DIR; // FACE LOG
			FINAL_X = -1;
			FINAL_Y = -1;
			STATE = CHARACTER_STATES.CHOPPING;
			PATH = noone;// CLEAR PATH
			return 0;
		}
	} else {
		// GET PATH
		var LOG_CHOICE = instance_nearest(x, y, PLAYER_1_OBJ);
		var OFF = T div 2;
		FINAL_DIR = DIRECTION.RIGHT;
		FINAL_X = LOG_CHOICE.x + (T * FINAL_DIR) + OFF;
		FINAL_Y = LOG_CHOICE.y + OFF;
		NewAIPathfind(MID_X, MID_Y, FINAL_X, FINAL_Y);
		PATH = getAIPath();
		PATH_INDEX = 0;
	}
}
#endregion



#endregion


///@func characterMovingState()
///@desc CHARACTER_STATES.MOVING
function characterMovingState() {
		if ( (x == DEST_X && y == DEST_Y) ) 
		{
			if (playerWillFall()) {IS_FALL = true;}
			
			if (IS_FALL) {STATE = CHARACTER_STATES.FALLING;} 
			else {
				//INCREASE MOVES COUNTER
				increaseMovesCounter();
				ANIM_TIMER = 0;
				STATE = CHARACTER_STATES.NONE;
			}
			return;
		}
		
		ANIM_TIMER++;
		
		x = approach(x, DEST_X, MOVEMENT_SPEEDSETTING);
		y = approach(y, DEST_Y, MOVEMENT_SPEEDSETTING);
}

///@func characterFallingState()
///@desc CHARACTER_STATES.FALLING
function characterFallingState() {
		if (!isFloorBelow(x, y)) { 
			IS_FALL = true;
			moveTo(0, T); 
			STATE = CHARACTER_STATES.MOVING;
			return;
		}
		else {
			IS_FALL = false;
			STATE = CHARACTER_STATES.NONE;
			return;
		}
}
	
///@func characterChoppingState([singlePlayerMode])
///@desc CHARACTER_STATES.CHOPPING
///@arg {bool} [singlePlayerMode]
function characterChoppingState(singlePlayerMode = false) {
	var SUCCEED_CHOP = false;
	var DO_INCREMENT = false;
	
	#region FRIENDS! :)
	var FRIEND = instance_place(x + (T * FACING), y, objFriend);
	if (FRIEND != noone) {
		with (FRIEND) {
			event_perform(ev_other, ev_user0);
		}
		SUCCEED_CHOP = true;
	}
	
	var FOE = instance_place(x + (T * FACING), y, PLAYER_2_OBJ);
	if (FOE != noone) {
		with (FOE) {
			if (CAN_DIE) {
				event_perform(ev_other, ev_user0);
				SUCCEED_CHOP = true;
			}
		}
		
	}
	
	var YOU = instance_place(x + (T * FACING), y, PLAYER_1_OBJ);
	if (YOU != noone) {
		with (YOU) {
			if (CAN_DIE) {
				event_perform(ev_other, ev_user0);
				SUCCEED_CHOP = true;
			}
		}
	}
	
	
	#endregion

	var TARGET_LOG = instance_place(x + (T * FACING), y, objLog);
	
	//NOTICE- IN SINGLE PLAYER MODE, THE PLAYER CAN CHOP LOGS OF ANY COLOR
	with (TARGET_LOG) {		
		if ( BLOCKSTATE == LOG_STATES.NONE && canChopLog(other.COLOR, BLOCKTYPE, singlePlayerMode) )
		{
			play_sfx(sfxChop0);
			SUCCEED_CHOP = true;
			DO_INCREMENT = true;
		}
			
		if (BLOCKTYPE == LOG_COLORS.HEAVY) {
			// CLANG!
			play_sfx(sfxIronHit);
		}
			
		if (BLOCKTYPE == LOG_COLORS.MAGIC) {
			// CLANG!
			part_particles_create(PARTICLE_MAN,MID_X,MID_Y,GLITTER,6);
			play_sfx(sfxMagic);
		}
	}
		
	if (SUCCEED_CHOP) {
		
		// MAKE THE CONTROLLER SAVE THE CURRENT STATE OF THE LEVEL 
		if (singlePlayerMode) {
			with (objSinglePlayerController) { 
				var CURRENT_STATE = GetLevelState();
				array_push(LEVEL_HISTORY_STACK, CURRENT_STATE);	
			}
		}
		
		// NOW YOU CAN CHANGE THE STATE OF A LOG
		with (TARGET_LOG) {
			DIR = other.FACING;
			BLOCKSTATE = LOG_STATES.CHOPPED;
		}
		
		
		IS_FALL = true; 
		if DO_INCREMENT { WaitTimerIncrement(); } // DO NOT INCREMENT "TIMBER!" TIMER IF YOU BEHEAD ENEMY
		endTurn();
	}
	
	
	

	if (IS_FALL) {STATE = CHARACTER_STATES.FALLING;}
	else {STATE = CHARACTER_STATES.NONE;}	
	
	return SUCCEED_CHOP;
}

///@func characterTakeKeyboardInput([singlePlayerMode])
///@desc CHARACTER_STATES.NONE
///@arg {bool} [singlePlayerMode]
function characterTakeKeyboardInput(singlePlayerMode = false) {
		//var _single = is_null(singlePlayerMode, false);
		
		//take player input
		playerInputFunction();
		
		if (TURN_AROUND) {
			if (singlePlayerMode) {
				FACING = (FACING == DIRECTION.LEFT) ? DIRECTION.RIGHT : DIRECTION.LEFT;
			}
		}
		
		if (GO_LEFT) {if (singlePlayerMode) {FACING = DIRECTION.LEFT;}}
		
		if (GO_RIGHT) {if (singlePlayerMode) {FACING = DIRECTION.RIGHT;}}
		
		// GO_LEFT_PRESS
		if (GO_LEFT) { 
			if (isValidMove(-T,0)) {
				moveTo(-T, 0); 
				return; 
			}
		} 
		
		// GO_RIGHT_PRESS
		if (GO_RIGHT) { 
			if (isValidMove(T,0)) {
				moveTo(T, 0);  
				return; 
			}
		} 
		
		// GO_UP_PRESS
		if (GO_UP_PRESS) {			
			if (isValidMove(0,-T)) {
				moveTo(0, -T); 
				return; 
			}
		} 
		
		// GO_DOWN_PRESS
		if (GO_DOWN_PRESS) { 
			if (isValidMove(0,T)) {
				moveTo(0, T); 
				return; 
			}
		} 
		
		if (CHOP_LOG) {
			
			//ADDITIONAL CODE HERE FOR UHHH INTERACTING WITH OBJECTS
			if !useDoors() {
				STATE = CHARACTER_STATES.CHOPPING; 
			}
			
			return;
		}	
}
	
// CHARACTER_STATES.THINKING
// CHARACTER_STATES.NONE
///@func characterThinks()
///@desc objPlayer2 thinking
///@deprecated
function characterThinks() {
		//Don't do anything if it's not your turn
		if (!myTurn(PLAYER_ID) || isMatchOver()) {return;}
		
		// AI character code
		// Find a log, and start navigating to it
		var MAX_LOG = noone, NEAR_LOG = noone;
		if (FINAL_X == -1 && FINAL_Y == -1) {	//only search if FINAL_X and FINAL_Y are not set
			MAX_LOG = MaxLogFind();
			NEAR_LOG = NearLogFind();	
				
			// prioritize the "maximum" over the nearest log
			if (MAX_LOG != noone) {
				FINAL_X = MAX_LOG.x + T;
				FINAL_Y = MAX_LOG.y;
			} else if (NEAR_LOG != noone) {
				FINAL_X = NEAR_LOG.x + T;
				FINAL_Y = NEAR_LOG.y;
			}
			if (MAX_LOG == noone && NEAR_LOG == noone) {return -1;}
		}
		else {
			// MOVE TOWARDS LOG
			if (Taxicab(x, y, FINAL_X, FINAL_Y) > 0) {
				Navigate(x, y, FINAL_X, FINAL_Y);
			}
			// CHOP LOG
			else {
				FINAL_X = -1;
				FINAL_Y = -1;
				STATE = CHARACTER_STATES.CHOPPING;
				return 0;
			}
		}
		
		return -1;
}

///@func isMatchOver()
///@desc if in Match mode, this will check if the match is over
///@returns {bool}
function isMatchOver() {
	if (instance_exists(objVSmodeController)) {
		with (objVSmodeController) {
			var _t = (MATCH_STATE == MATCH_STAGE.MATCH_END);
			
			//debug_msg(_t ? "Match over" : "Match not over");
			
			return _t;
		}
	}
	
	//debug_msg("Match not over");
	return false;
}
///@func myTurn(currentPlayer)
///@desc is it currently this character's turn?
///@arg {real} currentPlayer
///@returns {bool}
function myTurn(currentPlayer) {

	if (instance_exists(objVSmodeController)) {
		with (objVSmodeController) { 
			var _t = CURRENT_TURN == currentPlayer;
			//debug_msg(_t ? "your turn!" : "not your turn" )
			return _t; 
		}
	}
	
	return false;
}
///@func endTurn()
///@desc if in Match mode, this will end the current character's turn
function endTurn() {
	if (!instance_exists(objVSmodeController)) {return;}
	with (objVSmodeController) {
		if (MATCH_STATE != MATCH_STAGE.MATCH_END) {
			MATCH_STATE = MATCH_STAGE.MATCH_TIMBER;
		}
	}
}
///@func increaseMovesCounter()
///@desc How many moves have been played in the single player mode
function increaseMovesCounter() {
	if (!instance_exists(objSinglePlayerController)) {return;}
	with (objSinglePlayerController) {
		MOVES_COUNTER++;
	}
}
///@func useDoors()
///@desc use the door in single player mode
///@returns {bool}
function useDoors() {	
	var door = instance_place(x, y, objDoor);
	// MOVE SOME OF THIS FUNCTIONALITY TO THE DOORS THEMSELVES
	if (door == noone || !instance_exists(door)) { return false; }
	else if (door.ENABLED) {  
		with (door) {event_perform(ev_other, ev_user0);}
		return true;
	}
}