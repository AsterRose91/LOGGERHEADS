/// @description HIDE MOUSE WHEN KEYBOARD KEY IS PRESSED. UNHIDE ON MOVING MOUSE

//MOUSE_CURR_X = device_mouse_x_to_gui(0);//mouse_x;
//MOUSE_CURR_Y = device_mouse_y_to_gui(0);//mouse_y;

MOUSE_IS_MOVING = (GUI_MOUSE_X != MOUSE_PREV_X ||  GUI_MOUSE_Y != MOUSE_PREV_Y);

if (MOUSE_IS_MOVING || mouse_check_button(mb_any)) {
	HIDE_MOUSE = false;	
	MOUSE_PREV_X = GUI_MOUSE_X;
	MOUSE_PREV_Y = GUI_MOUSE_Y;
	alarm[0] = GAMESPEED * 5; 
}
