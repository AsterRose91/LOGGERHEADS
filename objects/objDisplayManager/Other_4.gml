/// @description ROOM RESOLUTION SHIT/VIEW
CAM_X = 0;
CAM_Y = 0;
CAM_XV = 0;
CAM_YV = 0;
view_enabled[0] = true;
view_visible[0] = true;

// ASPECT RATIO STUFF
// GAME IS 640 x 360
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(CAM_X, CAM_Y, CAM_W, CAM_H, 0, noone, -1, -1, -1, -1);
}
view_wport[0] = FULLSCREEN_MODE ? display_get_width()	: DISP_W;
view_hport[0] = FULLSCREEN_MODE ? display_get_height()	: DISP_H;


// BACKGROUND SETUP
// THIS SHOULD PROBABLY BE MOVED TO A DIFFERENT OBJECT FOR SEPARATION OF CONCERNS. THERE IS NO REASON FOR THIS TO HAVE THE BACKGROUND CODE
if (room != preTitleScreen && !isHubLevel(room)) { auto_background(); }