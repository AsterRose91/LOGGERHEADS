/// @description THIS IS JUST AN ANIMATION

// DON'T USE IN FRIENDS HOUSES
//if (atFriendsHouse(room)) {instance_destroy(self);};

ANIM_TIMER = 0;
ANIM_MAX_TIMER = GAMESPEED;
TIME = 0;

x = (room_width div 2) - (sprite_width div 2);
y = -sprite_height;

yend = (room_height div 2) - (sprite_height div 2);