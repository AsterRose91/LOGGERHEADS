/// KEYS!
/// AND OTHER STUFF
enum QUEST_ITEMS {
	// KEYS
	RED_KEY = 0,
	BLUE_KEY = 1,
	GREEN_KEY = 2,
	PINK_KEY = 3,
	ICE_KEY = 4,
	
	// RITUAL ITEMS
	AXE = 5,	// BOBBIE'S TRUSTY CHOPPER. SHE'S NEVER TOO FAR AWAY FROM IT.
	CANDLE = 6, // HERE COMES A CANDLE, TO LIGHT YOUR WAY TO BED, HERE COMES A CHOPPER, TO CHOP OFF YOUR HEAD
	HERBS = 7,	// IT'S NOT WEED YOU PIECE OF SHIT STONER
	OIL = 8,	// STEP 1: COVER YOURSELF IN OIL
	BELL = 9,	//
	BOOK = 10,	//
}


/// MAKE PLAYER COLLECT KEYS THEN RETURN TO HOUSE TO UNLOCK WORLD MAP?

///@func SetupStoryFlags()
///@desc Sets up the story flags for the game's plot
///@returns {Struct}
function SetupStoryFlags() {
	return {
		// THE KEY TO SUCCESS
		red_key: false,
		blue_key: false,
		green_key: false,
		secret_key: false,
		ice_key: false,
		
		red_blocks_opened: false,
		blue_blocks_opened: false,
		green_blocks_opened: false,
		secret_blocks_opened: false,
		ice_blocks_opened: false,
		
		
		// PLOT PROGRESS STUFF
		visited_home_base_first_time: false,
		
		
		// THE DETECTIVE SPAWNS WHENEVER YOU KILL SOMEONE
		post_giggles_killed_detective_encounter: false,
		post_mrs_scratchy_killed_detective_encounter: false,
		post_serena_killed_detective_encounter: false,
		
		
		// RITUAL ITEMS
		has_axe: true,					// BOBBIE ALWAYS HAS HER AXE
		// has_upgraded_axe: false,		// COSMETIC? NEEDED TO DESTROY VERY SPECIFIC LOGS?
		has_candle: false,
		has_herbs: false,
		has_book: false,
		has_oil: false,
		has_bell: false,
	};
}

/// THE CURRENT WAY TO HANDLE STORY FLAGS
global.story_flags = SetupStoryFlags();
#macro STORY_FLAGS global.story_flags

#macro RED_KEY_COLLECTED global.story_flags.red_key
#macro BLUE_KEY_COLLECTED global.story_flags.blue_key
#macro GREEN_KEY_COLLECTED global.story_flags.green_key
#macro ICE_KEY_COLLECTED global.story_flags.ice_key
#macro VISITED_HOME_BASE_FIRST_TIME global.story_flags.visited_home_base_first_time

//#macro HATMAN_ENCOUNTER_NUMBER global.story_flags.detective_encounter_number
//#macro ENABLE_DETECTIVE_SPAWN global.story_flags.do_detective_spawn
