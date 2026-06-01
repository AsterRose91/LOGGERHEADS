/// NOT EVERY ENUM AND MACRO IS IN HERE BUT A LOT ARE.

#macro GAME_VERSION_THINGY 23

#macro TAU (2*pi)

#macro MID_X (bbox_left + bbox_right) div 2
#macro MID_Y (bbox_top + bbox_bottom) div 2

#macro GUI_MOUSE_X  device_mouse_x_to_gui(0)
#macro GUI_MOUSE_Y  device_mouse_y_to_gui(0)

// FLAG TO DETERMINE IF THE LOGS ADHERE TO THE GRID OR NOT
global.log_gridsnap = true;
#macro LOG_ADHERE_GRID global.log_gridsnap

// USE THESE IN THE VS MODE CONTROLLER SO YOU DON'T HAVE TO CHANGE STUFF SO MUCH
#macro PLAYER_1_OBJ objPlayer1
#macro PLAYER_2_OBJ objPlayer2_BETTER_PATHFINDING


enum PLAYERS {
	PLAYER_NONE = 0,
	PLAYER_1 = 1,
	PLAYER_2 = 2
}

enum COLORS {
	COLOR_RED = #F00B0F,
	COLOR_BLUE = #0B0FF0
	
}

enum LOG_COLORS {
	NONE = 0,
	RED = 1,
	BLUE = 2,
	GREEN = 3,
	HEAVY = 4,				// IRON LOGS
	MAGIC = 5,				// CHANGE COLOR
	ALIEN = 6,				// NEGATIVE GRAVITY
	BOMB = 7,				// EXPLOSIVE
	HORIZONTAL = 8,			// NEARLY INDESTRUCTIBLE
	MAGNET = 9,				// ATTRACTS HEAVY/IRON LOGS
	STATIONARY = 10,		// DON'T NEED TO BE REMOVED
	ROTTEN = 11,			// WEAK LOGS THAT SHATTER INSTEAD OF FLYING AROUND
	POTION = 12,			// TURNS LOGS INTO ROTTEN LOGS
	GOLD = 13,				// TURNS INTO A HEAVY/IRON LOG WHEN EXPLODED OR WEAKENED
	NUKE = 14,				// EXTRA DANGEROUS BOMB, HAS A TIMER
	POTION2 = 15,			// TURNS LOGS INTO ALIEN LOGS
}

enum LOG_STATES {
	NONE = 0,				// At rest
	FALLING = 1,			// Falling down
	CHOPPED = 2,			// Flying off when chopped
	KABOOM = 3,				// Exploded
	FALLING_CRUSH = 4,		// Used by heavy log. They'll crush only one log below them
	CRUSHED = 5,			// CRUNCH!
	ASCEND = 6,				// anti-gravity.
	MAGNET_PULL = 7,		// pulled by a magnet
}

enum CHARACTER_STATES {						// States for Player objects
	NONE = 0,				// Default state, standby
	MOVING = 1,				// Moving
	CHOPPING = 2,			// Chopping logs
	FALLING = 3,			// Falling down
	THINKING = 4,			// exclusive to objPlayer2/AI player
	OOPS= 5,				// when the player character does an oopsy and has to restart
}

enum OOPSY_TYPES {							// When the Player gets hurt
	CRUSHED = 0,
	BURNT = 1,
	CRUSHED_2 = 2,
	CHOPPED = 3,
}

enum SPECIALROOMS {
	LEVEL_SELECT = -2, // Hm, how to alter this to enable multiple level selects?
	TITLE_SCREEN = -4,
	VERSUS_MODE = -5,
	HATMAN_ROOM = -6,
	PLAYER_HOUSE = -7,
	HUB_LEVEL_0 = -8,
	HUB_LEVEL_1 = -9,
}

enum ROOMTYPES {							// WHAT TYPE OF ROOM
	OTHER = -1,
	NORMAL = 0,				// NORMAL SINGLE PLAYER PUZZLE ROOMS
	FRIEND_HOUSE = 1,		// A FRIEND'S HOUSE
	YOUR_HOUSE = 2,			// YOUR HOUSE
	BOSS_FIGHT = 3,			// BOSS FIGHT? (VS. MODE STYLE FIGHTS BUT IN THE SINGLE PLAYER MODE?)
	HATMAN_ENCOUNTER = 6,	// DETECTIVE!
}

