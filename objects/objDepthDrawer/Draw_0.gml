/// @description DRAW OBJECTS WITH THE RIGHT DEPTH

var DGRID = DEPTHGRID;

var NUMBER = instance_number(objLevelMapParentThing);

ds_grid_resize(DGRID, 2, NUMBER);

var yy = 0;
with (objLevelMapParentThing) {
	DGRID[# 0, yy] = id;
	DGRID[# 1, yy] = bbox_bottom;
	yy++;
}

ds_grid_sort(DGRID, 1, true);

yy = 0; 
var INST;
repeat(NUMBER) {
	INST = DEPTHGRID[# 0, yy];
	with (INST) {if (object_index != objSolid) {event_perform(ev_draw, 0);}}
	yy++;
}


