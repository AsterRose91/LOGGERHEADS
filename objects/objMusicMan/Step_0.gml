/// @description Insert description here
// You can write your code in this editor
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