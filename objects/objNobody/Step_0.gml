/// @description Insert description here
if (ANIM_TIMER < 0) {instance_destroy(self);}

ANIM_TIMER--;
image_alpha = remap(ANIM_TIMER, GAMESPEED * 2, 0, 1, 0);