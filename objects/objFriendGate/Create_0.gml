/// @description BLOCK OFF ACCESS UNLESS YOU HAVE MET A CERTAIN FRIEND

DRAW_MESSAGE = false;
//FRIENDS_NEEDED = [FRIENDS.CHIPMUNK_GIRL];
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
	var _message = ALL_DONE?"To open this gate you had to say hi to:\n":"To open this gate, go say hi to:\n";
	// UPDATE THE LIST OF HOW MANY OBJECTIVES HAVE BEEN COMPLETED
	for (var l = 0; l < array_length(_arr); l++){
		var _met = have_met_friend(_arr[l]);
		
		var _name = getFriendBiography(_arr[l]).name
		_message += $"{_name}: {_met?"MET":"NOT MET"}\n"
		
	}
	return _message;
};