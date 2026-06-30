///@func Dialog(_message, _speaker, _talksound) constructor
///@desc individual lines of a dialog cutscene
///@param {String} _message
///@param {Asset.GMObject} _speaker
///@param {Asset.GMSound} _talksound
///@param {Array} [_setflag]
function Dialog(_message, _speaker, _talksound, _setflag = []) constructor {
	self.message = _message ?? "this is a default message";	// THE MESSAGE 
	self.speaker = _speaker ?? objPlayer_SP;				// OBJECT INDEX OF THE SPEAKER	
	self.talksound = _talksound ?? sfxTalksound_Dahlia;		// THE FUNNY SOUND THEY MAKE
	self.flags = _setflag;									// PUT [variable, newValue] IN HERE TO HAVE THIS MESSAGE DO SOMETHING 
}

///@func createDialogBox(_dialogs, [x], [y])
///@desc creates an instance of objDialogBox with the specified dialog tree
///@param {Array<Struct.Dialog>} _dialogs			// The array containing Dialog() structs representing the dialogue
///@param {Real} [x]								// x-coordinate
///@param {Real} [y]								// y-coordinate
///@returns Id.Instance<objDialogBox>
function createDialogBox(_dialogs, x = 0, y = 0) {
	var _ = noone;
	try { 
		//_ =	instance_create_layer(x, y, "Instances", objDialogBox);
		_ =	instance_create_layer(x, y, "Instances", objDialogBoxNEW);
		with (_) {_DIALOGS = _dialogs; _STATE = DIALOGBOX_STATES.NONE;}
	} catch(e) {
		debug_msg(string(e));
	}
	return _;
}
