/// @description ROOM RESTART DATA RECORD

LEVEL_RESTART_DATA = GetLevelState();

//with (objLog_SP) { 
//	array_push(other.LEVEL_RESTART_DATA,
//		{
//			_obj: object_index,  
//			_x: xstart, 
//			_y: ystart,
//			_h: V_SIZE,
//			_w: SIZE,
//			_xs: image_xscale,
//			_ys: image_yscale,
//			_magnetised: MAGNET_ACTIVE, // idk if this needs to be there but oh well
//		}
//	);
//}


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