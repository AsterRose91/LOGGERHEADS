/// @description DIALOG BOXES
// COMIC STYLE?
// MAYBE WITH SOME TAILS TO SHOW WHO'S TALKING
// NO BRANCHING PATHS OR CHOICES OR ANYTHING 
_DIALOGS = [
	new Dialog("Hi Dahlia! This is a line of test dialogue.", objPlayer_SP, sfxTalksound_Bobr),
	new Dialog("Hey Bobby, This is another line of test dialogue!", objFriend, sfxTalksound_Dahlia),
	new Dialog("Let's try and keep this simple", objPlayer_SP, sfxTalksound_Bobr),
	new Dialog("Use a struct to store details like who's speaking", objFriend, sfxTalksound_Dahlia)
];

_INDEX = -1;

_DIALOGS_LIST_LEN = array_length(_DIALOGS);

_MSG_SPEED = 0.7;
_FAST_MSG_SPEED = 1.6;

_SCRIBBLE_TYPIST = scribble_typist();
_SCRIBBLE_TYPIST.in(_MSG_SPEED, 0);
_SCRIBBLE_DELAY = 40;
_SCRIBBLE_TYPIST.character_delay_add(".", _SCRIBBLE_DELAY);
_SCRIBBLE_TYPIST.character_delay_add(",", _SCRIBBLE_DELAY);
_SCRIBBLE_TYPIST.character_delay_add("!", _SCRIBBLE_DELAY);
_SCRIBBLE_TYPIST.character_delay_add("?", _SCRIBBLE_DELAY);


_TOTAL_MESSAGES = array_length(_DIALOGS);

_CURRENT_MESSAGE = "";
_CURRENT_MESSAGE_LEN = 0;
_CURRENT_TALKSOUND = sfxTalksound_Bobr;
_CURRENT_SPEAKER = objPlayer_SP;
_SCRIBBLE_CURRENT = noone;

_MSG_WIDTH = 400;
_PAD = 10;


_STATE = DIALOGBOX_STATES.NONE;
