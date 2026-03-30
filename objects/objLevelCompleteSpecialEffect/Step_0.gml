/// @description INCREMENT TIMER
ANIM_TIMER++;
TIME = min(1, ANIM_TIMER / ANIM_MAX_TIMER);
y = lerp(ystart, yend, TIME);
image_alpha = lerp(0.5, 1, TIME) 