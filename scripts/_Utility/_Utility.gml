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
function dec_to_hex(dec, len = 1) {
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
		
		var _index = 0;
		if (_end != -1) {
			_index = irandom_range(_start, _end);
		} else {
			var _len = array_length(_arr);
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

///@func create_num_range(_start, _end, [_step])
///@desc create an array of numbers including both _start and _end, separated by _step (default value = 1)
///@arg {real} _start
///@arg {real} _end
///@arg {real} [_step]
function create_num_range(_start, _end, _step = 1) {
	var _diff = abs(_end - _start);
	
	if ( _diff <= abs(_step) || _step == 0 ) {
		// LOL WAT
		return [_start, _end];
	}

	// NUMBER OF ELEMENTS	
	var _size = ceil( _diff / abs(_step) ) + 1;
	
	// DIRECTION OF ARRAY?
	// -VE STEP MEANS FROM BIGGER TO SMALLER
	// +VE STEP MEANS FROM SMALLER TO BIGGER
	var arr_start, arr_end
	if (_step < 0) {
		arr_start = (_start > _end) ? _start : _end;
		arr_end = (_end > _start) ? _start : _end;
	} else {
		arr_start = (_start > _end) ? _end: _start;
		arr_end = (_end > _start) ? _end: _start;
	}
	
	// LAMBDA SHIT I GUESS
	var _lambda = {fstart: arr_start, fstep: _step,  func: function(i) {return fstart + (i * fstep);} }
	var _range = array_create_ext(_size, _lambda.func);
	
	return _range;
}


///@func Quit()
///@desc used to allow GUI/menu buttons to end the game
function Quit() {
	room_goto(gameShutdownScreen);
}

///@func TransitionEffectActive()
///@desc returns true if a transition effect exists
function TransitionEffectActive() {
	if (instance_exists(objScreenTransitionParent)) {
		return true;
	}
	return false;
}

