/// @description CONTROLS THE SINGLE PLAYER MODE
MOVES_COUNTER = 0;
CHOPS_COUNTER = 0;
RETRIES_COUNTER = 0;
DRAW_HUD = true; // SHOW THE STATS (MAY NEED TO HIDE SO PLAYER CAN READ HINTS)
GAME_PAUSED = false;
LEVEL_WON = false;
PAUSE_MENU = instance_nearest(x, y, objSinglePlayerModePausemenu_NEW);
WAIT_TIMER = 0;
DO_WAIT = false;


LEVEL_RESTART_DATA = {}; //GetLevelState(); // USE THIS TO RESTART THE LEVEL
LEVEL_HISTORY_STACK = []; // USE THIS TO UNDO MOVES

//event_perform(ev_other, ev_user2);