///@description SHUTS DOWN THE GAME, OR SHOWS A SPLASH MESSAGE


SHOW_SPLASH = false;
RNG_SHOW_SPLASH = random(1);

_SPLASH_STRINGS_POSSIBLE = [
	"IT'S NOW SAFE TO SHUT DOWN YOUR COMPUTER"
	, "IT'S NOW SAFE TO SHUT DOWN YOUR COMPUTER : )"
	, "IT'S NOW SAFE TO SHIT YOURSELF"
	, "Farewell."
	, "..."
	, "Did you find all the keys yet? How about the ritual items?"
	, "Make sure you say hi to all your friends, it's important."
	, "Don't mind the officer, he isn't very smart"
];

_SPLASH = random_array_element(_SPLASH_STRINGS_POSSIBLE);

// DRAW THE SPLASH MESSAGE CENTERED IN THE SCREEN
_MSG_W = string_width_scribble(_SPLASH);
_MSG_H = string_height_scribble(_SPLASH);
x = (GUI_W div 2) - (_MSG_W div 2);
y = (GUI_H div 2) - (_MSG_H div 2);

if (RNG_SHOW_SPLASH > 0.5) {
	// show a splash message	
	
	SHOW_SPLASH = true;

	// then shut down after a certain amount of time
	alarm_set(0, GAMESPEED * 2);
} else {
	// shut down right away
	game_end();
}