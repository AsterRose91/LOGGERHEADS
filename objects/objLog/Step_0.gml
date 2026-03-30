if (isDialogBoxRunning()) {exit;}

switch (BLOCKSTATE) {

	default:
	case LOG_STATES.NONE:		
		
		if (willLogFall(x, y)) {
			BLOCKSTATE = LOG_STATES.FALLING;
			WaitTimerIncrement();
			break;
		}		
		break;
	
	case LOG_STATES.CHOPPED:
		//horizontal logs can NOT be choppped, ever.
		//neither can heavy logs
		//they either have to be felled, or exploded
		if (BLOCKTYPE == LOG_COLORS.HEAVY || BLOCKTYPE == LOG_COLORS.HORIZONTAL) {
			BLOCKSTATE = LOG_STATES.NONE;
			break;
		}
	
		// fly offscreen
		repeat (MOVEMENT_SPEEDSETTING) { //(MOVE_SPEED) {
			x += DIR;
			
			#region COLLISIONS
			if (ALLOW_COLLISIONS) {
				
				var collision = instance_place(x + DIR, y, objLog);
				
				if (collision!=noone) {	
					// fall down
					if (collision.y == y) {
						play_sfx(sfxThud);
						BLOCKSTATE = LOG_STATES.FALLING;
					}
					break;
				}
			}
			#endregion
		}
		
		break;
	
	case LOG_STATES.FALLING:
		// fall down
		if (YY < MOVEMENT_SPEEDSETTING) {YY++;}//MOVE_SPEED) {YY++;}
		repeat(YY) { y++; }
		break;
		
	case LOG_STATES.KABOOM:
		// destroy adjacent logs?
		if (image_index == image_number - 1) { instance_destroy(self); }
		break;
}
