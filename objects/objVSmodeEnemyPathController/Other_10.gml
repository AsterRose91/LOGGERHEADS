/// @description UPDATE THE GRID
//if (path_exists(PATH)) { path_delete(PATH); }
mp_grid_clear_all(GRID);

var XX, YY, CHECK = false;
for (YY = 0; YY < GRID_HEIGHT; YY++) { 
	for (XX = 0; XX < GRID_WIDTH; XX++) {
		CHECK = !isValidPosition(XX * T,YY * T);
		if (CHECK) { mp_grid_add_cell(GRID, XX, YY); }
	}
}