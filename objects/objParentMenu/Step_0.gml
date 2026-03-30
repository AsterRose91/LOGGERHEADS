/// @description BETTER MENU CODE
if (TransitionEffectActive()) {exit;}


playerInputFunction();

if (!MENU_ACTIVE) {
	BUFFER = 10; 
	layer_set_visible(MENU_BLUR_FX_LAYER, false);
	exit;
}

// PREVENTS CLICKING TOO SOON
if (BUFFER > 0) {BUFFER--; exit;}
	
// DON'T DO ANYTHING UNLESS THE SUBMENU IS DISMISSED
if (SUBMENU != noone) {exit;}
	
if (DO_BLUR) {
	layer_set_visible(MENU_BLUR_FX_LAYER, true);
	fx_set_parameter(MENU_BLUR_FILTER, BLUR_PARAM, 1);
} else {
	layer_set_visible(MENU_BLUR_FX_LAYER, false);
}


// SWITCH TO KEYBOARD MODE
if keyboard_check(vk_anykey) {KEYBOARD_MODE = true;}
	
// SWITCH TO MOUSE MODE
if (mouse_x != MOUSE_XPREV || mouse_y != MOUSE_YPREV || mouse_check_button(mb_any)) {KEYBOARD_MODE = false;}
	
	
// KEYBOARD MODE
// CYCLE THROUGH MENU ELEMENTS WITH KEYBOARD KEYS
if (KEYBOARD_MODE) {
	var current_element = MENU_ELEMENTS[(KEYBOARD_INDEX + NUMBER_ELEMENTS) % NUMBER_ELEMENTS]
	
	if (GO_RIGHT_PRESS|| GO_DOWN_PRESS)	{CYCLE_ELEMENTS( 1);}
	if (GO_LEFT_PRESS || GO_UP_PRESS) {CYCLE_ELEMENTS(-1);}
	if (CHOP_LOG) {
		current_element.do_stuff();
	} // SELECT AN OPTION
	
} else {
	// MOUSE MODE
	array_foreach(MENU_ELEMENTS, FOCUS_ELEMENTS_MOUSE);
	array_foreach(MENU_ELEMENTS, gui_element_do_step);
}

// UPDATE MOUSE POSITIONS
if (!KEYBOARD_MODE) {MOUSE_XPREV = mouse_x; MOUSE_YPREV = mouse_y;}