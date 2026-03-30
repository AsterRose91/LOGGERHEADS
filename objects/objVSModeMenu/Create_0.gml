/// @description IT'S WORKING NOW BUT HOLY FUCK
event_inherited();

draw_set_color(c_white);
draw_set_font(Font_Small);

DO_BLUR =			false;		// NO BLURRING
DRAW_BACK =			true;
MENU_ACTIVE =		false;		// CAN'T INTERACT WITH THE MENU WHILE IT'S NOT ACTIVE
MENU_PAD =			8;

var MSG= "DO YOU WANT TO PLAY AGAIN?"
var W = string_width(MSG);
var H = string_height(MSG);
MENU_ELEMENTS =	[				// BUTTONS AND SHIT. USE EXISTING GUI STUFF?
	new GUITextMessage(	
					MSG, 
					(GUI_W div 2) - (W div 2), 
					(GUI_H div 2) - (H div 2), 
					4),			
	// YES
	new SpriteButton(
					sprButtonsSmall_transbackNEW,
					3,
					(GUI_W div 2) - 50, 
					(GUI_H div 2) + 10 + MENU_PAD,
					[MatchRestart],
					sprMenuBackSmallNEW
	),
	// NO
	new SpriteButton(
					sprButtonsSmall_transbackNEW,
					2,
					(GUI_W div 2) + 50, 
					(GUI_H div 2) + 10 + MENU_PAD,
					[gotoLevel, SPECIALROOMS.TITLE_SCREEN],
					sprMenuBackSmallNEW
	)
];	

var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;
//MENU_RESIZE();