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
_SCRIBBLE_TYPIST = scribble_typist();

_CURRENT_MESSAGE = _DIALOGS[0];



_STATE = DIALOGBOX_STATES.NONE;