enum DIRECTION {							// WONDER IF I CAN ADD MORE DIRECTIONS THAN LEFT AND RIGHT?
	DOWN  = -2, 
	LEFT  = -1,
	NONE  = 0,
	RIGHT = 1,
	UP    = 2,
}

enum LEVEL_STAGE {
	LEVEL_START = 0,
	LEVEL_DURING = 1,
	LEVEL_TIMBER = 2,
	LEVEL_END = 3
}

enum MATCH_STAGE {
	MATCH_START = 0,
	MATCH_DURING = 1,
	MATCH_TIMBER = 2,
	FINISH_HER = 3,
	MATCH_END = 4,
}

enum DIALOGBOX_STATES {
	NONE = 0,
	LOADING_NEW_DIALOG = 1,
	DISPLAYING_DIALOG = 2,
	ENDING_DIALOG = 3
}

enum TRANSITION_TYPES {
	NONE = 0,
	PIXELATE = 1,
	LINEARBLUR = 2,
}



#macro T 40									// TILE AND SPRITE SIZE CONSTANT

#region GAME SPEED SETTINGS
#macro MOVE_SPEED 6							// CHARACTER/LOG MOVEMENT 
#macro DEFAULT_MOVESPEED 6					// THIS IS GOING TO BE CHANGABLE NOW

#macro MIN_MOVESPEED 1
#macro MAX_MOVESPEED 24

///@function change_game_speed([amt])
///@description increase or decrease game speed
///@arg Real [amt] 
///@returns Bool
function change_game_speed(amt) {
	MOVEMENT_SPEEDSETTING = clamp(MOVEMENT_SPEEDSETTING + amt, MIN_MOVESPEED, MAX_MOVESPEED);
	return true;
}
#endregion


global.DEBUGFLAG = false;									// TURN THIS OFF LATER
global.CUSTOMLOGFILE = $"{working_directory}/Log/err";		// SAVE LOGS TO FILE?
#macro TESTING global.DEBUGFLAG
#macro CUSTOMLOGGERFILE global.CUSTOMLOGFILE
#macro KEY_DELAY_MAX 8										// USED TO PUT A DELAY IN CHARACTER MOVEMENT


#region	STRINGS, MESSAGES

global.creepy_messages = [];
#macro CREEPY_MSG global.creepy_messages


///@func getUsername()
///@desc gets the user's name based on their OS
function getUsername(){
	var _name = "";
	try {
		switch (os_type){
			default:
			case os_windows:
				//_name = string_split( environment_get_variable("HOMEPATH") , "\\")[2]; // C:\Users\{username}
				_name = environment_get_variable("USERNAME");
				break;
			case os_linux:
			case os_macosx:
				_name = environment_get_variable("USER");
				break;
		}
	} catch (e) { debug_msg(e); }
	return _name;
}

///@func creepyErrorMessage(_text, _fatal) constructor
///@desc a dedicated struct thing for creepy error messages
///@arg String _text
///@arg Bool _fatal
///@retruns Struct
function creepyErrorMessage(_text, _fatal) constructor {
	text = _text;
	fatal = _fatal;
}

