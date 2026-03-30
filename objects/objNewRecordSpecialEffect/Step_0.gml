/// @description INCREMENT TIMER
ANIM_TIMER++;
TIME = clamp(ANIM_TIMER / ANIM_MAX_TIMER, 0, 1);
y = lerp(ystart, yend, TIME);
image_alpha = lerp(0.5, 1, TIME) 