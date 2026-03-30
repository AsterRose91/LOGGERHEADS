/// @description post draw
if !FULLSCREEN_MODE {
	draw_surface_stretched(application_surface, 0, 0, DISP_W, DISP_H);
} else {
	draw_surface_stretched(application_surface, 0, 0, display_get_width(), display_get_height());
}
