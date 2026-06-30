/// @description NEWER, ORGANIZED MENU OBJECT

draw_set_color(c_white);
draw_set_font(Font_Small);


// BLURRING THE BACKGROUNDS BEHIND MENUS
DO_BLUR = true;
BLUR_AMT = 0;
BLUR_AMT_MAX = 4;
BLUR_FILTER = "_effect_gaussian_blur"; //"_filter_large_blur"; // "_filter_linear_blur";	//replace with kawase blur?
BLUR_PARAM = "g_numDownsamples"; //"g_Radius";// "g_LinearBlurVector";	

MENU_BLUR_FX_LAYER = layer_create(-10000, "BLURRING_LAYER");
MENU_BLUR_FILTER = fx_create(BLUR_FILTER); // LINEAR BLUR?
layer_set_fx(MENU_BLUR_FX_LAYER , MENU_BLUR_FILTER);
fx_set_parameter(MENU_BLUR_FILTER, BLUR_PARAM, 0);

DRAW_BACK =			true;
MENU_ACTIVE =		false;		// CAN'T INTERACT WITH THE MENU WHILE IT'S NOT ACTIVE
PARENT_MENU =		noone;
SUBMENU =			noone;		
MENU_PAD = 8;

// PARENT OBJECT USED FOR DISCLAIMER
var TEST_MESSAGE_DISCLAIMER = "THIS GAME CONTAINS SCENES OF VIOLENCE AND EVIL\nAND IS RIGHT NOW VERY INCOMPLETE.\nIF YOU HAVE A PREVIOUS VERSION OF THIS GAME,\nTHE SAVE FILE FROM IT MIGHT BE INCOMPATIBLE\nARE YOU READY?"
var W = string_width_scribble(TEST_MESSAGE_DISCLAIMER);
var H = string_height_scribble(TEST_MESSAGE_DISCLAIMER);
MENU_ELEMENTS =	[				// BUTTONS AND SHIT. USE EXISTING GUI STUFF?
	new GUITextMessage(	
					TEST_MESSAGE_DISCLAIMER, 
					(GUI_W div 2) - (W div 2), 
					(GUI_H div 2) - (H div 2), 
					4),			
	// YES
	new SpriteButton(
					sprButtonsSmall_transbackNEW,
					3,
					(GUI_W div 2) - 50, 
					(GUI_H div 2) - 10 + H + MENU_PAD,
					[gotoLevel, SPECIALROOMS.TITLE_SCREEN]
					, sprMenuBackSmallNEW
	),
	// NO
	new SpriteButton(
					sprButtonsSmall_transbackNEW,
					2,
					(GUI_W div 2) + 50, 
					(GUI_H div 2) - 10 + H + MENU_PAD,
					[Quit]
					, sprMenuBackSmallNEW
	)
];	
NUMBER_ELEMENTS =	array_length(MENU_ELEMENTS);
KEYBOARD_MODE =		false;	// MOUSE IS USED TO CONTROL THE MENU BY DEFAULT
KEYBOARD_INDEX =	0;		// USED WHEN IN KEYBOARD MODE

MOUSE_XPREV =		mouse_x;
MOUSE_YPREV =		mouse_y;

MENU_WIDTH =		100;
MENU_HEIGHT =		100;
BUFFER =			0;

x = (GUI_W div 2) - (MENU_WIDTH div 2);
y = (GUI_H div 2) - (MENU_HEIGHT div 2);


CYCLE_ELEMENTS = function(e) {
	NUMBER_ELEMENTS =	array_length(MENU_ELEMENTS);
	
	var getIndex = function(n) {return (n + NUMBER_ELEMENTS) mod NUMBER_ELEMENTS;}
	if (e != 1 && e!= -1) {return;}
	while (true) {
		MENU_ELEMENTS[KEYBOARD_INDEX].has_focus = false;
		KEYBOARD_INDEX = getIndex(KEYBOARD_INDEX + e);
		if (MENU_ELEMENTS[getIndex(KEYBOARD_INDEX)].enabled && MENU_ELEMENTS[getIndex(KEYBOARD_INDEX)].visible) {break;} // SKIP DISABLED ELEMENTS
	}
	MENU_ELEMENTS[KEYBOARD_INDEX].has_focus = true;
	return;
};

FOCUS_ELEMENTS_MOUSE = function(e) {
	if (e.mouseover()) {e.has_focus = true;} else {e.has_focus = false;}

};

var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;



CYCLE_ELEMENTS(1);