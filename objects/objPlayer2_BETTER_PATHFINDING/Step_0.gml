/// @description Insert description here
// You can write your code in this editor
if (isGamePaused()) {exit;}
if (TransitionEffectActive()) {exit;}
//playerInputFunction();

switch (STATE) {

	default:
	case CHARACTER_STATES.NONE:
		START_SPURT = false;
		if (isMatchOver()) {
			// IF MATCH IS OVER, KILL THE PLAYER
			// UNLESS YOU LOST.
			with (PLAYER_1_OBJ) { other.CAN_KILL = CAN_DIE; }
			if (CAN_KILL) { seekThePlayerToKill(); }
		}
		else  {
			CAN_KILL = false;
			if (!myTurn(PLAYER_ID) || isWaiting()) {exit;}
			characterThinksBetterPF(); // welp
		}
		
		if (playerWillFall()) {IS_FALL = true;}
		if (IS_FALL) {STATE = CHARACTER_STATES.FALLING; break;} 
		break;
		
	case CHARACTER_STATES.MOVING:
		START_SPURT = false;
		characterMovingState(); 
		break;
		
	case CHARACTER_STATES.FALLING:
		START_SPURT = false;
		characterFallingState();
		break;
		
	case CHARACTER_STATES.CHOPPING:
		START_SPURT = false;
		characterChoppingState();
		break;
	
	case CHARACTER_STATES.OOPS:
		if (GIFTED) {
			//if (PARTICLES_ENABLED) {
			//	part_particles_create(PARTICLE_MAN,MID_X,MID_Y + 5,JUICE,12);
			//}
			if (!START_SPURT) {
				alarm[0] = 1;
				START_SPURT = true;
			}
		}
		break;	
}
