///@description DOESN'T HAVE A SPRITE


/// DRAW A GRID
if (SHOWGRID_SETTING) {
	var GRID_DRAW_X, GRID_DRAW_Y;
	for (var i = 0; i < 144; i++) {
		GRID_DRAW_X = i mod 16;
		GRID_DRAW_Y = i div 16;
		if ((GRID_DRAW_X + GRID_DRAW_Y) mod 2 == 0) {
			draw_sprite_ext(sprBlockNEW, 0, GRID_DRAW_X * 40, GRID_DRAW_Y * 40, 1, 1, 0, c_white, 0.2);
		}
	}
}

exit;