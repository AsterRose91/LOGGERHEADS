///@func Point(_x, _y)
///@desc I should have made a generic Point struct a long time ago
///@arg {real} _x x-coordinate
///@arg {real} _y y-coordinate
function Point(_x = 0, _y= 0) constructor{
	x = _x;
	y = _y;	
}

/// @func   dec_to_hex(dec, len)
/// @desc   Returns a given value as a string of hexadecimal digits.
///         Hexadecimal strings can be padded to a minimum length.
///         Note: If the given value is negative, it will
///         be converted using its two's complement form.
/// @arg	{real}      dec			integer
/// @arg	{real}      [len]		minimum number of digits
/// @return {string}				hexadecimal digits
/// GMLscripts.com/license THANKS PIXELATEDPOPE
function dec_to_hex(dec, len = 1)
{
    var hex = "";
 
    if (dec < 0) {
        len = max(len, ceil(logn(16, 2 * abs(dec))));
    }
 
    var dig = "0123456789ABCDEF";
    while (len-- || dec) {
        hex = string_char_at(dig, (dec & $F) + 1) + hex;
        dec = dec >> 4;
    }
 
    return hex;
}



///@func approach(_initial, _final, _rate)
///@desc approach final value at a given rate
///@arg {Real} _initial
///@arg {Real} _final
///@arg {Real} _rate
///@returns {Real}
function approach(_initial, _final, _rate) { 
	if (_initial < _final) {
		return min(_initial + _rate, _final);
	}
	return max(_initial - _rate, _final);
}

///@func string_to_num_arr(_str, [_sep])
///@desc convert a comma separated string into an array of numbers
///@arg {String} _str
///@arg {String} [_sep]
///@returns {Array<Real>} 
function string_to_num_arr(_str, _sep = ",") {
	// pass string of numbers separated by commas or other separator into this function
	// split it
	var str_list = string_split(_str,_sep,true), _arr = [];
	
	_arr = array_map(str_list, function(value, index) {return real(value);})
	//for (var i = 0; i < array_length(str_list); i++) {
	//	array_push(_arr, real(str_list[i]) );
	//}
	return _arr;	
};


///@func random_array_element( _arr, [_start], [_end] )
///@desc returns a random element from an array, (from between indexes [_start] and [_end] if specified)
///@arg {Array} _arr
///@arg {Real} [_start]
///@arg {Real} [_end]
///@returns {Any}
function random_array_element(_arr, _start = 0, _end = -1) {
	try {
		var _len = array_length(_arr);
		
		
		var _index = 0;
		if (_end != -1) {
			_index = irandom_range(_start, _end);
		} else {
			_index = irandom_range(_start, _len - 1);	
		}

		return _arr[_index];
		
	} catch (e) {
		// this'll probably happen if I send in something that isn't an array
		// or if the values of _start and _end are fucked somehow
		debug_msg(e);
	}

}

///@func string_pad_zeroes(_value, _length)
///@desc pads a (numeric) string with zeroes
///@arg {Real} _value
///@arg {Real} _length
///@returns {String}
function string_pad_zeroes(_value, _length) {
//    var _string = string(_value);
//    var _count = max(0, _length - string_length(_string));
//    var _zeroes = string_repeat("0", _count);
//    return $"{_zeroes}{_string}";
	return string_replace_all(string_format(_value, _length, 0), " ", "0");
}

///@func debug_msg(_str)
///@desc shortcut method for doing debug messages
///@arg {String} _str the message to display
///@returns {Bool}
function debug_msg(_str) {
	if (!TESTING) {return false;}
	show_debug_message(_str);
	// perhaps other logging methods/things can go here
	return true;
}

///@func remap(_value, _min1, _max1, _min2, _max2)
///@desc maps a value in one range onto another
///@arg {real} _value the value in range (min1, max1)
///@arg {real} _min1
///@arg {real} _max1
///@arg {real} _min2
///@arg {real} _max2
///@returns {real}
function remap(_value, _min1, _max1, _min2, _max2) {
	var _range1 = abs(_max1 - _min1);
	var _range2 = abs(_max2 - _min2);
	var _clamped = clamp(_value, _min1, _max1);
	return  ( ((_clamped - _min1) * _range2) / _range1) + _min2;
	
}

///@func Quit()
///@desc used to allow GUI/menu buttons to quit the game
function Quit() { game_end(); }

///@func TransitionEffectActive()
///@desc returns true if a transition effect exists
function TransitionEffectActive() {
	if (instance_exists(objScreenTransitionParent)) {
		return true;
	}
	return false;
}

