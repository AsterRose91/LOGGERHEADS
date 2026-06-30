/// @description ROOM RESOLUTION SHIT/VIEW

view_enabled[0] = true;
view_visible[0] = true;

// ASPECT RATIO STUFF
// GAME IS 640 x 360
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(0, 0, GUI_W, GUI_H);	
}
view_wport[0] = FULLSCREEN_MODE ? display_get_width()	: DISP_W;
view_hport[0] = FULLSCREEN_MODE ? display_get_height()	: DISP_H;


// BACKGROUND SETUP
// THIS SHOULD PROBABLY BE MOVED TO A DIFFERENT OBJECT FOR SEPARATION OF CONCERNS. THERE IS NO REASON FOR THIS TO HAVE THE BACKGROUND CODE
if (room != preTitleScreen && !isHubLevel(room)) { auto_background(); }