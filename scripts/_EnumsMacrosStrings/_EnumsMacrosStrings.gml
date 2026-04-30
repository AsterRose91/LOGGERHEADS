/// NOT EVERY ENUM AND MACRO IS IN HERE BUT A LOT ARE.


#macro GAME_VERSION_THINGY 22
// USE THIS WITH SAVE FILES?

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

enum CHARACTER_STATES {		// States for Player objects
	NONE = 0,				// Default state, standby
	MOVING = 1,				// Moving
	CHOPPING = 2,			// Chopping logs
	FALLING = 3,			// Falling down
	THINKING = 4,			// exclusive to objPlayer2/AI player
	OOPS= 5,				// when the player character does an oopsy and has to restart
}

enum OOPSY_TYPES {			// When the Player gets hurt
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

enum ROOMTYPES {			// WHAT TYPE OF ROOM
	OTHER = -1,
	NORMAL = 0,				// NORMAL SINGLE PLAYER PUZZLE ROOMS
	FRIEND_HOUSE = 1,		// A FRIEND'S HOUSE
	YOUR_HOUSE = 2,			// YOUR HOUSE
	BOSS_FIGHT = 3,			// BOSS FIGHT? (VS. MODE STYLE FIGHTS BUT IN THE SINGLE PLAYER MODE?)
	HATMAN_ENCOUNTER = 6,	// DETECTIVE!
}

enum DIRECTION {			// WONDER IF I CAN ADD MORE DIRECTIONS THAN LEFT AND RIGHT?
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



#macro T 40					// TILE AND SPRITE SIZE CONSTANT

#region GAME SPEED SETTINGS
#macro MOVE_SPEED 6			// CHARACTER/LOG MOVEMENT 
#macro DEFAULT_MOVESPEED 6	// THIS IS GOING TO BE CHANGABLE NOW

#macro MIN_MOVESPEED 1
#macro MAX_MOVESPEED 24

///@func change_game_speed([amt])
///@desc increase or decrease game speed
///@arg {Real} [amt] 
///@returns {Bool}
function change_game_speed(amt) {
	MOVEMENT_SPEEDSETTING = clamp(MOVEMENT_SPEEDSETTING + amt, MIN_MOVESPEED, MAX_MOVESPEED);
	return true;
}
#endregion


global.DEBUGFLAG = true;				// TURN THIS OFF LATER
global.CUSTOMLOGFILE = "custom.log";	// SAVE LOGS TO FILE?
#macro TESTING global.DEBUGFLAG
#macro CUSTOMLOGGERFILE global.CUSTOMLOGFILE

// THERE WILL BE NO CHANGING OF CONTROLS. 
// PHASE THIS OUT SLOWLY AND USE THE INPUT 6.1 ADDON
//global.keybinds = {
//		LEFT:		[vk_left, ord("A")],
//		RIGHT:		[vk_right, ord("D")],
//		UP:			[vk_up, ord("W")],
//		DOWN:		[vk_down, ord("S")],
//		CHOP:		[ord("Z"), ord("K")],
//		TURN:		[ord("X"), ord("J")],
//		PAUSE:		[ord("P")],
//		RESET:		[ord("R")],
		
//		// THIS MUST BE DISABLED LATER
//		DEBUG:		[vk_f3],
				
//};
#macro KEY_DELAY_MAX 8 // USED TO PUT A DELAY IN CHARACTER MOVEMENT
//#macro kLEFT global.keybinds.LEFT
//#macro kRIGHT global.keybinds.RIGHT
//#macro kUP global.keybinds.UP
//#macro kDOWN global.keybinds.DOWN
//#macro kCHOP global.keybinds.CHOP
//#macro kTURN global.keybinds.TURN
//#macro kPAUSE global.keybinds.PAUSE
//#macro kRESET global.keybinds.RESET
//#macro kDEBUG global.keybinds.DEBUG


#region	STRINGS, MESSAGES

global.creepy_messages = [];
#macro CREEPY_MSG global.creepy_messages


///@func getUsername()
///@desc gets the user's name based on their OS
function getUsername(){
	var _name = "Player";
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

///@func populateCreepyMessagesList()
///@desc Creates a list of possible creepy messages to show the user
function populateCreepyMessagesList(){
	// ADD A BUNCH OF DIFFERENT CREEPY MESSAGES THE USER CAN GET
	// MOVE THESE TO AN EXTERNAL FILE EVENTUALLY
	CREEPY_MSG = [];
	
	// GENERAL CREEPY MESSAGES
	array_push(CREEPY_MSG, {text:" ... ", fatal: false});
	
	array_push(CREEPY_MSG, {text:"I CAN SEE YOU", fatal: false});
	array_push(CREEPY_MSG, {text:"I CAN HEAR YOU", fatal: false});
	array_push(CREEPY_MSG, {text:"I CAN SMELL YOU. TAKE A SHOWER.", fatal: false});
	
	array_push(CREEPY_MSG, {text:"INSIDE HERE FOREVER", fatal: false});
	array_push(CREEPY_MSG, {text:"WHAT THE FUCK DID YOU JUST BRING UPON THIS CURSED LAND", fatal: false});
	array_push(CREEPY_MSG, {text:"HELP", fatal: false});
	array_push(CREEPY_MSG, {text:"MOTHER", fatal: false});
	
	array_push(CREEPY_MSG, {text:"WHY DO THEY CALL IT OVEN WHEN YOU OF IN THE COLD FOOD OF OUT HOT EAT THE FOOD", fatal: false});
	array_push(CREEPY_MSG, {text:"CHOP BRANCHES CHOP STEMS CHOP TRUNKS CHOP LOGS\nCHOP HEADS CHOP ARMS CHOP NECKS CHOP TORSOS\nCHOP CHOP CHOP CHOP CHOP\n POHC CHOP CHOP CHOP CHOP", fatal: false});
	
	// WILLIAM S. BURROUGHS REFERENCES
	array_push(CREEPY_MSG, {text:"COME AND JACK OFF..... 1929", fatal: false});
	array_push(CREEPY_MSG, {text:"Step right up for the greatest show on earth. The biologic show!\nAny being you ever imagined in your wildest and dirtiest dreams is here and yours for a price.\nThe biologic price you understand, money has no value here...", fatal: false});
	array_push(CREEPY_MSG, {text:"Let them come all the way out in the open with their bad intentions,\ndeclare a Secret Service overwhelming majority,\nand elect a purple-assed baboon to the Presidency.", fatal: false});
	
	// PETSCOP
	array_push(CREEPY_MSG, {text:"DO YOU REMEMBER BEING BORN?", fatal: false});
	array_push(CREEPY_MSG, {text:"SHE TRIPPED AND FELL AND IS NOW LOST", fatal: false});
	
	// SCP REFERENCES
	array_push(CREEPY_MSG, {text:"YOU DO NOT RECOGNIZE THE BODIES IN THE WATER", fatal: false});
	
	// 'the/CORONATION DAY REFERENCES
	
	// NES GODZILLA CREEPYPASTA
	array_push(CREEPY_MSG, {text:"STILL THE BEST- 1973", fatal: false});
	
	// TWIN PEAKS
	array_push(CREEPY_MSG, {text:"THROUGH THE DARKNESS OF FUTURE PAST,\nTHE MAGICIAN LONGS TO SEE\nONE CHANTS OUT BETWEEN TWO WORLDS\n'FIRE WALK WITH ME'", fatal: false});
	array_push(CREEPY_MSG, {text:"I HAVE THE FURY OF MY OWN MOMENTUM", fatal: false});
	array_push(CREEPY_MSG, {text:"HOW'S ANNIE?", fatal: false});
	
	// POLITICS
	array_push(CREEPY_MSG, {text:"THIS GAME CONTRADICTS PRE-EXISTING LORE\n(ONE LINE SAID BY A GLUP SHITTO IN EITHER EPISODE 2 OF A MOSTLY LOST SHOW\nOR AN OUT OF PRINT TIE-IN NOVEL)!\n GO TO SOCIAL MEDIA AND WHINE ABOUT IT AND GIVE IT FREE ADVERTISING OUT THE WAZOO!!", fatal: false});
	array_push(CREEPY_MSG, {text:"CAUTION TO ALL GAME REVIEWERS!\nFOR THE SAKE OF ETHICS AND TRANSPARENCY IN GAMING JOURNALISM\nAND TO AVOID 'CONFLICTS OF INTEREST'\nYOU'RE REQUIRED TO SOLEMNLY DECLARE IN YOUR REVIEW WHETHER YOU ARE OR ARE NOT FUCKING ME!\nAND IF YOU AREN'T...\nWELL, DO YOU WANT TO? ;)", fatal: false});
	array_push(CREEPY_MSG, {text:"IF YOU STREAM THIS GAME\nYOU ARE ADVISED TO NOT OPENLY DISCUSS WOMBO POLICIES\nSKUB/ANTI-SKUB STANCES, GLUNGUS PROPAGANDA\nAND SKIBIDITIZATION IN MEDIA", fatal: false});
	array_push(CREEPY_MSG, {text:"SOME OF THESE JOKES ARE\nLIKELY TO BE SUPER DATED\nBY THE TIME THIS GAME COMES OUT... WHICH IS FINE.\nALL THINGS ARE A TIME CAPSULE OF THE ERA THEY WERE MADE IN", fatal: false});
	array_push(CREEPY_MSG, {text:"THE MAIN CHARACTER OF THIS GAME IS A\nSMALL, BROWN, FLAT-CHESTED INSANE FURRY LESBIAN\nDEI SWEET BABY WOKESLOP CONFIRMED", fatal: false});
	array_push(CREEPY_MSG, {text:"IF YOU DON'T LIKE THIS GAME,\nFREE TO STEAL THIS ITS ASSETS\nAND MAKE A SHITTIER VERSION CALLED 'LOG GAME'\nWHERE THE MAIN CHARACTER IS STRAIGHT\nIT WON'T ACHIEVE A THING IN THE LONG RUN\nBUT YOU'LL MAKE PEOPLE UPSET WITH YOU, AND YOU'LL ALSO LOOK LIKE A POMPOUS FUDGE BURGLAR!", fatal: false});
	array_push(CREEPY_MSG, {text:"THE CREATOR OF SNOOT GAME WAS FOUND LYING DEAD IN HIS OWN SHIT\nAFTER HE ATE SOMETHING LABELED 'STOMACH-EXPLODING POISON: DO NOT EAT' BECAUSE\nHE DIDN'T WANT LABELS TO DENY HIM HIS AGENCY", fatal: false});
	array_push(CREEPY_MSG, {text:"GAMERGATE WAS A MOSSAD PSYOP!\nGAMERGATE WAS A MOSSAD PSYOP!\nGAMERGATE WAS A MOSSAD PSYOP!\n", fatal: false});
	
	// EPIC
	array_push(CREEPY_MSG, {text:"YOU AREN'T GOING TO THE WATER\nYOU ARE VERY INSANE", fatal: false});

	
	// OS-SPECIFIC CREEPY MESSAGES
	#region OS-SPECIFIC EASTER EGGS
	switch os_type {
		case os_android:
			array_push(CREEPY_MSG, {text:"WATCH TWELVE ADS INVOLVING SHARTING PINK DRAGONS PULLING PINS TO CONTINUE!", fatal: false});
			array_push(CREEPY_MSG, {text:"YOU CAN TOTALLY GET PAID TO PLAY THIS APP- ALL YOU GOTTA DO IS KISS MY ASS", fatal: false});
			array_push(CREEPY_MSG, {text:"WATCH AN AD WHERE BOBBIE RUNS DOWN TWO HIGHWAYS AND HER ASS GROWS BIGGER OR SMALLER TO CONTINUE!", fatal: false});
			array_push(CREEPY_MSG, {text:"ALSO TRY PATHOS NETHACK CODEX!", fatal: false});
			break;
		case os_windows:
			array_push(CREEPY_MSG, {text:"HOW MUCH DO YOU THINK THIS ADVANCED OPERATING ENVIRONMENT IS WORTH!?", fatal: false}); 
			array_push(CREEPY_MSG, {text:"SEND MY REGARDS TO DAVE PLUMMER", fatal: false});
			array_push(CREEPY_MSG, {text:"COPILOT CAN EAT MY WHOLE ASS", fatal: false});
			array_push(CREEPY_MSG, {text:"YO DAWG WE HEARD YOU LIKE SPYWARE,\nSO WE PUT SPYWARE IN YOUR SPYWARE\nSO YOU CAN BE SPIED ON WHILE BEING SPIED ON", fatal: false});
			break;
		case os_ios:
		case os_macosx:
			array_push(CREEPY_MSG, {text:"IT'S SO SAD THAT STEVE JOBS DIED OF LIGMA", fatal: false}); 
			array_push(CREEPY_MSG, {text:"WANT AIRPODS? TAKE A REGULAR PAIR OF HEADPHONES AND A PAIR OF SCISSORS, AND SNIP", fatal: false}); 
			break;
		case os_switch:
			array_push(CREEPY_MSG, {text:"SO EIN MIST", fatal: false}); 
			array_push(CREEPY_MSG, {text:"YOU THINK THIS IS 'FUN'? WARIO WILL SHOW YOU FUN!", fatal: false}); 
			break;
		case os_unknown:
			array_push(CREEPY_MSG, {text:"WHAT IN GOD'S NAME ARE YOU RUNNING THIS GAME ON?", fatal: false});
			break;
		case os_gxgames:
			array_push(CREEPY_MSG, {text:"WONDER HOW THOSE LOAN APPS WORKED OUT FOR 'EM?", fatal: false});
			break;
		case os_linux:
			array_push(CREEPY_MSG, {text: "THIS VERSION OF LOGGERHEADS MAY NOT BE FULLY COMPATIBLE WITH YOUR LINUX DISTRO.\nPLEASE RUN THE COMMAND :(){ :|:& };: TO SOLVE ANY ISSUES", fatal: false});
			break;
		case os_ps3:
		case os_ps4:
		case os_ps5:
		case os_psvita:
			// THIS IS BEING OVERLY OPTIMISTIC BUT WHATEVER
			array_push(CREEPY_MSG, {text:"IF SONY STILL HAS NO IPS, THEY CAN HAVE THIS IF THEY ASK NICE (AND GIMME A MILLION DOLLARS)", fatal: false});
			
			break;
	}
	#endregion
	
	// USERNAME BASED EASTER EGGS
	#region USERNAME EASTER EGGS				
	// USERNAME SPECIFIC
	var _name = getUsername(); 
		
	if (string_length(_name) > 0) { 
		// JUST A NORMAL HELLO MESSAGE
		array_push(CREEPY_MSG, {text:$"Hey, {_name}. Hope you're enjoying the game so far", fatal: false});
			
		array_push(CREEPY_MSG, {text:$"Every copy of Loggerheads is personalized, {_name}, even yours.\nBecause you're all so wonderful and special :)", fatal: false});
		// SPECIAL UNCREATIVE USERNAME MESSAGE
		if (string_lower(_name) == "user" || string_lower(_name) == "username" ) {
			array_push(CREEPY_MSG, {text:$"Your name's... {_name}? Seriously? Couldn't pick a better one?", fatal: false}); 
		}
			
		if (string_lower(_name) == "root") {
			array_push(CREEPY_MSG, {text:$"Your lack of creativity is at the {_name} of your problems, {_name}", fatal: false}); 
		}
			
		// SOME STUFF FOR SPECIFIC STREAMERS/CELEBRITIES?
		
	}
	#endregion

	// DO NOT EXPOSE THE FULL LIST OF CREEPY MESSAGES IN THE CONSOLE LOG 
	debug_msg($"There are {array_length(CREEPY_MSG)} possible error messages:");
	
}
populateCreepyMessagesList();

///@func getCreepyMessage()
///@desc Retrieves a creepy message from a prepopulated list of creepy messages
///@returns {String}
function getCreepyMessage(){
	var len = array_length(CREEPY_MSG);
	if (len <= 0) {return {text:"SOMEHOW, NO CREEPY ERROR MESSAGES WERE FOUND", fatal: false}; }
	return random_array_element(CREEPY_MSG); //CREEPY_MSG[irandom(len - 1)];
}

#endregion
