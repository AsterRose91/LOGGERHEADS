/// @description BLOCK OFF ACCESS UNLESS CERTAIN LEVELS OR CONDITIONS ARE MET

ALL_DONE = false;
LEVELS_NEEDED_ARR = [];
DRAW_MESSAGE = false;
DISABLED = false;

CONVERT_STRING_TO_ARR = function(_str) {
	// pass LEVELS_NEEDED into this function
	// LEVELS_NEEDED is stored as a string with commas
	// it needs to be split first 
	// each element of LEVELS_NEEDED must be converted to real()
	var str_list = string_split(_str,",",true)
	, lvl
	, lvl_id
	, _arr = [];
	for (var i = 0; i < array_length(str_list); i++) {
		lvl = str_list[i];
		lvl_id = real(lvl); 
		array_push(_arr, lvl);
	}
	return _arr;	
};

CHECK_ALL_COMPLETED = function(_arr) {
	var _done = true, lvl;
	for (var i = 0; i < array_length(_arr); i++) {
		lvl = _arr[i];
		if (!hasLevelBeenCleared(lvl)) {
			_done = false;
		}
	}
	return _done;
}

UPDATE_MESSAGE = function(_arr) {
	var _message = "To open this gate, you need to beat:\n"
	// UPDATE THE LIST OF HOW MANY OBJECTIVES HAVE BEEN COMPLETED
	for (var l = 0; l < array_length(_arr); l++){
		var _iscleared = hasLevelBeenCleared(_arr[l]);
		_message += $"Level {_arr[l]}: {_iscleared ? "(COMPLETE)": "(INCOMPLETE)"} \n"
	}
	return _message;
};