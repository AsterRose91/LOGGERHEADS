/// @description DRAW THE MOUSE
if (HIDE_MOUSE) {exit;}

var _i = 0; //tileCollision(mouse_x, mouse_y, "Collision") ? 1 : 0;

draw_sprite_ext(sprCursor, _i, GUI_MOUSE_X,  GUI_MOUSE_Y, 1, 1, 0, c_white, 1);