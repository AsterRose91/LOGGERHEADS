/// @description NEWER, ORGANIZED MENU OBJECT
event_inherited();
draw_set_color(c_white);
draw_set_font(Font_Small);

DRAW_BACK =			true;
MENU_ACTIVE =		false;		// CAN'T INTERACT WITH THE MENU WHILE IT'S NOT ACTIVE
PARENT_MENU =		noone;
SUBMENU =			noone;		// DIALOG BOXES, ETC.
MENU_PAD = 8;

var MESSAGE_DISCLAIMER = "ARE YOU SURE YOU WANT TO DELETE YOUR GAME SAVE DATA?\nNOTICE: THIS WILL NOT TAKE EFFECT UNTIL YOU PLAY THE NEW GAME AND BEAT A LEVEL\nIF YOU SAY 'YES' AND JUST TURN OFF THE GAME, IT WON'T ERASE THE DATA. WEIRD, I KNOW."
var W = string_width(MESSAGE_DISCLAIMER);
var H = string_height(MESSAGE_DISCLAIMER);
MENU_ELEMENTS =	[				// BUTTONS AND SHIT. USE EXISTING GUI STUFF?
	new GUITextMessage(	
					MESSAGE_DISCLAIMER, 
					(GUI_W div 2) - (W div 2), 
					(GUI_H div 2) - (H div 2), 
					4),
	// YES
	new SpriteButton(
					sprButtonsSmall_transbackNEW,
					3,
					(GUI_W div 2) - 50, 
					(GUI_H div 2) - 10 + H + MENU_PAD,
					[menuDeleteSaveData]
					, sprMenuBackSmallNEW
	),
	
	// NO
	new SpriteButton(
					sprButtonsSmall_transbackNEW,
					2,
					(GUI_W div 2) + 50, 
					(GUI_H div 2) - 10 + H + MENU_PAD,
					[ActivateMenu, objSettingsMenu, objConfirmDeleteSaveDataMenu]
					, sprMenuBackSmallNEW
	)

];	

// PLAY ERROR SOUND?
play_sfx(sfxError);
//MENU_RESIZE();
var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;