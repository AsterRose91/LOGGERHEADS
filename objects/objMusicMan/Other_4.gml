/// @description START MUSIC
audio_stop_all();

current_track = -3; // fallback/default value

// THIS IS KINDA STUPID, YOU'VE ALREADY IMPLEMENTED LEVEL TYPES INTO THE LEVEL DATA, USE THOSE.

switch (room) {
	default:
		// MORE INTELLIGENT MUSIC SELECTION CODE
		// SWITCH TO USING ROOMTYPES TO DETERMINE MUSIC?
		var _roomType = getRoomType(room);
		
		if (_roomType == ROOMTYPES.OTHER) {
			break;
		}
		
		if (_roomType == ROOMTYPES.YOUR_HOUSE || _roomType == ROOMTYPES.FRIEND_HOUSE) {
			current_track = bgm04_FriendsTheme;
		}
		
		if (_roomType == ROOMTYPES.NORMAL) {
			//current_track = bgm02_LevelTheme1OLD;
			current_track = bgm11_LevelTheme1Rework;
		}
		
		if (_roomType == ROOMTYPES.HATMAN_ENCOUNTER) {
			current_track = bgm06_Creppy;
		}
		
		break;

	case titleScreen:
		current_track = bgm09_TitleRework;
		break;
	
	case Hub0:
		current_track = bgm08_Overworld1;
		break;
	
	case Hub1:
		current_track = bgm01_Overworld2;
		break;
		
	case VSmode:
		current_track = bgm03_VersusMode;
		break;
	
	#region TERRIBLE OLD CODE
	//case SinglePlayerRoom06:
	//case SinglePlayerRoom0D:
	//case SinglePlayerRoom11:
	//case SinglePlayerRoom16:
	//case PlayerHomeBase:
		
	//	break;
	
	//case SinglePlayerTest:
	
	//case SinglePlayerRoom00:
	//case SinglePlayerRoom01:
	//case SinglePlayerRoom02:
	//case SinglePlayerRoom03:
	//case SinglePlayerRoom04:
	//case SinglePlayerRoom05:
	
	//case SinglePlayerRoom07:
	//case SinglePlayerRoom08:
	//case SinglePlayerRoom09:
	//case SinglePlayerRoom0A:
	//case SinglePlayerRoom0B:
	//case SinglePlayerRoom0C:
	
	//case SinglePlayerRoom0E:
	//case SinglePlayerRoom0F:
	//case SinglePlayerRoom10:
	//case SinglePlayerRoom12:
	//case SinglePlayerRoom13:
	//case SinglePlayerRoom14:
	//case SinglePlayerRoom15:
	
	//case SinglePlayerRoom17:
	//case SinglePlayerRoom18:
	//	current_track = bgm02_LevelTheme1;
	//	break;
	#endregion
}

if (current_track == -3) {exit;} // Don't play any music if nothing is defined

try {
	curr_sound = play_bgm(current_track);
} catch (e) {
	debug_msg(string(e));
}