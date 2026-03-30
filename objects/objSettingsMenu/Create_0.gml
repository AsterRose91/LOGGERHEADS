/// @description CREATE BUTTONS
event_inherited();

MENU_ACTIVE = false;
_X = GUI_W div 2;
_Y = GUI_H div 3;

DO_SAVE_SETTINGS_ON_CLOSE = true;
MENU_PAD = 8;

MENU_ELEMENTS=[
	//0
	new GUIImage(sprPausedText, 0, _X - sprite_get_width(sprPausedText) div 2, _Y - 64 ),
	// BGM VOLUME
	//1
	new GUITextMessage(	
	"Music Volume: ", 
	_X - string_width("Music Volume: "), 
	_Y, 
	4),
	//2
	new VolumeIndicator(_X + 40, _Y, true),
	//3
	VolumeButton(_X + 100, _Y, true, 1),
	//4
	VolumeButton(_X + 20, _Y, true, -1),
	
	// SFX VOLUME
	//5
	new GUITextMessage(	
	"Effects Volume: ", 
	_X - string_width("Effects Volume: "), 
	_Y + 20, 
	4),
	//6
	new VolumeIndicator(_X + 40, _Y + 20, false),
	//7
	VolumeButton(_X + 100, _Y + 20, false, 1),
	//8
	VolumeButton(_X + 20, _Y + 20, false, -1),
	
	// PARTICLE EFFECTS
	//9
	new GUITextMessage(	
	"Particle Effects: ", 
	_X - string_width("Particle Effects: "), 
	_Y + 40, 
	4),
	//10
	PartsIndicator(_X + 60, _Y + 40),
	
	// SHOW THE GAME GRID
	//11
	new GUITextMessage(	
	"Show Grid: ", 
	_X - string_width("Show Grid: "), 
	_Y + 60, 
	4),
	//12
	GridIndicator(_X + 60, _Y + 60),
	
	// FULLSCREEN TOGGLE?
	//13
	new GUITextMessage(	
	"Fullscreen: ", 
	_X - string_width("Fullscreen: "), 
	_Y + 80, 
	4),
	//14
	FullscreenIndicator(_X + 60, _Y + 80),

	// FULLSCREEN TOGGLE?
	//15
	new GUITextMessage(	
	"Movement Hints: ", 
	_X - string_width("Movement Hints: "), 
	_Y + 100, 
	4),
	//16
	MovehintsIndicator(_X + 60, _Y + 100),
	
	// FULLSCREEN TOGGLE?
	//17
	new GUITextMessage(	
	"Enable Error correction: ", 
	_X - string_width("Enable Error correction: "), 
	_Y + 120, 
	4),
	//18
	ErrorCorrectionIndicator(_X + 60, _Y + 120),
	
	// MOVEMENT SPEEDSETTING
	//19
	new GUITextMessage(	
	"Movement Speed", 
	_X - string_width("Movement Speed"), 
	_Y + 140, 
	4),
	//20
	new GamespeedIndicator(_X + 40, _Y + 140),
	//21
	GamespeedButton(_X + 100, _Y + 140, 1),
	//22
	GamespeedButton(_X + 20, _Y + 140, -1),
	
	// ERASE SAVE DATA
	// THIS BUTTON WILL NOT BE ADDED IF objSettingsMenu IS USED OTHER THAN THE TITLE SCREEN
	//23
	new TextButton("Erase save data",_X - 140, _Y+ 180, 2, [ActivateMenu, objConfirmDeleteSaveDataMenu, id]),
	// CLOSE SETTINGS MENU
	//24
	new TextButton("Close settings",_X, _Y+ 180, 2, [ActivateMenu, objTitleScreenMenu_NEW, id]),
	// RESTORE SETTINGS
	//25
	new TextButton("Default Settings",_X + 140, _Y+ 180, 2, [applySettings, defaultSettings()])
];
//MENU_RESIZE();
var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;