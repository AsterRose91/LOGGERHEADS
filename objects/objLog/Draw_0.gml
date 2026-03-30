/// @description REWRITTEN LOG DRAWING SCRIPT
// timer for special effects/particles
ANIM_TIMER = (ANIM_TIMER + 1) mod 32;


switch (BLOCKTYPE) {
	
	case LOG_COLORS.NONE: {
		#region NORMAL LOGS
		draw_self_pixel(); 
		switch (BLOCKSTATE) {
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogNEW) {sprite_index = sprLogNEW;}
				break;
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, MOTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.RED: {
		#region RED LOGS
		draw_self_pixel(); 
		switch (BLOCKSTATE) {
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogRedNEW) {sprite_index = sprLogRedNEW;}
				break;
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, REDMOTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
		
	case LOG_COLORS.BLUE: {
		#region BLUE LOGS
		draw_self_pixel(); 
		switch (BLOCKSTATE) {
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogBlueNEW) {sprite_index = sprLogBlueNEW;}
				break;
			}		
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, BLUEMOTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.GREEN: 
	case LOG_COLORS.ROTTEN: {
		#region SMELLY LOGS
		draw_self_pixel(); 
		if (ANIM_TIMER mod 20 == 0) {
			if (PARTICLES_ENABLED) {part_particles_create(PARTICLE_MAN, MID_X, MID_Y, TOX_PART, 1);}
		}
		switch (BLOCKSTATE) {
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogGreenNEW) {sprite_index = sprLogGreenNEW;}
				break;			
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, GREENMOTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.POTION: {
		#region SMELLY LOGS
		draw_self_pixel(); 
		if (ANIM_TIMER mod 20 == 0) {
			if (PARTICLES_ENABLED) {part_particles_create(PARTICLE_MAN, MID_X, MID_Y, TOX_PART, 1);}
		}
		switch (BLOCKSTATE) {
			case LOG_STATES.NONE: {
				if (sprite_index != sprPotion) {sprite_index = sprPotion; image_speed = 0.5;}
				break;			
			}
			case LOG_STATES.CHOPPED: {
				if (sprite_index != sprPotion) {sprite_index = sprPotion; image_speed = 0.5;}
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, POTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.HEAVY: {
		#region HEAVY IRON LOGS
		draw_self_pixel(); 
		switch (BLOCKSTATE) {
			default:
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogIronNEW) {sprite_index = sprLogIronNEW;}
				break;
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, MOTIONTRAIL, 1);}
				}
				break;
			}	
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.ALIEN: {
		#region ALIEN LOG
		draw_self_pixel();
		gpu_set_blendmode(bm_add);
		if (ANIM_TIMER < 6) {
			draw_sprite_ext(sprLogRedNEW, 0, floor(x - ANIM_TIMER), floor(y + T), 1, -1, 0, c_white, 0.5);
			draw_sprite_ext(sprLogBlueNEW, 0, floor(x + ANIM_TIMER), floor(y + T), 1, -1, 0, c_white, 0.5);
		} 
		gpu_set_blendmode(bm_normal);		
		switch (BLOCKSTATE) {
			default:
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogAlienNEW) {sprite_index = sprLogAlienNEW;}
				break;
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, MOTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}		
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.MAGIC: {
		#region magic log
		draw_self_pixel();
		//maybe draw sparkles on occasion
		if (ANIM_TIMER mod 6 == 0) {
			if (PARTICLES_ENABLED) {part_particles_create(PARTICLE_MAN, MID_X, MID_Y, GLITTER, 1);}
		}
		switch (BLOCKSTATE) {
			default:
			case LOG_STATES.NONE: {
				if (sprite_index != sprLogMagicNEW) {sprite_index = sprLogMagicNEW; }
				break;
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, MOTIONTRAIL, 1);}
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.BOMB: {
		#region Bomb sprite
		draw_self_pixel();
		switch (BLOCKSTATE) {
			default:
			case LOG_STATES.NONE: {
				if (PARTICLES_ENABLED){
					part_particles_create(PARTICLE_MAN, MID_X + 7, bbox_top + 4, FUSE_SPARKS, 3); 
				}
				if (sprite_index != sprBombNEW) {
					sprite_index = sprBombNEW;
					image_index = 0;
					image_speed = 0.5;
				}
				break;
			}
			case LOG_STATES.CHOPPED: {
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, BOMBTRAIL, 1);}
				}
				if (sprite_index != sprBombNEW) {
					sprite_index = sprBombNEW;
					image_index = 0;
					image_speed = 0.5;
				}
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprBombExplodeNEW) {
					sprite_index = sprBombExplodeNEW;
					image_index = 0;
					image_speed = 1;
				}
				break;
			}	
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.NUKE: {
		#region Nuke sprite
		draw_self_pixel();
		switch (BLOCKSTATE) {
			default:
			case LOG_STATES.NONE: {
				if (sprite_index != sprNuke) {
					sprite_index = sprNuke;
					image_speed = 0;
				}
				image_index = clamp(EXPLODE_COUNTER, 0, 9);
				break;
			}
				
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprNukeExplode) {
					sprite_index = sprNukeExplode;
					image_index = 0;
					image_speed = 1;
				}
				break;
			}
				
			case LOG_STATES.CHOPPED: {
				if (sprite_index != sprNuke) {
					sprite_index = sprNuke;
					image_speed = 0;
				}
				image_index = clamp(EXPLODE_COUNTER, 0, 9);
				if (ANIM_TIMER mod 5 == 0) {
					if (PARTICLES_ENABLED) {part_particles_create(MOTION_TRAILS_SYSTEM, x, y, MOTIONTRAIL, 1);}
				}
				break;
			}	
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.HORIZONTAL: {
		#region Long blocks
		switch (BLOCKSTATE) {
			default: {
				//draw_sprite_stretched(sprLog_SidewaysNEW, 0, floor(x), floor(y), image_xscale * T, T);
				draw_sprite_stretched(sprLog_SidewaysNEW, 0, floor(x), floor(y), sprite_width, sprite_height);
				break;
			}
			case LOG_STATES.KABOOM: {
				if (sprite_index != sprExplosionNEW){
					sprite_index = sprExplosionNEW;
					image_index = 0;
					image_speed = 1;
				}
				draw_sprite_stretched(sprExplosionNEW,image_index,floor(x),floor(y), sprite_width, sprite_height);
				break;		
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.STATIONARY: {
		#region Long OR tall
		switch (BLOCKSTATE) {
			default: {
				//if (image_xscale > image_yscale) {
				if (sprite_width > sprite_height) {
					//draw_sprite_stretched(sprLogStationary_SidewaysNEW,0,floor(x),floor(y),image_xscale * T, T);
					draw_sprite_stretched(sprLogStationary_SidewaysNEW,0,floor(x),floor(y),sprite_width, sprite_height);
				} else {
					//draw_sprite_stretched(sprLogStationaryNEW,0,floor(x),floor(y),T,image_yscale * T);
					draw_sprite_stretched(sprLogStationaryNEW,0,floor(x),floor(y),sprite_width, sprite_height);
				}
				break;
			}
		}
		#endregion
		break;
	}
	
	case LOG_COLORS.MAGNET: {
		#region Magnet sprite
		draw_self_pixel();
		switch (BLOCKSTATE) {
			default: {
				if (sprite_index != sprMagnetNEW) {sprite_index = sprMagnetNEW;}
				if (!MAGNET_ACTIVE) {image_speed =  0;} else {image_speed =  0.5;}
				break;
			}
		}
		#endregion
		break;
	}
	
}