///@function populateCreepyMessagesList()
///@description Creates a list of possible creepy messages to show the user
function populateCreepyMessagesList(){
	// ADD A BUNCH OF DIFFERENT CREEPY MESSAGES THE USER CAN GET
	// MOVE THESE TO AN EXTERNAL FILE EVENTUALLY
	CREEPY_MSG = [];
	
	#region GENERAL CREEPY MESSAGES
	array_push(CREEPY_MSG, new creepyErrorMessage(" ... ", false) );
	
	array_push(CREEPY_MSG, new creepyErrorMessage("I CAN SEE YOU", false) );
	array_push(CREEPY_MSG, new creepyErrorMessage("I CAN HEAR YOU", false) );
	array_push(CREEPY_MSG, new creepyErrorMessage("I CAN SMELL YOU. TAKE A SHOWER.", false) );
	
	array_push(CREEPY_MSG, new creepyErrorMessage("INSIDE HERE FOREVER", false) );
	array_push(CREEPY_MSG, new creepyErrorMessage("WHAT THE FUCK DID YOU JUST BRING UPON THIS CURSED LAND",false) );
	array_push(CREEPY_MSG, new creepyErrorMessage("HELP", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("MOTHER", false));
	
	array_push(CREEPY_MSG, new creepyErrorMessage("WHY DO THEY CALL IT OVEN WHEN YOU OF IN THE COLD FOOD OF OUT HOT EAT THE FOOD", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("CHOP BRANCHES CHOP STEMS CHOP TRUNKS CHOP LOGS\nCHOP HEADS CHOP ARMS CHOP NECKS CHOP TORSOS\nCHOP CHOP CHOP CHOP CHOP\n POHC CHOP CHOP CHOP CHOP", false));
	#endregion
	
	#region WILLIAM S. BURROUGHS REFERENCES
	array_push(CREEPY_MSG, new creepyErrorMessage("COME AND JACK OFF..... 1929", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("Step right up for the greatest show on earth. The biologic show!\nAny being you ever imagined in your wildest and dirtiest dreams is here and yours for a price.\nThe biologic price you understand, money has no value here...", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("Let them come all the way out in the open with their bad intentions,\ndeclare a Secret Service overwhelming majority,\nand elect a purple-assed baboon to the Presidency.", false));
	#endregion
	
	#region AL COLUMBIA
	array_push(CREEPY_MSG, new creepyErrorMessage("THE DAY IT STOPS BEING FUN\nIS THE DAY I TAKE THE MONEY AND RUN", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("I WAS KILLING WHEN KILLING WASN'T COOL", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("HEY KIDS! ALWAYS REMEMBER TO GET ALONG WITH THE CINNAMON BOY", false));
	#endregion
	
	#region PETSCOP
	array_push(CREEPY_MSG, new creepyErrorMessage("DO YOU REMEMBER BEING BORN?", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("SHE TRIPPED AND FELL AND IS NOW LOST", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("PLAY MUSIC FOR BABY. SHE WILL BECOME MELODY", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("I TURNED THE RIGHT AND BECAME A SHADOW MONSTER MAN", false));
	#endregion
	
	#region SCP REFERENCES
	array_push(CREEPY_MSG, new creepyErrorMessage("YOU DO NOT RECOGNIZE THE BODIES IN THE WATER", false));
	#endregion
	
	#region 'the/CORONATION DAY REFERENCES
	array_push(CREEPY_MSG, new creepyErrorMessage("again?", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("My lungs hurt. Please cut them out", false));
	#endregion
	
	#region NES GODZILLA CREEPYPASTA
	array_push(CREEPY_MSG, new creepyErrorMessage("STILL THE BEST- 1973", false));
	#endregion
	
	#region TWIN PEAKS
	array_push(CREEPY_MSG, new creepyErrorMessage("THROUGH THE DARKNESS OF FUTURE PAST,\nTHE MAGICIAN LONGS TO SEE\nONE CHANTS OUT BETWEEN TWO WORLDS\n'FIRE WALK WITH ME'", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("I HAVE THE FURY OF MY OWN MOMENTUM", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("HOW'S ANNIE?", false));
	#endregion
	
	#region POLITICS
	array_push(CREEPY_MSG, new creepyErrorMessage("THIS GAME CONTRADICTS PRE-EXISTING LORE\n(ONE LINE SAID BY A GLUP SHITTO IN EITHER EPISODE 2 OF A MOSTLY LOST SHOW\nOR AN OUT OF PRINT TIE-IN NOVEL)!\n GO TO SOCIAL MEDIA AND WHINE ABOUT IT AND GIVE IT FREE ADVERTISING OUT THE WAZOO!!", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("CAUTION TO ALL GAME REVIEWERS!\nFOR THE SAKE OF ETHICS AND TRANSPARENCY IN GAMING JOURNALISM\nAND TO AVOID 'CONFLICTS OF INTEREST'\nYOU'RE REQUIRED TO SOLEMNLY DECLARE IN YOUR REVIEW WHETHER YOU ARE OR ARE NOT FUCKING ME!\nAND IF YOU AREN'T...\nWELL, DO YOU WANT TO? ;)", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("IF YOU STREAM THIS GAME\nYOU ARE ADVISED TO NOT OPENLY DISCUSS WOMBO POLICIES\nSKUB/ANTI-SKUB STANCES, GLUNGUS PROPAGANDA\nAND SKIBIDITIZATION IN MEDIA", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("SOME OF THESE JOKES ARE\nLIKELY TO BE SUPER DATED\nBY THE TIME THIS GAME COMES OUT... WHICH IS FINE.\nALL THINGS ARE A TIME CAPSULE OF THE ERA THEY WERE MADE IN", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("THE MAIN CHARACTER OF THIS GAME IS A\nSMALL, BROWN, FLAT-CHESTED INSANE FURRY LESBIAN\nDEI SWEET BABY WOKESLOP CONFIRMED", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("IF YOU DON'T LIKE THIS GAME,\nFREE TO STEAL THIS ITS ASSETS\nAND MAKE A SHITTIER VERSION CALLED 'LOG GAME'\nWHERE THE MAIN CHARACTER IS STRAIGHT\nIT WON'T ACHIEVE A THING IN THE LONG RUN\nBUT YOU'LL MAKE PEOPLE UPSET WITH YOU, AND YOU'LL ALSO LOOK LIKE A POMPOUS FUDGE BURGLAR!", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("THE CREATOR OF SNOOT GAME WAS FOUND LYING DEAD IN HIS OWN SHIT\nAFTER HE ATE SOMETHING LABELED 'STOMACH-EXPLODING POISON: DO NOT EAT' BECAUSE\nHE DIDN'T WANT LABELS TO DENY HIM HIS AGENCY", false));
	array_push(CREEPY_MSG, new creepyErrorMessage("GAMERGATE WAS A MOSSAD PSYOP!\nGAMERGATE WAS A MOSSAD PSYOP!\nGAMERGATE WAS A MOSSAD PSYOP!\n", false));
	#endregion
	
	#region EPIC
	array_push(CREEPY_MSG, new creepyErrorMessage("YOU AREN'T GOING TO THE WATER\nYOU ARE VERY INSANE", false));
	#endregion
	
	// OS-SPECIFIC CREEPY MESSAGES
	#region OS-SPECIFIC EASTER EGGS
	switch os_type {
		case os_android:
			array_push(CREEPY_MSG, new creepyErrorMessage("WATCH TWELVE ADS INVOLVING SHARTING PINK DRAGONS PULLING PINS TO CONTINUE!", false));
			array_push(CREEPY_MSG, new creepyErrorMessage("YOU CAN TOTALLY GET PAID TO PLAY THIS APP- ALL YOU GOTTA DO IS KISS MY ASS", false));
			array_push(CREEPY_MSG, new creepyErrorMessage("WATCH AN AD WHERE BOBBIE RUNS DOWN TWO HIGHWAYS AND HER ASS GROWS BIGGER OR SMALLER TO CONTINUE!", false));
			array_push(CREEPY_MSG, new creepyErrorMessage("ALSO TRY PATHOS NETHACK CODEX!", false));
			break;
		case os_windows:
			array_push(CREEPY_MSG, new creepyErrorMessage("HOW MUCH DO YOU THINK THIS ADVANCED OPERATING ENVIRONMENT IS WORTH!?", false)); 
			array_push(CREEPY_MSG, new creepyErrorMessage("SEND MY REGARDS TO DAVE PLUMMER", false));
			array_push(CREEPY_MSG, new creepyErrorMessage("COPILOT CAN EAT MY WHOLE ASS", false));
			array_push(CREEPY_MSG, new creepyErrorMessage("YO DAWG WE HEARD YOU LIKE SPYWARE,\nSO WE PUT SPYWARE IN YOUR SPYWARE\nSO YOU CAN BE SPIED ON WHILE BEING SPIED ON", false));
			break;
		case os_ios:
		case os_macosx:
			array_push(CREEPY_MSG, new creepyErrorMessage("IT'S SO SAD THAT STEVE JOBS DIED OF LIGMA", false)); 
			array_push(CREEPY_MSG, new creepyErrorMessage("WANT AIRPODS? TAKE A REGULAR PAIR OF HEADPHONES AND A PAIR OF SCISSORS, AND SNIP", false)); 
			break;
		case os_switch:
			array_push(CREEPY_MSG, new creepyErrorMessage("SO EIN MIST", false)); 
			array_push(CREEPY_MSG, new creepyErrorMessage("YOU THINK THIS IS 'FUN'? WARIO WILL SHOW YOU FUN!", false)); 
			break;
		case os_unknown:
			array_push(CREEPY_MSG, new creepyErrorMessage("WHAT IN GOD'S NAME ARE YOU RUNNING THIS GAME ON?", false));
			break;
		case os_gxgames:
			array_push(CREEPY_MSG, new creepyErrorMessage("WONDER HOW THOSE LOAN APPS WORKED OUT FOR 'EM?", false));
			break;
		case os_linux:
			array_push(CREEPY_MSG, new creepyErrorMessage( "THIS VERSION OF LOGGERHEADS MAY NOT BE FULLY COMPATIBLE WITH YOUR LINUX DISTRO.\nPLEASE RUN THE COMMAND :(){ :|:& };: TO SOLVE ANY ISSUES", false));
			break;
		case os_ps3:
		case os_ps4:
		case os_ps5:
		case os_psvita:
			// THIS IS BEING OVERLY OPTIMISTIC BUT WHATEVER
			array_push(CREEPY_MSG, new creepyErrorMessage("IF SONY STILL HAS NO IPS, THEY CAN HAVE THIS IF THEY ASK NICE (AND GIMME A MILLION DOLLARS)", false));
			
			break;
	}
	#endregion
	
	// USERNAME BASED EASTER EGGS
	#region USERNAME EASTER EGGS				
	// USERNAME SPECIFIC
	var _name = getUsername(); 
		
	if (string_length(_name) > 0) { 
		// JUST A NORMAL HELLO MESSAGE
		array_push(CREEPY_MSG, new creepyErrorMessage($"Hey, {_name}. Hope you're enjoying the game so far", false) );
			
		array_push(CREEPY_MSG, new creepyErrorMessage($"Every copy of Loggerheads is personalized, {_name}, even yours.\nBecause you're all so wonderful and special :)", false) );
		// SPECIAL UNCREATIVE USERNAME MESSAGE
		if (string_lower(_name) == "user" || string_lower(_name) == "username" ) {
			array_push(CREEPY_MSG, new creepyErrorMessage($"Your name's... {_name}? Seriously? Couldn't pick a better one?", false) ); 
		}
			
		if (string_lower(_name) == "root") {
			array_push(CREEPY_MSG, new creepyErrorMessage($"Your lack of creativity is at the {_name} of your problems, {_name}", false) ); 
		}
			
		// SOME STUFF FOR SPECIFIC STREAMERS/CELEBRITIES?
		
	}
	#endregion

	// DO NOT EXPOSE THE FULL LIST OF CREEPY MESSAGES IN THE CONSOLE LOG 
	debug_msg($"There are {array_length(CREEPY_MSG)} possible error messages:");
	
}
populateCreepyMessagesList();

///@function getCreepyMessage()
///@description Retrieves a creepy message from a prepopulated list of creepy messages
///@returns Struct
function getCreepyMessage(){
	var len = array_length(CREEPY_MSG);
	if (len <= 0) {return new creepyErrorMessage("SOMEHOW, NO CREEPY ERROR MESSAGES WERE FOUND", false); }
	return random_array_element(CREEPY_MSG); //CREEPY_MSG[irandom(len - 1)];
}

#endregion
