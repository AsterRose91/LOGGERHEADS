/// @description SINGLE PLAYER MODE PLAYER CHARACTER OBJECT
if (TransitionEffectActive()) {exit;}
if (isGamePaused()) {exit;}

switch (STATE) {

	default:
	case CHARACTER_STATES.NONE:
	
		if (isDialogBoxRunning()) {break;} // SKIP ALL THE CODE IN THIS STATE
		movementIndicators();
		characterTakeKeyboardInput(true); // PASS TRUE IN THIS FOR THE SINGLE PLAYER MODE
		
		if (playerWillFall()) { STATE = CHARACTER_STATES.FALLING; break;}
		break;
		
	case CHARACTER_STATES.MOVING:
		characterMovingState();
		break;
		
	case CHARACTER_STATES.FALLING:
		characterFallingState();
		break;
		
	case CHARACTER_STATES.CHOPPING:
		var SUCCEED = false;
		SUCCEED = characterChoppingState(true);
		
		if (SUCCEED) { with (objSinglePlayerController) {event_perform(ev_other,ev_user0);} }
		
		break;
	
	case CHARACTER_STATES.OOPS:
		// oof ow
		break;	
}
