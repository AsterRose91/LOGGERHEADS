global.sfx_volume = 0.5;
#macro SFX_VOL global.sfx_volume
global.bgm_volume = 0.5;
#macro BGM_VOL global.bgm_volume

global.sound_effects_enabled = true;
#macro SFX_ENABLED global.sound_effects_enabled
global.music_enabled = true;
#macro BGM_ENABLED global.music_enabled

global.bgm_current= bgmNONE;


///@func play_sfx(sfx_id)
///@desc play a sound effect
///@arg {Asset.GMSound} sfx_id
///@returns {Id.Sound|Id.Instance}
function play_sfx(sfx_id) {
	if (!SFX_ENABLED) { return noone; }
	var s = audio_play_sound(sfx_id, 0, false, SFX_VOL); 
	//array_push(global.sfx_current, s);
	return s;
}

///@func play_bgm(bgm_id,[do_loop])
///@desc play music
///@arg {Asset.GMSound} bgm_id
///@arg {Bool} [do_loop]
///@returns {Id.Sound|Id.Instance}
function play_bgm(bgm_id, do_loop = true) {
	if (!BGM_ENABLED) {return noone;}
	var m = audio_play_sound(bgm_id, 0, do_loop, BGM_VOL);
	global.bgm_current = m;
	return m;
}


///@func change_music_volume([amt])
///@desc increase or decrease music volume
///@arg {Real} amt
function change_music_volume(amt) {
	var final_vol = 1;
	if (amt < 0) {final_vol = 0;}
	BGM_VOL = approach(BGM_VOL, final_vol, 0.1);
	audio_sound_gain(global.bgm_current, BGM_VOL, 0);
	
}

///@func change_sound_volume([amt])
///@desc increase or decrease sound volume
///@arg {Real} amt
function change_sound_volume(amt) {
	var final_vol = 1;
	if (amt < 0) {final_vol = 0;}
	SFX_VOL = approach(SFX_VOL, final_vol, 0.1);
}