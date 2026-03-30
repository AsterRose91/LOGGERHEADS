/// @description CODE STUFF
if (!enabled) {
	// PAUSE GAME
	//if (keyboard_check_pressed_arr(kPAUSE)) { enabled = true; }
	if (input_check_pressed("PAUSE")) {enabled = true;}
	exit;
}

// Next time, maybe try not to be so clever
// or MAYBE, tie the actions to the buttons
else {
	// UNPAUSE GAME
	// if (keyboard_check_pressed_arr(kPAUSE)) { enabled = false; }	
	if (input_check_pressed("PAUSE")) {enabled = false;}
}