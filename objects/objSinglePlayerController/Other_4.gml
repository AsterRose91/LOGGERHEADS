/// @description ROOM RESTART DATA RECORD

LEVEL_RESTART_DATA = GetLevelState();


if (room == PlayerHomeBase) {
	if (!VISITED_HOME_BASE_FIRST_TIME) {

		createDialogBox(
			[
				new Dialog("Hey player! Welcome to my house!", objPlayer_SP, sfxTalksound_Bobr),
				new Dialog("I know it looks like it's a little empty right now...", objPlayer_SP, sfxTalksound_Bobr),
				new Dialog("but I'm sure we'll find lots of cool things to spruce it up with.", objPlayer_SP, sfxTalksound_Bobr),
			]
		);
		VISITED_HOME_BASE_FIRST_TIME = true;
	}
}