/// @description DESTROY ONLY ONE BLOCK

switch DESTROY_MODE
{
	default:
	case true:
		var LOG_DESTROY = instance_place(x, y, objLog_SP);
		if (LOG_DESTROY != noone && instance_exists(LOG_DESTROY)) {
			var DONE = false;
			with (LOG_DESTROY) {
				if (!EXPLODE_PROOF) {
					if (BLOCKSTATE != LOG_STATES.FALLING && BLOCKSTATE != LOG_STATES.CHOPPED) {
						BLOCKSTATE = LOG_STATES.KABOOM;
						DONE = true;
					}
				}
			}
		
			if (DONE) {DESTROY_MODE = false; break;}
		}
		break;
	
	case false:
		break;
}
	
	
var OOPS_PLAYER = instance_place(x,y, objPlayer_SP);
if (OOPS_PLAYER != noone) {
	with (OOPS_PLAYER) {
		if (STATE != CHARACTER_STATES.OOPS) {
			OOPSY_WOOPSY = 1;
			STATE = CHARACTER_STATES.OOPS;
		}
	}
}