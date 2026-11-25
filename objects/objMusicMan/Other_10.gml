/// @description Victory music time!

playing_jingle = true;

prev_track = current_track;

audio_stop_sound(curr_sound);

current_track = bgm10_VictoryRework; 
if (SECRET_VALUE == ERR_TYPES.ERR_AUDIODRIVERCRASH) {
	current_track = sfxError2;
}

try {
	curr_sound = play_bgm(current_track, false);
} catch (e) { debug_msg(string(e)); }
