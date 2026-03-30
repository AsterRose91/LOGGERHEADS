#region PUZZLE LEVEL MOVEMENT

///@func isValidMove(xx,yy)
///@desc returns true if you can move to (x + xx, y + yy)
///@arg {real} xx amount you move horizontally
///@arg {real} yy amount you move vertically
///@returns {bool} 
function isValidMove(xx, yy) {
	// DIAGONALS AREN'T ALLOWED
	if (xx != 0 && yy != 0) {return false;}
	
	// PREVENT MOVING OUT OF ROOM BOUNDS
	if (!isWithinBounds(x + xx, y + yy)) {return false;}
	
	// PREVENT MOVEMENT IF YOU'D COLLIDE WITH objBlock OR objLog
	if (isMoveCollision(x + xx, y + yy)) { return false; }
	
	// ARE YOU MOVING TO A POSITION WITH NO FLOOR BELOW IT
	if (isFloorBelow(x + xx, y + yy)) { return true; }
	else {
		// THIS IS ALLOWED IF YOU'RE "CLIMBING"
		if (isLogAdjacent(x + xx, y + yy)) {return true;}
		else {return false;}
	}
	// return false; // GAME MAKER THINKS THIS IS "UNREACHABLE". WE'LL SEE ABOUT THAT
}

///@func isValidPosition(xx,yy)
///@desc returns true if you can move to (xx, yy)
///@arg {real} xx the x-coordinate being checked
///@arg {real} yy the y-coordinate being checked
function isValidPosition(xx, yy) {
	
	// PREVENT MOVING OUT OF ROOM BOUNDS
	if (!isWithinBounds(xx, yy)) {return false;}
	
	// PREVENT MOVEMENT IF YOU'D COLLIDE WITH objBlock OR objLog
	if (isMoveCollision(xx, yy)) { return false; }
	
	// ARE YOU MOVING TO A POSITION WITH NO FLOOR BELOW IT
	if (isFloorBelow(xx, yy)) { return true; }
	else {
		// THIS IS ALLOWED IF YOU'RE "CLIMBING"
		if (isLogAdjacent(xx, yy)) {return true;}
		else {return false;}
	}
	
	// return false; // GAME MAKER THINKS THIS IS "UNREACHABLE". WE'LL SEE ABOUT THAT
}

///@func movementIndicators()
///@desc shows movement (and action) indicators 
function movementIndicators() {
	CAN_MOVE_UP = isValidMove(0, -T);
	CAN_MOVE_DOWN = isValidMove(0, T);
	CAN_MOVE_LEFT = isValidMove(-T, 0);
	CAN_MOVE_RIGHT = isValidMove(T, 0);
	
	#region FRIENDS! :)
	CAN_INTERACT_PAL = false;
	var FRIEND = instance_place(x + (T * FACING), y, objFriend);
	if (FRIEND != noone) {
		CAN_INTERACT_PAL= true;
	}
	#endregion
	
	#region DOORS
	CAN_INTERACT_DOOR = false;
	var DOOR = instance_place(x, y, objDoor);
	if (DOOR != noone) {
		if (DOOR.ENABLED) {
			CAN_INTERACT_DOOR = true;
		}
	}
	#endregion
	
}

///@func moveTo(xx, yy)
///@desc set Player objects to move to (x+xx,y+yy)
///@arg {real} xx
///@arg {real} yy
function moveTo(xx, yy) {
	DEST_X = x + xx;
	DEST_Y = y + yy;
	STATE = CHARACTER_STATES.MOVING;
}

///@func isWithinBounds(x,y)
///@desc returns true if the position x,y is within bounds
///@arg {real} x
///@arg {real} y
function isWithinBounds(x, y) {
	return ( (x >= 0 && x < room_width) && ( y >=0  && y < room_height) );
}

///@func isMoveCollision(x,y)
///@desc returns true if xx and yy point to an inaccessible location
///@arg {real} x
///@arg {real} y
///@returns {bool}
function isMoveCollision(x, y) {
	// NOT SURE WHY THIS IS HERE, BUT MAYBE I'LL KEEP IT FOR NOW?
	// if ( !isWithinBounds(x, y) ) {return true;}
	
	if (place_meeting(x, y, objBlock)) {return true;}
	
	if (place_meeting(x, y, objLog)) {return true;}
	
	return false;
}

///@func playerWillFall()
///@desc returns true if the player will fall down
///@returns {bool}
function playerWillFall() {
	return !isFloorBelow(x,y) && !isLogAdjacent(x,y);
}

