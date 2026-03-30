/// @description PARTICLE MANAGER


// MAIN PARTICLE SYSTEM
global.particle_sys = part_system_create_layer("Instances", true);
#macro PARTICLE_MAN global.particle_sys

// MOTION TRAILS PARTICLE SYSTEM
global.motiontrails_sys = part_system_create_layer("Instances", true);
#macro MOTION_TRAILS_SYSTEM global.motiontrails_sys
// NEEDS TO BE BEHIND SPRITES OF OBJECTS
part_system_depth(MOTION_TRAILS_SYSTEM, 10);

#region NORMAL PARTICLES

#region "juice"
global.juice_particle = part_type_create();
#macro JUICE global.juice_particle
part_type_gravity(JUICE, 0.6, 270);
part_type_speed(JUICE, 9, 11, 0, 0);
part_type_shape(JUICE, pt_shape_pixel);
part_type_size(JUICE, 1, 2, 0, 1);
//part_type_color1(JUICE, c_maroon);
part_type_color_rgb(JUICE, 192, 255, 0, 12, 0, 6);
part_type_direction(JUICE,85,95,0,0);
part_type_orientation(JUICE, 0, 0, 0, 0, 0);
part_type_life(JUICE, GAMESPEED, GAMESPEED * 2);
#endregion

#region glitter!
global.magic_sparkles = part_type_create();
#macro GLITTER global.magic_sparkles
part_type_gravity(GLITTER, 0, 0);
part_type_speed(GLITTER, 2, 2.8, 0, 0);
part_type_sprite(GLITTER, sprMagicSparkles, true, false, true);
part_type_color_hsv(GLITTER, 0, 255, 128, 128, 255, 255);
part_type_direction(GLITTER, 0, 360, 0, 0);
part_type_orientation(GLITTER, 0, 0, 0, 0, 0);
part_type_life(GLITTER, GAMESPEED/4, GAMESPEED/4);
#endregion

#region wood splinters
global.wood_splinters = part_type_create();
#macro SPLINTERS global.wood_splinters
part_type_sprite(SPLINTERS, sprLogBits, true, false, true);
part_type_gravity(SPLINTERS, 0.4, 270);
part_type_speed(SPLINTERS,8, 10, 0, 0);
part_type_direction(SPLINTERS, 0, 359, 0, 0);
part_type_orientation(SPLINTERS, 0, 0, 0, 0, 0);
part_type_life(SPLINTERS, GAMESPEED, GAMESPEED*2)
#endregion

#region rotted splinters
global.rotten_wood_splinters = part_type_create();
#macro ROTTEN_SPLINTERS global.rotten_wood_splinters
part_type_sprite(ROTTEN_SPLINTERS, sprLogBits, true, false, true);
part_type_gravity(ROTTEN_SPLINTERS , 0.4, 270);
part_type_speed(ROTTEN_SPLINTERS, 8, 10, 0, 0);
part_type_color1(ROTTEN_SPLINTERS, c_green);
part_type_direction(ROTTEN_SPLINTERS , 0, 359, 0, 0);
part_type_orientation(ROTTEN_SPLINTERS , 0, 0, 0, 0, 0);
part_type_life(ROTTEN_SPLINTERS , GAMESPEED, GAMESPEED*2);
#endregion

#region explosions
global.part_kaboom = part_type_create();
#macro KABOOM_PART global.part_kaboom
part_type_gravity(KABOOM_PART, 0, 0);
part_type_speed(KABOOM_PART, 4, 8, 0, 0);
part_type_sprite(KABOOM_PART, sprExplosionParticleEffect, true, true, false);
part_type_direction(KABOOM_PART, 0, 360, 0, 0);
part_type_orientation(KABOOM_PART, 0, 0, 0, 0, 0);
part_type_life(KABOOM_PART, GAMESPEED/4, GAMESPEED/3);
#endregion

#region Nuclear explosions
global.part_big_kaboom = part_type_create();
#macro BIG_KABOOM_PART global.part_big_kaboom
part_type_gravity(BIG_KABOOM_PART, 0, 0);
part_type_speed(BIG_KABOOM_PART, 5, 10, 0, 0);
part_type_sprite(BIG_KABOOM_PART, sprNukeExplosionParticleEffect, true, true, false);
part_type_direction(BIG_KABOOM_PART, 0, 360, 0, 0);
part_type_orientation(BIG_KABOOM_PART, 0, 0, 0, 0, 0);
part_type_life(BIG_KABOOM_PART, GAMESPEED/4, GAMESPEED/3);
#endregion

#region toxic smog
global.part_tox = part_type_create();
#macro TOX_PART global.part_tox
part_type_gravity(TOX_PART, 0, 90);
part_type_speed(TOX_PART, 2, 4, 0, 0);
part_type_alpha2(TOX_PART, 1, 0);
part_type_sprite(TOX_PART, sprPoisonSmog, true, true, false);
part_type_direction(TOX_PART, 85, 95, 0, 0);
part_type_orientation(TOX_PART, 0, 0, 0, 0, 0);
part_type_life(TOX_PART, GAMESPEED/3, GAMESPEED/2);
#endregion

