/// @description TRIGGERED WHEN ErrorCorrection() IS CALLED

// PERHAPS DISABLE THESE 
switch (SECRET_VALUE) {
	default:
		break;
	
	case ERR_TYPES.ERR_MSG:
		// CREATE A CREEPY ERROR MESSAGE
		ActivateMenu(objFunnyErrorMessageType1, noone, false);

		break;
	case ERR_TYPES.ERR_BSOD:	
		// SOME OTHER SORT OF SUBLIMINAL
		ActivateMenu(objFunnyErrorMessageType1, noone, false);
		//with (objErrorHandler) {do_glitch = true; alarm_set(0, GAMESPEED / 4);}
		break;
	case ERR_TYPES.ERR_SPECTRE:
		// MAYBE BE TRANSPORTED TO AN EASTER EGG ROOM?
		break;

}
exit;