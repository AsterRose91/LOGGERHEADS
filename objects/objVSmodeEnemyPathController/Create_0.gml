/// @description ALLOW THE AI CHARACTER TO USE MP_GRID AND MOVEMENT STUFF

//GRID
GRID_WIDTH = room_width div T;
GRID_HEIGHT = room_height div T;
GRID = mp_grid_create(0, 0, GRID_WIDTH, GRID_HEIGHT, T, T);

//PATH
PATH = path_add();

event_perform(ev_other, ev_user0);