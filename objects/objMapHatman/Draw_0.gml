/// @description DRAW SPRITE AND SHADOW
if (!ENABLED) {exit;}
draw_sprite_ext(sprLevelSelectMap_SHADOW,0,floor(x), floor(y) + 1, 1, 1, 0, c_white, image_alpha / 2);
draw_sprite_ext(sprite_index,image_index,floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);