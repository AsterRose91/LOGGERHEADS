/// @description BLOCK OFF ACCESS UNLESS YOU HAVE MET A CERTAIN FRIEND

DRAW_MESSAGE = false;
FRIENDS_NEEDED = [FRIENDS.CHIPMUNK_GIRL];
ALL_DONE = false;
DISABLED = false;

CHECK_ALL_COMPLETED = function(_arr) {
	var _done = true, _friend;
	for (var i = 0; i < array_length(_arr); i++) {
		_friend = _arr[i];
		if (!have_met_friend(_friend)) {
			_done = false;
		}
	}
	return _done;
}

UPDATE_MESSAGE = function(_arr) {
	var _message = "To open this gate, you need to say hi to: "
	// UPDATE THE LIST OF HOW MANY OBJECTIVES HAVE BEEN COMPLETED
	for (var l = 0; l < array_length(_arr); l++){
		var _met = have_met_friend(_arr[l]);
		
		if (!_met) {
			var _name = getFriendBiography(_arr[l]).name
			_message += $"{_name}, "
		}
	}
	return _message;
};