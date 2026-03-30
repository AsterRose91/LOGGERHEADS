/// @description BLOCK OFF ACCESS UNLESS CERTAIN LEVELS OR CONDITIONS ARE MET

ALL_DONE = false;
LEVELS_NEEDED_ARR = [];
DRAW_MESSAGE = false;
DISABLED = false;

CHECK_ALL_COMPLETED = function() {
	return countLevelsCleared() >= LEVELS_CLEARED_NUM;
}

UPDATE_MESSAGE = function() {
		var _diff = LEVELS_CLEARED_NUM - countLevelsCleared();
		var _message = "Go on right through!";
		
		if (_diff > 0) {
			_message = $"To open this gate, you need to beat {_diff} more levels."
		}
		
		return _message;
};