///@func isLogAdjacent(x,y)
///@desc returns true if there's an objLog or objStump adjacent to the player
///@arg {real} x
///@arg {real} y
///@returns {bool}
function isLogAdjacent(x, y) {
	
	return place_meeting(x + T, y, objLog) 
	|| place_meeting(x - T, y, objLog) 
	|| place_meeting(x + T, y + T, objLog) 
	|| place_meeting(x - T, y + T, objLog) 
	|| place_meeting(x + T, y, objStump)
	|| place_meeting(x - T, y, objStump);
	
	//if (FACING = DIRECTION.RIGHT) {
	//	return place_meeting(x + T, y, objLog) 
	//	|| place_meeting(x + T, y + T, objLog) 
	//	|| place_meeting(x - T, y + T, objLog) 
	//	|| place_meeting(x + T, y, objStump);
	//}
	//if (FACING = DIRECTION.LEFT) {
	//	return place_meeting(x - T, y, objLog) 
	//	|| place_meeting(x - T, y + T, objLog) 
	//	|| place_meeting(x + T, y + T, objLog) 
	//	|| place_meeting(x - T, y, objStump);
	//}
	//return false;
}

///@func isFloorBelow(x,y)
///@desc returns true if there's a floor or a log below the player
///@arg {real} x
///@arg {real} y
///@returns {bool}
function isFloorBelow(x, y) {
	return place_meeting(x, y + T, objBlock) || place_meeting(x, y + T, objLog);
}
#endregion


#region WORLD MAP MOVEMENT


///@func tileCollision(_x, _y, _layer)
///@desc replacing object based collision on the world map with tile-based collision
///@arg {real} _x
///@arg {real} _y
///@arg {Asset.GMLayer | String} _layer
///@returns {bool}
function tileCollision(_x, _y, _layer) {
	var map = layer_tilemap_get_id(_layer);
	if (place_meeting(_x, _y, map)) {
		return true;	
	}
	return false;
}

///@func worldmap_move_x(_id, _layer, _xx)
///@desc function for controlling horizontal movement on the world maps/level hubs
///@arg {ID.Instance} _id
///@arg {Asset.GMLayer|String} _layer
///@arg {real} _xx
///@returns {bool}
function worldmap_move_x(_id, _layer, _xx) {
	var x_collide, x_tilecollide;
	
	with (_id) {
		repeat( abs(floor(_xx)) ) {
			// TILE COLLISION
			x_tilecollide = tileCollision(x + sign(_xx), y, "Collision");
			if (x_tilecollide) {return false;}
	
			// INSTANCE COLLISION
			x_collide = instance_place(x + sign(_xx), y, objSolid);
			if (x_collide != noone) {
				if (object_get_parent(x_collide.object_index)  == objGatePar) {
					if (!x_collide.DISABLED) {
						if (!x_collide.ALL_DONE) {return false;}
					}
				} else {return false;}
			}
	
			// AVOID GOING OUT OF BOUNDS
			if (_xx < 0 && bbox_left + sign(_xx) < 0) {return false;}
			if (_xx > 0 && bbox_right + sign(_xx) > room_width) {return false;}
			x += sign(_xx);
		}
		// SUCCESFULLY MOVED
		return true;
	}
}

///@func worldmap_move_y(_id, _layer, _yy)
///@desc function for controlling vertical movement on the world maps/level hubs
///@arg {ID.Instance} _id
///@arg {Asset.GMLayer | String} _layer
///@arg {real} _yy
///@returns {bool}
function worldmap_move_y(_id, _layer, _yy) {
	var y_collide, y_tilecollide;
	
	with (_id) {
		repeat( abs(floor(_yy)) ) {
			// TILE COLLISION
			y_tilecollide = tileCollision(x, y + sign(_yy), "Collision");
			if (y_tilecollide) {return false;}
	
			// INSTANCE COLLISION
			y_collide = instance_place(x , y + sign(_yy), objSolid);
			if (y_collide != noone) {
				if (object_get_parent(y_collide.object_index)  == objGatePar) {
					if (!y_collide.DISABLED) {
						if (!y_collide.ALL_DONE) {return false;}
					}
				} else {return false;}
			}
	
			// AVOID GOING OUT OF BOUNDS
			if (_yy < 0 && bbox_top + sign(_yy) < 0) {_yy = 0; break;}
			if (_yy > 0 && bbox_bottom + sign(_yy) > room_height) {_yy = 0; break;}
			y += sign(_yy);
		}
		// SUCCESFULLY MOVED
		return true;
	}
}

#endregion