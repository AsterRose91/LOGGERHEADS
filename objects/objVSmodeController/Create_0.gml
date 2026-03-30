/// @description KEEP TRACK

GAME_PAUSED = false;
CURRENT_TURN = PLAYERS.PLAYER_1; // Human player starts match
TIMER = 0; // Seconds spent during a game


DO_WAIT = false; // use this instead of the "WAIT_TIMER"?
WAIT_TIMER = 0;  // time before players are allowed to move
TURN_COUNT = 0;  // Number of turns

MATCH_STATE = MATCH_STAGE.MATCH_START;
MATCH_WINNER = PLAYERS.PLAYER_NONE;

//Record the number of times the player has won
PLAYER_1_SCORE = 0;
PLAYER_2_SCORE = 0;

// Match start event
event_perform(ev_other, ev_user1);