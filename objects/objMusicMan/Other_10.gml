/// @description Victory music time!

playing_jingle = true;

prev_track = current_track;

audio_stop_sound(curr_sound);

current_track = bgm10_VictoryRework; //bgm07_VictoryOLD;
try {
	curr_sound = play_bgm(current_track, false);
} catch (e) {
	debug_msg(string(e));
}

