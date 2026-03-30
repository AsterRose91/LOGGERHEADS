var _x, _i;
// X OFFSET, SCALE
_x = (FACING == DIRECTION.LEFT) ? T : 0;
_i = FACING;


if (STATE == CHARACTER_STATES.NONE) {
	
	if (MOVEMENT_HINTS) {
			var _directions = [ 
				{_x: T, _y: 0}, 
				{_x: 0, _y: -T}, 
				{_x: -T, _y: 0}, 
				{_x: 0, _y: T}
			];
			
			array_foreach(
				_directions,
				function(e) {
					draw_sprite(sprCheckNEW, isValidMove(e._x, e._y), x + e._x, y + e._y);
				}
			);
	}
	
	if (GO_LEFT || GO_RIGHT) {
		if (sprite_index != sprBobbie_walk) {
			sprite_index = sprBobbie_walk;
			image_index = 0;
			image_speed = 0.5;
		}
	} else { 
		sprite_index = sprBobbie_stand; 
		image_speed = 0;
	}
	
	// INTERACTION WITH PALS
	if (CAN_INTERACT_PAL) {draw_sprite(sprCrosshairNEW, 6, x, y - T);} 	
	// INTERACTION WITH DOORS
	else if (CAN_INTERACT_DOOR) {draw_sprite(sprCrosshairNEW, 5, x, y - T);} 
	else {
		// CLIMBING	
		if (CAN_MOVE_UP)	{draw_sprite(sprCrosshairNEW, 2, x, y - T);}
		if (CAN_MOVE_DOWN)	{draw_sprite(sprCrosshairNEW, 4, x, y + T);}
	}
	
	draw_sprite_ext(sprite_index, 0, floor(x + _x), floor(y), _i, 1, 0, c_white, 1);
	
	// NO CROSSHAIR WHEN MEETING YOUR FRIENDS
	if (!atFriendsHouse(room)) {
		draw_sprite(sprCrosshairNEW, 0,x + (T * FACING), y );
	}
}

if (STATE == CHARACTER_STATES.MOVING){
	if (sprite_index != sprBobbie_walk) {
		sprite_index = sprBobbie_walk;
		image_index = 0;
		image_speed = 0.5;
	}
	draw_sprite_ext(sprite_index, image_index, floor(x+_x), floor(y), _i, 1, 0, c_white, 1);
	
	if (!atFriendsHouse(room)) {
		draw_sprite(sprCrosshairNEW, 0, x + (T * FACING), y );
	}
}

if (STATE == CHARACTER_STATES.OOPS) {
	// CRUSHED
	if (OOPSY_WOOPSY == OOPSY_TYPES.CRUSHED) {sprite_index = sprBobbie_crush;}
	// EXPLODED
	if (OOPSY_WOOPSY == OOPSY_TYPES.BURNT) {sprite_index = sprBobbie_burnt;}
	if (OOPSY_WOOPSY == OOPSY_TYPES.CRUSHED_2) {sprite_index = sprBobbie_crushvert;}
	if (OOPSY_WOOPSY == OOPSY_TYPES.CHOPPED) {sprite_index = sprBobbie_kill; image_index = 1;}
	draw_self_pixel();
}