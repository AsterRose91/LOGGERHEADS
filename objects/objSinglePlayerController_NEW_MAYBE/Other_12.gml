/// @description LEVEL RESTART
play_sfx(sfxReset0);

part_particles_clear(PARTICLE_MAN);

GAME_PAUSED = false; // TOGGLE PAUSE
MOVES_COUNTER = 0;
CHOPS_COUNTER = 0;
RETRIES_COUNTER++;	// NUMBER OF TIMES YOU'VE RETRIED A LEVEL
LEVEL_WON = false;


// RESTORE LEVEL STATE
RestoreLevelState(LEVEL_RESTART_DATA);

#region old level restart code
//with (objFriend) {GIFTED = false; x = xstart; y = ystart;}
//with (objGameOverSpecialEffect) {instance_destroy(self);}
//with (objLevelCompleteSpecialEffect) {instance_destroy(self);}
//with (objFriendGift) {instance_destroy(self);}
//with (objLog) {instance_destroy(self);}

//array_foreach(
//	LEVEL_RESTART_DATA,
//	function(n) {
//		var obj = instance_create_layer(n._x, n._y, "Instances", n._obj); 
//		with (obj) {
//			SIZE = n._w;
//			V_SIZE = n._h;
//			image_xscale = n._xs;
//			image_yscale = n._ys;
//			MAGNET_ACTIVE = n._magnetised;
//		}
//	}
//);

//with (objPlayer_SP) {
//	x = xstart; 
//	y = ystart;
//	STATE = CHARACTER_STATES.NONE;
//}
#endregion