#region confetti
global.part_confetti = part_type_create();
#macro CONFETTI_PART global.part_confetti
part_type_orientation(CONFETTI_PART, 0, 360, 0, 45, 0);
part_type_gravity(CONFETTI_PART, 0.3, 270);
part_type_direction(CONFETTI_PART, 0, 360, 0, 30);
part_type_speed(CONFETTI_PART, 5, 6, -0.3, 0);
part_type_size(CONFETTI_PART, 0.2, 0.3, 0, 0);
part_type_life(CONFETTI_PART, 30, 60);
#endregion

#region fuse sparks
global.fuse_sparks = part_type_create();
#macro FUSE_SPARKS global.fuse_sparks
part_type_speed(FUSE_SPARKS, 6, 8, 0, 0);
part_type_shape(FUSE_SPARKS, pt_shape_pixel);
part_type_size(FUSE_SPARKS, 2, 2, 0, 0);
part_type_color_hsv(FUSE_SPARKS,5,40,255,255,255,255);
part_type_direction(FUSE_SPARKS,0,360,0,0);
part_type_orientation(FUSE_SPARKS, 0, 0, 0, 0, 0);
part_type_life(FUSE_SPARKS, 1, 3);
#endregion 

#region ??????
global.jumpscare_part = part_type_create();
#macro JUMP_FACE global.jumpscare_part
part_type_sprite(JUMP_FACE, sprJumpscare, true, true, false);
part_type_size_x(JUMP_FACE, 2, 5, 0.2, 0.5);
part_type_size_y(JUMP_FACE, 2, 5, 0.2, 0.5);
part_type_alpha2(JUMP_FACE, 1, 0);
part_type_life(JUMP_FACE, GAMESPEED, GAMESPEED);

#endregion

#endregion


#region MOTION TRAILS

#region MOTION TRAILS FOR CHOPPED LOGS
global.log_motion_trail = part_type_create();
#macro MOTIONTRAIL global.log_motion_trail
part_type_sprite(MOTIONTRAIL, sprLogParticle, true, false, true);
part_type_alpha2(MOTIONTRAIL, 1, 0);
part_type_life(MOTIONTRAIL, GAMESPEED/4, GAMESPEED/4);
#endregion

#region MOTION TRAILS FOR CHOPPED LOGS
global.log_motion_trail_red = part_type_create();
#macro REDMOTIONTRAIL global.log_motion_trail_red
part_type_sprite(REDMOTIONTRAIL, sprLogParticle, true, false, true);
part_type_alpha2(REDMOTIONTRAIL, 1, 0);
part_type_color2(REDMOTIONTRAIL, c_red, c_maroon);
part_type_life(REDMOTIONTRAIL, GAMESPEED/4, GAMESPEED/4);
#endregion

#region MOTION TRAILS FOR CHOPPED LOGS
global.log_motion_trail_blue = part_type_create();
#macro BLUEMOTIONTRAIL global.log_motion_trail_blue
part_type_sprite(BLUEMOTIONTRAIL, sprLogParticle, true, false, true);
part_type_alpha2(BLUEMOTIONTRAIL, 1, 0);
part_type_color2(BLUEMOTIONTRAIL, c_aqua, c_blue);
part_type_life(BLUEMOTIONTRAIL, GAMESPEED/4, GAMESPEED/4);
#endregion

#region MOTION TRAILS FOR CHOPPED LOGS
global.log_motion_trail_green = part_type_create();
#macro GREENMOTIONTRAIL global.log_motion_trail_green
part_type_sprite(GREENMOTIONTRAIL, sprLogParticle, true, false, true);
part_type_alpha2(GREENMOTIONTRAIL, 1, 0);
part_type_color2(GREENMOTIONTRAIL, c_lime, c_green);
part_type_life(GREENMOTIONTRAIL, GAMESPEED/4, GAMESPEED/4);
#endregion

#region MOTION TRAILS FOR POTIONS
global.potion_motion_trail = part_type_create();
#macro POTIONTRAIL global.potion_motion_trail
part_type_sprite(POTIONTRAIL, sprPotionParticle, true, false, true);
part_type_alpha2(POTIONTRAIL, 1, 0);
part_type_color2(POTIONTRAIL, c_lime, c_green);
part_type_life(POTIONTRAIL, GAMESPEED/4, GAMESPEED/4);
#endregion



#region MOTION TRAILS FOR BOMBS
global.bomb_motion_trail = part_type_create();
#macro BOMBTRAIL global.bomb_motion_trail
part_type_sprite(BOMBTRAIL, sprBombParticle, true, false, true);
part_type_color2(BOMBTRAIL, c_yellow, c_orange);
part_type_alpha2(BOMBTRAIL, 1, 0);
part_type_life(BOMBTRAIL, GAMESPEED/4, GAMESPEED/4);
#endregion


#endregion