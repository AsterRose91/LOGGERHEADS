/// @description MATCH START
with (objVSModeMenu) {MENU_ACTIVE = false;}
GAME_PAUSED = false;
WAIT_TIMER = 0;
DO_WAIT = false;
CURRENT_TURN = PLAYERS.PLAYER_1; // Human player starts match
TIMER = 0; // Seconds spent during a game
TURN_COUNT = 0; // Number of turns
MATCH_WINNER = PLAYERS.PLAYER_NONE;

MatchSetup();

MATCH_STATE = MATCH_STAGE.MATCH_DURING;
