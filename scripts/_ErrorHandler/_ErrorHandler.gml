global.err_rng = new MarbleBag([
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_METABARRIERBROKEN,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_MSG,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_METABARRIERBROKEN,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_MSG,
	ERR_TYPES.ERR_BSOD,
	ERR_TYPES.ERR_AUDIODRIVERCRASH,
	ERR_TYPES.ERR_NONE,
	ERR_TYPES.ERR_MSG,
]);

#macro ERR_RNG global.err_rng
#macro ERR_RNG_DRAW global.err_rng.pull()

global.randomizer = ERR_TYPES.ERR_NONE;
#macro SECRET_VALUE global.randomizer
global.enable_secrets = true;
#macro ENABLE_SECRETS global.enable_secrets

///@func ErrorCorrection([set_val])
///@desc oh, this isn't actually for errors, it's for secrets
///@arg {real} [set_val]
///@returns {real}
function ErrorCorrection(set_val = ERR_TYPES.ERR_NONE) {
	if (set_val != ERR_TYPES.ERR_NONE) {
		SECRET_VALUE = set_val;	
	}
	SECRET_VALUE = ERR_RNG_DRAW; // USING THE NEW "MARBLE BAG" RNG
	
	if (TESTING) {debug_msg( $"{SECRET_VALUE}"); }
	
	// CALL THE ERROR HANDLER
	if (ENABLE_SECRETS) {
		with (objErrorHandler) { event_perform(ev_other, ev_user0); }
	}
	return SECRET_VALUE;
}