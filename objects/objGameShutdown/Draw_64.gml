if (!SHOW_SPLASH) {exit;}
draw_set_font(Font_Diagnostics);
// WHAT IF IT WAS RED SOMETIMES
draw_sprite_stretched_ext(bgSkyNEW,_SKY_COLOR,0,0,GUI_W,GUI_H,c_white,1);


// SHOW SPLASH MESSAGE
//scribble(_SPLASH).draw(x,y);
draw_text_outline(x, y, _SPLASH, c_white, c_black, 480);