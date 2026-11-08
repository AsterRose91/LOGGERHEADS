// "MARBLE BAG" RNG
// FOR THINGS WE NEED TO HAVE HAPPEN SORTA RANDOMLY
// BUT DON'T WANT TO LEAVE ENTIRELY TO CHANCE
// THANKS AGAIN CECIL

///@func MarbleBag(bag) constructor
///@arg {Array<Any>} source
///@returns {Struct}
function MarbleBag(source) constructor {
	// SOURCE ARRAY IS USED TO CREATE BAG
	self.source = source;
	// BAG IS A SHUFFLED COPY OF THE SOURCE ARRAY
	self.bag = array_shuffle(source);
	/* 
		FIRST VARIABLE IS USED TO STOP
		THE LAST ELEMENT IN A NEW BAG 
		FROM BEING THE SAME AS 
		THE FIRST ELEMENT IN A PREVIOUS BAG
	*/
	self.first = bag[0];
	
	static fill = function() {
		bag = array_shuffle(source);
		// STOP FROM DRAWING THE SAME VALUE BACK TO BACK
		while(array_last(bag) == first) {
			bag = array_shuffle_ext(bag);
		}
		first = bag[0];
	}

	static pull = function() {
		if (array_length(bag) == 0) { fill(); }
		return array_pop(bag);
	}
}

global.err_rng = new MarbleBag( create_num_range(1, 20) );
#macro ERR_RNG global.err_rng
#macro ERR_RNG_DRAW global.err_rng.pull()

///@func ErrorCorrection([set_val])
///@desc oh, this isn't actually for errors, it's for secrets
///@arg {real} [set_val]
///@returns {real}
function ErrorCorrection(set_val = -1) {
	if (set_val != -1) {
		SECRET_VALUE = set_val mod 21; // SECRET_VALUE CAN BE VALUES 0 - 20	
	}
	SECRET_VALUE = ERR_RNG_DRAW; // USING THE NEW "MARBLE BAG" RNG
	
	if (TESTING) {debug_msg( $"{SECRET_VALUE}"); }
	
	// CALL THE ERROR HANDLER
	if (ENABLE_SECRETS) {
		with (objErrorHandler) { event_perform(ev_other, ev_user0); }
	}
	return SECRET_VALUE;
}
