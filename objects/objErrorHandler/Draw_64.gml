/// @description DIAGNOSTICS
if (!TESTING) {exit;}
if (!show_diag) {exit;}
var draw_x = 8, draw_y = 8, _text, text_w, text_h, max_w = 480;

draw_sprite_stretched_ext(bgSkyNEW,0,0,0,GUI_W,GUI_H,c_blue,1);
draw_set_font(Font_Diagnostics);


_text = $"[Font_Diagnostics_new]LOGGERHEADS DIAGNOSTICS PANEL[/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"[Font_Diagnostics_new]=======================================[/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"[Font_Diagnostics_new]Game version: {GAME_VERSION_THINGY}[/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"[Font_Diagnostics_new]Levels completed: {countLevelsCleared()}[/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"[Font_Diagnostics_new]Friends Met: {totalFriendsMet()}[/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"[Font_Diagnostics_new]Current Room: {room_get_name(room)} (ID {room}) isHubLevel: ({isHubLevel(room)})[/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"[Font_Diagnostics_new][c_red]Red key: {RED_KEY_COLLECTED} [c_green]Green Key: {GREEN_KEY_COLLECTED} [c_aqua]Blue Key: {BLUE_KEY_COLLECTED} [c_white]??? Key: {ICE_KEY_COLLECTED}[/color][/font]";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

