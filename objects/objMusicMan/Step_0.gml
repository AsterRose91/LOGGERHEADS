/// @description INTERRUPT SOUND FOR JINGLES
if (playing_jingle) {

	if (!audio_is_playing(curr_sound)){
		
		current_track = prev_track;
		try {
			curr_sound = play_bgm(current_track);
		} catch (e) {
			debug_msg(string(e));
		}

		
		playing_jingle = false;
	}
}