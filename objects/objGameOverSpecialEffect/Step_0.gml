/// @description INCREMENT TIMER
ANIM_TIMER++;
TIME = min(1, ANIM_TIMER / ANIM_MAX_TIMER);
image_angle = 0 + (12 * sin(TIME * TAU));
image_xscale = lerp(0.1, 1, TIME);
image_yscale = lerp(0.1, 1, TIME);
image_alpha = lerp(0.5, 1, TIME) 