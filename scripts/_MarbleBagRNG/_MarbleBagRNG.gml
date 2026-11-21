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
