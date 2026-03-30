//Player inputs

///@deprecated
///@func keyboard_check_arr(array)
///@desc takes an array of different keys/buttons, returns keyboard_check() for them
function keyboard_check_arr(e) {
	return array_any(
		e, 
		function(k) {return keyboard_check(k);}
	);
}

///@deprecated
///@func keyboard_check_pressed_arr(array)
///@desc takes an array of different keys/buttons, returns keyboard_check_pressed() for them
function keyboard_check_pressed_arr(e) {
	return array_any(
		e, 
		function(k) {return keyboard_check_pressed(k);}
	);
}

/// JESUS WEPT
///@func playerInputVars()
function playerInputVars() {

		GO_LEFT = false;
		GO_LEFT_PRESS = false;
		GO_RIGHT = false;
		GO_RIGHT_PRESS = false;
		GO_UP = false;
		GO_UP_PRESS = false;
		GO_DOWN = false;
		GO_DOWN_PRESS = false;
		CHOP_LOG = false;
		TURN_AROUND = false;
		return;
	
}

//@func playerInputFunction([allow both axes])
//@desc Maps keyboard checks to variables. Now with Input 6.1
function playerInputFunction(doBothAxis = false) {

		/// Uses Input 6.1
		if (!doBothAxis){
		GO_LEFT = input_check("LEFT") && !input_check("RIGHT") && !input_check("UP") && !input_check("DOWN");
		GO_LEFT_PRESS = input_check_pressed("LEFT") && !input_check_pressed("RIGHT") && !input_check_pressed("UP") && !input_check_pressed("DOWN");
		
		GO_RIGHT = !input_check("LEFT") && input_check("RIGHT") && !input_check("UP") && !input_check("DOWN");
		GO_RIGHT_PRESS = !input_check_pressed("LEFT") && input_check_pressed("RIGHT") && !input_check_pressed("UP") && !input_check_pressed("DOWN");
		
		GO_UP = !input_check("LEFT") && !input_check("RIGHT") && input_check("UP") && !input_check("DOWN");
		GO_UP_PRESS = !input_check_pressed("LEFT") && !input_check_pressed("RIGHT") && input_check_pressed("UP") && !input_check_pressed("DOWN");
		
		GO_DOWN = !input_check("LEFT") && !input_check("RIGHT") && !input_check("UP") && input_check("DOWN");
		GO_DOWN_PRESS = !input_check_pressed("LEFT") && !input_check_pressed("RIGHT") && !input_check_pressed("UP") && input_check_pressed("DOWN");
	}
	else {
		GO_LEFT = input_check("LEFT") && !input_check("RIGHT"); 
		GO_LEFT_PRESS = input_check_pressed("LEFT") && !input_check_pressed("RIGHT"); 
		
		GO_RIGHT = !input_check("LEFT") && input_check("RIGHT");
		GO_RIGHT_PRESS = !input_check_pressed("LEFT") && input_check_pressed("RIGHT"); 
		
		GO_UP = input_check("UP") && !input_check("DOWN"); 
		GO_UP_PRESS = input_check_pressed("UP") && !input_check_pressed("DOWN");
		
		GO_DOWN = !input_check("UP") && input_check("DOWN"); 
		GO_DOWN_PRESS = !input_check_pressed("UP") && input_check_pressed("DOWN");
	}
	
	CHOP_LOG = input_check_pressed("CHOP");
	TURN_AROUND = input_check_pressed("TURN");
	OPEN_JOURNAL =  input_check_pressed("JOURNAL");
	

	// enable and disable debug/testing features?
	if (input_check_pressed("DEBUG")) {TESTING ^= true;}
	
}

