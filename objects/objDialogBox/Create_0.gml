/// @description DIALOG BOXES
// COMIC STYLE?
// MAYBE WITH SOME TAILS TO SHOW WHO'S TALKING
// NO BRANCHING PATHS OR CHOICES OR ANYTHING 
_DIALOGS = [
	new Dialog("Hi Gigi! This is a line of test dialogue.", objPlayer_SP, sfxTalksound_Bobr),
	new Dialog("Hey Bobby, This is another line of test dialogue!", objFriend, sfxTalksound_Dahlia),
	new Dialog("Let's try and keep this simple", objPlayer_SP, sfxTalksound_Bobr),
	new Dialog("Use a struct to store details like who's speaking", objFriend, sfxTalksound_Dahlia)
];

_INDEX = -1;
_CURRENT_MSG = _DIALOGS[0];
_MSG_ANIM_INDEX = 0;
_MSG_LEN = 0;

_MSG_TIMER = 0;
_MSG_TIMER_INT = 0;
_MSG_SPEED = 0.7;
_CURRENT_SPEAKER = noone; // USE THIS TO DRAW A TAIL FOR THE SPEECH BUBBLE
_CURRENT_TALKSOUND = sfxTalksound_Dahlia;

_DIALOGS_LIST_LEN = array_length(_DIALOGS);
_PAUSE = 0;

_STATE = DIALOGBOX_STATES.NONE; // WHEN ALL YOU CAN DECENTLY USE IS A HAMMER, EVERYTHING LOOKS LIKE A NAIL