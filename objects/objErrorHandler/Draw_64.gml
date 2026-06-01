/// @description DIAGNOSTICS
if (!TESTING) {exit;}
if (!show_diag) {exit;}
var draw_x = 8, draw_y = 8, _text, text_w, text_h, max_w = 480;

draw_sprite_stretched_ext(bgSkyNEW,0,0,0,GUI_W,GUI_H,c_blue,1);
draw_set_font(Font_Diagnostics);


_text = $"LOGGERHEADS DIAGNOSTICS PANEL";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"=======================================";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"Game version: {GAME_VERSION_THINGY}";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"Levels completed: {countLevelsCleared()}";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"Friends Met: {totalFriendsMet()}";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"Current Room: {room_get_name(room)} (ID {room}) isHubLevel: ({isHubLevel(room)})";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

_text = $"Red key: {RED_KEY_COLLECTED} Green Key: {GREEN_KEY_COLLECTED}, Blue Key: {BLUE_KEY_COLLECTED}, ??? Key: {ICE_KEY_COLLECTED}";
draw_text_outline(draw_x, draw_y, _text, c_white, c_black, max_w);
draw_y += string_height_ext(_text, 1, max_w);

