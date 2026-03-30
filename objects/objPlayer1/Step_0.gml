/// @description Insert description here
// You can write your code in this editor
if (isGamePaused()) {exit;}
if (TransitionEffectActive()) {exit;}



switch (STATE) {

	default:
	case CHARACTER_STATES.NONE:
		START_SPURT = true;
		//if (!myTurn(PLAYER_ID) || isMatchOver() || isWaiting()) {
		if (!myTurn(PLAYER_ID) || isWaiting()) {exit;}
		
		if (isMatchOver()) {
			var _KILLEDFOE =  false;
			with (PLAYER_2_OBJ) { _KILLEDFOE = GIFTED; other.CAN_KILL = CAN_DIE; }
			if (_KILLEDFOE) {exit;}
			
		}
		
		if (playerWillFall()) {IS_FALL = true;}
		if (IS_FALL) {STATE = CHARACTER_STATES.FALLING; break;} 
		
		characterTakeKeyboardInput(true);
		break;
		
	case CHARACTER_STATES.MOVING:
		START_SPURT = true;
		characterMovingState();
		break;
		
	case CHARACTER_STATES.FALLING:
		characterFallingState();
		break;
		
	case CHARACTER_STATES.CHOPPING:
		START_SPURT = false;
		characterChoppingState();
		break;
	
	case CHARACTER_STATES.OOPS:
		if (GIFTED) {
			//if (PARTICLES_ENABLED) {part_particles_create(PARTICLE_MAN,MID_X,MID_Y + 5,JUICE,12);}
			if (!START_SPURT) {
				alarm[0] = 1;
				START_SPURT = true;
			}
		}
		break;	
}
