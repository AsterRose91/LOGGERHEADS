/// @description UNIQUE MENU CODE SHOULD BE KEPT IN A SEPARATE STEP EVENT

// SETTINGS MENU CAN BE CALLED FROM TITLE SCREEN OR WITHIN PAUSE MENU IN SINGLE PLAYER

switch room {
	default:
		// HIDE THE SAVE DATA ERASING STUFF
		MENU_ELEMENTS[23].disable();
		MENU_ELEMENTS[23].hide();
		// BRING BACK THE MAIN PAUSE MENU
		MENU_ELEMENTS[24].do_action = [ActivateMenu, objSinglePlayerModePausemenu_NEW, id];	
		break;
	case titleScreen:
		MENU_ELEMENTS[23].enable();
		MENU_ELEMENTS[23].show();
		// BRING BACK THE TITLE SCREEN
		MENU_ELEMENTS[24].do_action = [ActivateMenu, objTitleScreenMenu_NEW, id];
		break;
}


// if (input_check_pressed("PAUSE")) {MENU_ACTIVE ^= true;}
//MENU_RESIZE();
var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;

// SAVE SETTINGS TO FILE?
