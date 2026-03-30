/// @description Insert description here
// You can write your code in this editor
if (isGamePaused()) {exit;}
//playerInputFunction();

switch (STATE) {

	default:
	case CHARACTER_STATES.NONE:
		if (isMatchOver()) {
			// IF MATCH IS OVER, KILL THE PLAYER
			// UNLESS YOU LOST.
			if (!CAN_DIE) {
				var _target = instance_nearest(x, y, objPlayer1);
				if (_target != noone) {
					if (_target.CAN_DIE && !_target.GIFTED) { seekThePlayerToKill(); }
				}
			}
		}
		else  {
			if (!myTurn(PLAYER_ID) || isWaiting()) {exit;}
			characterThinksNew(); // Now they can turn around!
		}
		
		if (playerWillFall()) {IS_FALL = true;}
		if (IS_FALL) {STATE = CHARACTER_STATES.FALLING; break;} 
		break;
		
	case CHARACTER_STATES.MOVING:
		characterMovingState(); 
		break;
		
	case CHARACTER_STATES.FALLING:
		characterFallingState();
		break;
		
	case CHARACTER_STATES.CHOPPING:
		characterChoppingState();
		break;
	
	case CHARACTER_STATES.OOPS:
		if (GIFTED) {
			if (PARTICLES_ENABLED) {part_particles_create(PARTICLE_MAN,MID_X,MID_Y + 5,JUICE,12);}
		}
		break;	
}
