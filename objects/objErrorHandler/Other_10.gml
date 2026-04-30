/// @description TRIGGERED WHEN ErrorCorrection() IS CALLED

// PERHAPS DISABLE THESE 
switch (SECRET_VALUE) {
	default:
		break;
	
	case 0:
	case 1:
	case 5:
	case 16:
		// CREATE A CREEPY ERROR MESSAGE
		ActivateMenu(objFunnyErrorMessageType1, noone, false);

		break;
	case 2:	
		// SOME OTHER SORT OF SUBLIMINAL
		//with (objErrorHandler) {do_glitch = true; alarm_set(0, GAMESPEED / 4);}
		break;
	case 3:
		// MAYBE BE TRANSPORTED TO AN EASTER EGG ROOM?
		break;

}
exit;