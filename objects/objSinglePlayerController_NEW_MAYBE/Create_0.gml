/// @description CONTROLS THE SINGLE PLAYER MODE

/* OLD LOGIC
MOVES_COUNTER = 0;
CHOPS_COUNTER = 0;
RETRIES_COUNTER = 0;
DRAW_HUD = true; // SHOW THE STATS (MAY NEED TO HIDE SO PLAYER CAN READ HINTS)
GAME_PAUSED = false;
LEVEL_WON = false;
PAUSE_MENU = instance_nearest(x, y, objSinglePlayerModePausemenu_NEW);
WAIT_TIMER = 0;


LEVEL_RESTART_DATA = {}; //GetLevelState(); // USE THIS TO RESTART THE LEVEL
LEVEL_HISTORY_STACK = []; // USE THIS TO UNDO MOVES
*/

GAME_PAUSED = false;
//CURRENT_TURN = PLAYERS.PLAYER_1; // Human player starts match
TIMER = 0; // Seconds spent during a game

DRAW_HUD = true; // SHOW THE STATS (MAY NEED TO HIDE SO PLAYER CAN READ HINTS)
MOVES_COUNTER = 0;
CHOPS_COUNTER = 0;
RETRIES_COUNTER = 0;

WAIT_TIMER = 0; // time before players are allowed to move
TURN_COUNT = 0; // Number of turns

LEVEL_WON = false;
PAUSE_MENU = instance_nearest(x, y, objSinglePlayerModePausemenu_NEW);

LEVEL_STATE = LEVEL_STAGE.LEVEL_START;
// MATCH_WINNER = PLAYERS.PLAYER_NONE;

//event_perform(ev_other, ev_user1);

LEVEL_RESTART_DATA = {}; //GetLevelState(); // USE THIS TO RESTART THE LEVEL
LEVEL_HISTORY_STACK = []; // USE THIS TO UNDO MOVES