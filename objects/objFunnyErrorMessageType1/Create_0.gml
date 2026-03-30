/// @description FUNNY ERROR MESSAGE
event_inherited();							// INHERIT THE PARENT EVENT

MENU_ACTIVE = true;
DO_BLUR = false;


var GET_ERROR_MESSAGE = getCreepyMessage();	// GET A CREEPY ERROR MESSAGE FROM A LIST
FATAL = GET_ERROR_MESSAGE.fatal ?? false;	// THIS ERROR MESSAGE MAKES YOU DIE 
ERROR_MESSAGE = GET_ERROR_MESSAGE.text;		// ERROR MESSAGE STRING

var W = string_width(ERROR_MESSAGE);
var H = string_height(ERROR_MESSAGE);

MENU_ELEMENTS =	[];							// BUTTONS AND SHIT. USE EXISTING GUI STUFF?

array_push(MENU_ELEMENTS, new GUITextMessage(	
								ERROR_MESSAGE, 
								(GUI_W div 2) - (W div 2), 
								(GUI_H div 2) - (H div 2), 
								4));
							
if (!FATAL)	{
	array_push(MENU_ELEMENTS, new TextButton(	
							"OK", 
							(GUI_W div 2) - (string_width("OK") div 2), 
							(GUI_H div 2) - (string_height("OK") div 2) + H + MENU_PAD, 
							4, 
							[DestroyMenu, id]));
							
} else {
	array_push(MENU_ELEMENTS, new TextButton(	
						"DIE", 
						(GUI_W div 2) - (string_width("DIE") div 2), 
						(GUI_H div 2) - (string_height("DIE") div 2) + H + MENU_PAD, 
						4, 
						[Quit, id]));
}

play_sfx(sfxError);

var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;