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

// CREATE CAMERA HERE?
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(0, 0, GUI_W, GUI_H, 0, noone, -1, -1, -1, -1);	
}

CAM_X = 0;
CAM_Y = 0;
CAM_XV = 0;
CAM_YV = 0;
CAM_PAN_ENABLED = false;