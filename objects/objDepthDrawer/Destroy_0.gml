/// @description DELETE ALL DS_LISTS

if ds_exists(DEPTHGRID, ds_type_grid) {
	ds_grid_destroy(DEPTHGRID);
}