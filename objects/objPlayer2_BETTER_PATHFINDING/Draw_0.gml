var _x, _i;
// XOFFSET, XSCALE
_x = (FACING == DIRECTION.LEFT) ? T : 0;
_i = FACING;

if (CAN_KILL && !CAN_DIE) {draw_sprite(sprCrosshairNEW, 6, x, y - T);}

switch (STATE) {
	default:
	case CHARACTER_STATES.NONE:
		sprite_index = sprBobbie2_stand;	
		// CLIMBING	
		if (CAN_MOVE_UP)	{draw_sprite(sprCrosshairNEW, 2, x, y - T);}
		if (CAN_MOVE_DOWN)	{draw_sprite(sprCrosshairNEW, 4, x, y + T);}
	
		draw_sprite_ext(sprite_index, 0, floor(x + _x), floor(y), _i, 1, 0, c_white, 1);
		draw_sprite(sprCrosshairNEW, 0,x + (T * FACING), y );
		break;
	case CHARACTER_STATES.MOVING:
		if (sprite_index != sprBobbie2_walk) {
			sprite_index = sprBobbie2_walk;
			image_speed = 1;
		}
	
		draw_sprite_ext(sprite_index, image_index, floor(x+_x), floor(y), _i, 1, 0, c_white, 1);
		draw_sprite(sprCrosshairNEW, 0, x + (T * FACING), y );
		break;
	case CHARACTER_STATES.OOPS:
		// CRUSHED
		if (OOPSY_WOOPSY == OOPSY_TYPES.CRUSHED) {sprite_index = sprChopperCrushed;}
		// EXPLODED
		if (OOPSY_WOOPSY == OOPSY_TYPES.BURNT) {sprite_index = sprBobbie_burnt;}
		// SMOOSHED
		if (OOPSY_WOOPSY == OOPSY_TYPES.CRUSHED_2) {sprite_index = sprChopperCrushedVert;}
		// CHOPPED
		if (OOPSY_WOOPSY == OOPSY_TYPES.CHOPPED) {sprite_index = sprBobbie2_kill; image_index = 1;}
		draw_sprite_ext(sprite_index, image_index, floor(x + _x), floor(y), _i, 1, 0, c_white, 1);
		break;
}
