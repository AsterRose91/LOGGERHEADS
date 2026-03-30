/// @description CREATE BUTTONS
event_inherited();


var MSG_TITLESCREEN= "EXIT TO TITLE SCREEN"
, MSG_LVLSELECT = "EXIT TO LEVEL SELECT"
, MSG_RESTART = "RESTART LEVEL"
, MSG_OPTIONS = "OPTIONS"
, MSG_RESUME = "CLOSE MENU"
, MSG_QUIT = "QUIT GAME";

MENU_ACTIVE = false;
MENU_ELEMENTS= [
	new GUIImage(sprPausedText, 0, (GUI_W div 2) - 80, (GUI_H div 2) - 80 ),
	// BUTTON THAT TAKES YOU TO TITLE SCREEN
	new TextButton(
		MSG_TITLESCREEN
		, (GUI_W div 2) - (string_width(MSG_TITLESCREEN) div 2)
		, (GUI_H div 2) - 40
		, 4
		, [gotoLevel, SPECIALROOMS.TITLE_SCREEN]), 
	
	// BUTTON THAT RETURNS YOU TO LEVEL SELECT
	new TextButton(
		MSG_LVLSELECT
		, (GUI_W div 2) - (string_width(MSG_LVLSELECT) div 2)
		, (GUI_H div 2) - 20
		, 4
		,  [gotoLevel, SPECIALROOMS.LEVEL_SELECT]),
		
	// BUTTON THAT RESTARTS LEVEL
	new TextButton(
		MSG_RESTART
		, (GUI_W div 2) - (string_width(MSG_RESTART) div 2)
		, (GUI_H div 2)
		, 4
		, [levelRestart]),	
		
	new TextButton(
		MSG_OPTIONS
		, (GUI_W div 2) - (string_width(MSG_OPTIONS) div 2)
		, (GUI_H div 2) + 20
		, 4
		, [ActivateMenu, objSettingsMenu, objSinglePlayerModePausemenu_NEW]),
		
	new TextButton(
		MSG_RESUME
		, (GUI_W div 2) - (string_width(MSG_RESUME) div 2)
		, (GUI_H div 2) + 40
		, 4
		, [DeactivateMenu, id]),
		
		
	new TextButton(
		MSG_QUIT
		, (GUI_W div 2) - (string_width(MSG_QUIT) div 2)
		, (GUI_H div 2) + 60
		, 4
		, [Quit]) 
];
//MENU_RESIZE();
var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;