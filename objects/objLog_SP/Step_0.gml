///@description LOGIC FOR SINGLE PLAYER MODE LOGS IS DIFFERENT
if (isDialogBoxRunning()) {exit;}
if (TransitionEffectActive()) {exit;}


var ISHORILOG = (BLOCKTYPE == LOG_COLORS.HORIZONTAL), crush_target, crush_player;


switch (BLOCKSTATE) {
	
	default:
	case LOG_STATES.NONE:
		#region LOG_STATES.NONE	
		// ADHERE TO GRID
		if (LOG_ADHERE_GRID) { move_snap(T, T); }		
		
		switch (BLOCKTYPE) {
			default:			
				// SOME LOGS ARE AFFECTED BY GRAVITY
				if (willLogFall(x, y, ISHORILOG)) {
					WaitTimerIncrement();
					BLOCKSTATE = LOG_STATES.FALLING;	
					break;
				}		
				break;
				
			case LOG_COLORS.HEAVY:
				// HEAVY/IRON LOGS IMMEDIATELY DESTROY ROTTED LOGS.
				var LOGBELOW = instance_place(x, y + 1, objLog_SP);
				var SHATTER = false;
				with (LOGBELOW) {
					if (BLOCKTYPE == LOG_COLORS.GREEN || BLOCKTYPE == LOG_COLORS.ROTTEN) {
						SHATTER = true;
						BLOCKSTATE = LOG_STATES.CRUSHED;
					}
				}
				if (SHATTER) {
					WaitTimerIncrement();
					BLOCKSTATE = LOG_STATES.FALLING_CRUSH;
					break;
				}
			
				// SPECIAL STATE
				if  (willLogFall(x, y, ISHORILOG)) {
					WaitTimerIncrement();
					BLOCKSTATE = LOG_STATES.FALLING_CRUSH;
					break;
				}
				break;
				
			case LOG_COLORS.ALIEN:
				// ALIEN LOGS HAVE INVERTED GRAVITY
				if (willLogRise(x,y)) { WaitTimerIncrement(); BLOCKSTATE = LOG_STATES.ASCEND; }
				break;
			
			case LOG_COLORS.STATIONARY:
				// STATIONARY LOGS HAVE NO GRAVITY OR MOVEMENT
				break;
				
			case LOG_COLORS.MAGNET:
				// WHAT IF I WERE TO HAVE IT DO MAGNETISM EVERY STEP?
				event_perform(ev_other, ev_user0);
				break;
				
		}
		
		break;
		#endregion
	
	case LOG_STATES.CHOPPED:
		#region LOG_STATES.CHOPPED
		// horizontal logs can NOT be choppped, ever.
		// neither can heavy logs
		// they either have to be felled, or exploded
		// rotten logs shatter instantly
		var TUPLE, _MOVEX, _MOVEY;
		switch BLOCKTYPE {
			case LOG_COLORS.ROTTEN:
			case LOG_COLORS.GREEN:
				BLOCKSTATE = LOG_STATES.CRUSHED;
				break;
			
			case LOG_COLORS.HEAVY:
				play_sfx(sfxIronHit);
				BLOCKSTATE = LOG_STATES.NONE;
				break;
			case LOG_COLORS.HORIZONTAL:
			case LOG_COLORS.MAGIC:
				part_particles_create(PARTICLE_MAN,MID_X,MID_Y,GLITTER,6);
				BLOCKSTATE = LOG_STATES.NONE;
				break
			
			case LOG_COLORS.STATIONARY:
				BLOCKSTATE = LOG_STATES.NONE;
				break;
			
			case LOG_COLORS.MAGNET:
				MAGNET_ACTIVE ^= true; 
				BLOCKSTATE = LOG_STATES.NONE;
				break;
				
			case LOG_COLORS.NONE:
			case LOG_COLORS.RED:
			case LOG_COLORS.BLUE:
			case LOG_COLORS.POTION:
			case LOG_COLORS.ALIEN:
			default:		
				repeat(abs(MOVEMENT_SPEEDSETTING)) {
					// GET MOVEMENT DIRECTION
					TUPLE = GetLogsMovementDirection(DIR);
					_MOVEX = TUPLE.x;
					_MOVEY = TUPLE.y;
					
					// MOVEMENT
					x += _MOVEX;
					y += _MOVEY;
					
					#region CHANGE DIRECTION UPON ENCOUNTERING THE ARROW
					var _directionChanger = instance_place(x, y, objLogRedirectArrow);
					if (x mod T == 0 && y mod T == 0) {
						if (_directionChanger != noone) {
							var _angleOfChanger = _directionChanger.image_angle;
							_angleOfChanger = _angleOfChanger div 90; // returns 0, 1, 2, 3
							switch (_angleOfChanger) {
								default:
								case 0:
									DIR = DIRECTION.RIGHT; break;
								case 1:
									DIR = DIRECTION.UP; break;
								case 2:
									DIR = DIRECTION.LEFT; break;
								case 3:
									DIR = DIRECTION.DOWN; break;
							}
						}
					}
					#endregion
					
					#region COLLISIONS WITH SOLID LOGS
					var collision = instance_place(x + _MOVEX, y + _MOVEY, objLog);
					if (collision != noone) {	
						if (BLOCKTYPE == LOG_COLORS.BOMB || BLOCKTYPE == LOG_COLORS.NUKE) { 
							// BOMBS EXPLODE ON COLLISION WITH OTHER BLOCKS WHEN SENT FLYING
							EXPLODE_COUNTER--;
							if (EXPLODE_COUNTER == 0) {
								BLOCKSTATE = LOG_STATES.KABOOM; 
							}
							break;
						}
						
						// INTERACT WITH OTHER BLOCKS
						with (collision) {
							if (other.BLOCKTYPE == LOG_COLORS.POTION && isRottable(BLOCKTYPE)) {
								BLOCKTYPE = LOG_COLORS.ROTTEN;
								play_sfx(sfxToxic);
								part_particles_create(PARTICLE_MAN,MID_X,MID_Y,TOX_PART,6);
								break;
							}
								
							if (BLOCKTYPE == other.BLOCKTYPE || BLOCKTYPE == LOG_COLORS.NONE || BLOCKTYPE == LOG_COLORS.ALIEN) {
								DIR = other.DIR;
								BLOCKSTATE = LOG_STATES.CHOPPED;
								break;
							}
								
							if (BLOCKTYPE== LOG_COLORS.BOMB){
								// Not sure if bombs should explode when hit by flying blocks or be knocked around
								part_particles_create(PARTICLE_MAN,MID_X,MID_Y,KABOOM_PART,8);
								play_sfx(sfxKablooey);
								BLOCKSTATE = LOG_STATES.KABOOM; 
								break;
							}
								
							if (BLOCKTYPE== LOG_COLORS.NUKE){
								// Not sure if bombs should explode when hit by flying blocks or be knocked around
								part_particles_create(PARTICLE_MAN,MID_X,MID_Y,KABOOM_PART,8);
								EXPLODE_COUNTER--;
								if (EXPLODE_COUNTER == 0){
									play_sfx(sfxKablooey);
									BLOCKSTATE = LOG_STATES.KABOOM; 
								}
								break;
							}
								
							if (BLOCKTYPE == LOG_COLORS.ROTTEN || BLOCKTYPE == LOG_COLORS.GREEN) {
								BLOCKSTATE = LOG_STATES.CRUSHED;
								break;
							}
							// MAGIC LOGS CAN BE CONVERTED TO A DIFFERENT COLOR
							if (BLOCKTYPE == LOG_COLORS.MAGIC 
							&& (other.BLOCKTYPE == LOG_COLORS.RED || other.BLOCKTYPE == LOG_COLORS.BLUE || other.BLOCKTYPE == LOG_COLORS.ALIEN)) {
								BLOCKTYPE = other.BLOCKTYPE;
								play_sfx(sfxMagic);
								part_particles_create(PARTICLE_MAN,MID_X,MID_Y,GLITTER,12);
								break;
							}
						
						}
						// SOUND EFFECT
						play_sfx(sfxThud);

						if (BLOCKTYPE == LOG_COLORS.ALIEN) { 
							// FALL UP
							BLOCKSTATE = LOG_STATES.ASCEND; 
						} else {							
							// FALL DOWN
							BLOCKSTATE = LOG_STATES.FALLING;
						}
						
						break;
					}
					#endregion
				}
				break;
		}
	
		break;
		#endregion
	
	case LOG_STATES.FALLING_CRUSH:
		#region LOG_STATES.FALLING_CRUSH
		// FALL DOWN AND CRUSH A THING

		YY = approach(YY, MOVEMENT_SPEEDSETTING, 1);
		repeat(YY) { 
			crush_player = instance_place(x, y, objPlayer_SP);
			crush_target = instance_place(x, y + 1, objLog);
			if (willLogFall(x, y)) { y++; }
			else {
				if (crush_target != noone) {
					with (crush_target) {
						if (BLOCKTYPE != LOG_COLORS.MAGIC) {
							BLOCKSTATE = LOG_STATES.CRUSHED;
						}
					}
				}
				
				// splat!
				if (crush_player != noone) {
					with (crush_player) {
						if (STATE != CHARACTER_STATES.OOPS) {
							play_sfx(sfxSplat);
							OOPSY_WOOPSY = 0;
							STATE = CHARACTER_STATES.OOPS;
						}
					}
				}
			
				YY = 0;
				BLOCKSTATE = LOG_STATES.FALLING; 
				break; 
			}
		}
		break;
		#endregion
	
	case LOG_STATES.FALLING:
		#region LOG_STATES.FALLING
		// fall down
		// but what if you stop?
		crush_player = instance_place(x, y, objPlayer_SP);
		// if (YY < MOVE_SPEED) {YY++;}
		if (YY < MOVEMENT_SPEEDSETTING) {YY++;}
		repeat(YY) { 
			if (willLogFall(x, y, ISHORILOG)) { y++; }
			else {				
				
				if (crush_player != noone) {
					with (crush_player) {
						if (STATE != CHARACTER_STATES.OOPS) {
							play_sfx(sfxSplat);
							OOPSY_WOOPSY = 0;
							STATE = CHARACTER_STATES.OOPS;
						}
					}
				}
				
				
				YY = 0;
				if (BLOCKTYPE == LOG_COLORS.ROTTEN || BLOCKTYPE == LOG_COLORS.GREEN) {
					BLOCKSTATE = LOG_STATES.CRUSHED;
					 
					break;
				} else {
					play_sfx(sfxThud);
					if (BLOCKTYPE == LOG_COLORS.NUKE) {
						EXPLODE_COUNTER--;
						if (EXPLODE_COUNTER	== 0) {
							BLOCKSTATE = LOG_STATES.KABOOM;
							break;
						}
					}
					
					BLOCKSTATE = LOG_STATES.NONE; 
					break;
				}
			}
		}
		break;
		#endregion
		
	case LOG_STATES.ASCEND:
		#region LOG_STATES.ASCEND
		// fall down
		// but what if you stop?
		//if (YY > -MOVE_SPEED) {YY--;}
		if (YY > -MOVEMENT_SPEEDSETTING) {YY--;}
		repeat(abs(YY)) { 
			if (willLogRise(x, y)) { y--; }
			else {				
				YY = 0;
				WaitTimerDecrement();
				BLOCKSTATE = LOG_STATES.NONE; 
				break;
			}
		}
		break;
		#endregion
		
	case LOG_STATES.CRUSHED:
		#region LOG_STATES.CRUSHED
		
		// BOOM!
		if (BLOCKTYPE == LOG_COLORS.BOMB) {
			BLOCKSTATE = LOG_STATES.KABOOM;
			break;
		}
		
		
		// crushed
		if (BLOCKTYPE == LOG_COLORS.ROTTEN){
			part_particles_create(PARTICLE_MAN,MID_X,MID_Y,ROTTEN_SPLINTERS,8);
		} else {
			part_particles_create(PARTICLE_MAN,MID_X,MID_Y,SPLINTERS,8);
		}
		play_sfx(sfxShatter);
		with (self) {instance_destroy();}
		break;
		#endregion
		
	case LOG_STATES.MAGNET_PULL:
		#region LOG_STATES.MAGNET_PULL
		repeat (abs(MOVEMENT_SPEEDSETTING)) {
			#region COLLISIONS
			crush_target = instance_place(x + DIR, y, objLog);
			var stop_movement = false;
			crush_player = instance_place(x + DIR, y, objPlayer_SP);
			if (crush_target != noone) {	
				with (crush_target) {
					if (isMagnetDestroyable(BLOCKTYPE)) { BLOCKSTATE = LOG_STATES.CRUSHED; }	
					if (BLOCKTYPE == LOG_COLORS.STATIONARY) {stop_movement = true;} // stops movement
				}
			} 
			if (crush_player != noone) {
				with (crush_player) {
					if (STATE != CHARACTER_STATES.OOPS) {
						OOPSY_WOOPSY = 2;
						STATE = CHARACTER_STATES.OOPS;
					}
				}
			}
			x += stop_movement? 0 : DIR;
			#endregion
		}
		break;
		#endregion
	
	case LOG_STATES.KABOOM:
		#region LOG_STATES.KABOOM
		move_snap(T, T);
		
		// explosion animation		
		if (sprite_index == sprExplosionNEW && image_index == image_number - 1) { 
			instance_destroy(self); 
		}

		// DESTROY ADJACTENT LOGS
		if (BLOCKTYPE == LOG_COLORS.NUKE || BLOCKTYPE == LOG_COLORS.BOMB) {			

			var	bomb_locations = [ 
				new Point(x + T, y),
				new Point(x, y - T),
				new Point(x - T, y),
				new Point(x, y + T),
			];
		
			var _isNukeBooms = (BLOCKTYPE == LOG_COLORS.NUKE);
		
			// BIGGER BLAST RADIUS
			if (_isNukeBooms) {
				array_push(bomb_locations, 
					new Point(x + T + T, y),
					new Point(x, y - T - T),
					new Point(x - T - T, y),
					new Point(x, y + T + T),
				);
			}
			// CREATE DESTRUCTION OBJECTS
			var _boom_X, _boom_Y;			
			for (var _boom = 0; _boom < array_length(bomb_locations); _boom++) {
				_boom_X = bomb_locations[_boom].x;
				_boom_Y = bomb_locations[_boom].y;
				
				var _createBoom = instance_create_layer(_boom_X, _boom_Y, layer, objBombDestruction);
				if (_isNukeBooms) {
					with (_createBoom) {sprite_index = sprNukeExplosion;}
				}
			}
			
			
			if (_isNukeBooms) {
				part_particles_create(PARTICLE_MAN,MID_X,MID_Y,BIG_KABOOM_PART,10);
			} else {
				part_particles_create(PARTICLE_MAN,MID_X,MID_Y,KABOOM_PART,8);
			}
			play_sfx(sfxKablooey); // PUT IN A NEW EXPLOSION SOUND FOR NUKES
			instance_destroy(self);
		}
		break;
		#endregion
}
