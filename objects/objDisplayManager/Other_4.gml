/// @description ROOM RESOLUTION SHIT/VIEW

view_enabled[0] = true;
view_visible[0] = true;

// ASPECT RATIO STUFF
// GAME IS 640 x 360
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(0, 0, GUI_W, GUI_H);	
}
view_wport[0] = FULLSCREEN_MODE ? display_get_width() : DISP_W;
view_hport[0] = FULLSCREEN_MODE ? display_get_height() : DISP_H;

// SET TO FOLLOW PLAYER ON HUB LEVELS?
if (isHubLevel(room)) {
	

}

// BACKGROUND TEST
// THIS SHOULD PROBABLY BE MOVED TO A DIFFERENT OBJECT FOR SEPARATION OF CONCERNS. THERE IS NO REASON FOR THIS TO HAVE THE BACKGROUND CODE
if (room != preTitleScreen && room != Hub0 && room != Hub1) { auto_background_stuff(); }