/// @description DRAW THE MENU
if (!enabled) {exit;}

#region BACKGROUND
draw_sprite_stretched(sprMenuBack2, 0, x, y, w, h);
#endregion

#region MENU TITLE
draw_set_font(Font_Big);
draw_set_color(c_white);
draw_text_drop_shadow(x + 16, y + 16, "PAUSED!", c_white, c_black, 2, 2);
#endregion

draw_set_font(Font_Small);
draw_set_color(c_white);
#region BUTTONS
array_foreach(BUTTONS, gui_element_mouseover);
array_foreach(BUTTONS, draw_gui_element);
array_foreach(BUTTONS, gui_element_do_step);
#endregion
