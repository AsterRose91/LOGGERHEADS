/// @description DRAW GUI ELEMENTS
if (TransitionEffectActive()) {exit;}
if (!MENU_ACTIVE) {exit;}
	
draw_set_font(Font_Small);
draw_set_color(c_white);
	
#region BACKGROUND
if (DRAW_BACK) {
	draw_sprite_stretched_ext(sprMenuBack2, 0, x, y, MENU_WIDTH, MENU_HEIGHT, image_blend, image_alpha);
}
#endregion

#region BUTTONS
array_foreach(MENU_ELEMENTS, draw_gui_element);
#endregion