///@func ActivateMenu(menu_obj,[self_obj],[deactivate_self])
///@desc used within a menu to activate another menu object
///@arg {Asset.GMObject|ID.Instance} menu_obj the menu object that needs to be activated
///@arg {Asset.GMObject|ID.Instance} [self_obj] the object calling the function
///@arg {Bool} [deactivate_self] whether or not to deactivate the menu object calling this function
function ActivateMenu(menu_obj, self_obj = id, deactivate_self = true) {
	if (TESTING) {debug_msg($"activating {object_get_name(menu_obj)}");}
	var _target;
	
	if (menu_obj != noone) {
		if (!instance_exists(menu_obj)) {
			// CREATE A NEW INSTANCE OF menu_obj IF IT DOESN'T ALREADY EXIST
			_target = instance_create_layer(x, y, "Instances", menu_obj);
		} else {
			// GRAB THE NEAREST INSTANCE OF menu_obj IF IT EXISTS
			_target = instance_nearest(x, y, menu_obj);
		}
		// ACTIVATE THE MENU
		with (_target) { MENU_ACTIVE = true; }
	}
	
	if (deactivate_self) {
		with (self_obj) {
			// ONLY WORK WITH MENU OBJECTS
			if (object_get_parent(object_index) == objParentMenu)	{
				MENU_ACTIVE = false;
				// WITH SETTINGS MENU, USE THIS TO SAVE THE GAME SETTINGS TO FILE
				event_perform(ev_other, ev_user0);
			}
		}
	}
	return;
}

///@func DestroyMenu([_id])
///@desc Outright destroy a menu instance or other object from a menu
///@arg {ID.Instance} [_id] the menu object to be destroyed
function DestroyMenu(_id = id) {
	instance_destroy(_id);
}

///@func DeactivateMenu([target_menu_obj])
///@desc Deactivate the menu object.
///@arg {Asset.Instance} [target_menu_obj] 
function DeactivateMenu(target_menu_obj = id){
	with (target_menu_obj) {
		if (object_get_parent(object_index) == objParentMenu)	{
			MENU_ACTIVE = false;
			// WITH SETTINGS MENU, USE THIS TO SAVE THE GAME SETTINGS TO FILE
			event_perform(ev_other, ev_user0);
			// if (object_index == objSettingsMenu) { saveSettings(); }
		}
	}
	ErrorCorrection(); // Error Correction 
	return;
}

///@func ToggleParticles()
///@desc Toggles particles to be either on or off.
///@returns {bool}
function ToggleParticles() {
	PARTICLES_ENABLED ^= true;
	return PARTICLES_ENABLED;
}

///@func ToggleGrid()
///@desc Toggles Grid to be either on or off.
///@returns {bool}
function ToggleGrid() {
	SHOWGRID_SETTING = !SHOWGRID_SETTING;
	return SHOWGRID_SETTING;
}

///@func ToggleFullscreen()
///@desc used to toggle fullscreen.
///@returns {bool}
function ToggleFullscreen(){
	FULLSCREEN_MODE = !FULLSCREEN_MODE;
	window_set_fullscreen(FULLSCREEN_MODE);
	
	// cursor desync issue?
	if (instance_exists(objCursor)) {
		with (objCursor) {
			MOUSE_PREV_X = GUI_MOUSE_X;
			MOUSE_PREV_Y = GUI_MOUSE_Y;
		}
	}
	return FULLSCREEN_MODE;
}

///@func ToggleMovehints()
///@desc used to toggle movement hints.
///@returns {bool}
function ToggleMovehints(){
	MOVEMENT_HINTS = !MOVEMENT_HINTS;
	return MOVEMENT_HINTS;
}

///@func ToggleErrorCorrection()
///@desc used to toggle "error correction".
function ToggleErrorCorrection(){
	ENABLE_SECRETS = !ENABLE_SECRETS;
	return;
}

///@func ErrorCorrection()
///@desc this isn't actually for errors, it's for secrets
///@returns {real}
function ErrorCorrection() {
	SECRET_VALUE = irandom(20);
	if (TESTING) {debug_msg( $"{SECRET_VALUE}"); }
	
	// CALL THE ERROR HANDLER
	if (ENABLE_SECRETS) {
		with (objErrorHandler) { event_perform(ev_other, ev_user0); }
	}
	return SECRET_VALUE;
}


///@func is_null(_original,_replacement)
///@desc if the original value is undefined, replace it with an alternative value.
///@arg {any} _original
///@arg {any} _replacement
///@returns {any}
//function is_null(_original, _replacement) {
//	return _original ?? _replacement;
//}