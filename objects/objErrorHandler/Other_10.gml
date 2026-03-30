/// @description TRIGGERED WHEN ErrorCorrection() IS CALLED

// PERHAPS DISABLE THESE 
switch (SECRET_VALUE) {
	default:
		break;
	
	case 1:
	case 5:
		// SPOOKY FACE

		// IGNORES RESTRICTION ON PARTICLES
		part_particles_create(PARTICLE_MAN, view_xport[view_current] + irandom(view_wport[view_current]), view_yport[view_current] + irandom(view_hport[view_current]), JUMP_FACE, 1);
		
		break;
	case 16:
		// CREATE A CREEPY ERROR 
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