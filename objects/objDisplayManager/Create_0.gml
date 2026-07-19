/// @description GRAPHICS OPTIONS

// GAME IS 640 x 360
display_set_gui_size(GUI_W, GUI_H);

// 60 FPS
game_set_speed(GAMESPEED, gamespeed_fps);

// RESIZE APPLICATION SURFACE
application_surface_draw_enable(false);
surface_resize(application_surface, GUI_W, GUI_H);

// CREDIT TO PIXELATEDPOPE
aspect_ratio = display_get_width() / display_get_height();

ideal_width = GUI_W;
ideal_height = round(ideal_width * aspect_ratio);


// CHECK FOR ODD NUMBERS
if (ideal_height & 1) {ideal_height++;}



CAM_X = 0;
CAM_Y = 0;
CAM_FINALX = 0;
CAM_FINALY = 0;

CAM_W = GUI_W;
CAM_H = GUI_H;
CAM_XV = 0;
CAM_YV = 0;
CAMERA_MODE = CAMERA_MODES.FOLLOW_PLAYER;
MOVE_MODE = 0; // USE WITH CAMERA_MODES.FOLLOW_PLAYER
FREECAM_ENABLED = true;

// CREATE CAMERA HERE?
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(CAM_X, CAM_Y, CAM_W, CAM_H, 0, noone, -1, -1, -1, -1);	
}