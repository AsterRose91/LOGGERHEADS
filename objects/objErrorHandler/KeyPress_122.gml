/// @description FOR TESTING FATAL MESSAGES
//ActivateMenu(objFunnyErrorMessageType1, noone, false);

var _testmessage = {text: "YOU FOOL", fatal: true};

var _testerror = instance_create_layer(x, y, layer, objFunnyErrorMessageType1);


with (_testerror) {
	var W = string_width(_testmessage.text);
	var H = string_height(_testmessage.text);

	FATAL = _testmessage.fatal;
	MENU_ELEMENTS =	[];							

	array_push(MENU_ELEMENTS, new GUITextMessage(	
								_testmessage.text, 
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

	var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
	MENU_WIDTH = _newSize.width;
	MENU_HEIGHT = _newSize.height;
}
