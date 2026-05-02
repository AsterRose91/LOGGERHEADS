/// @description Take a screenshot


// this was originally in a different object
var _year = current_year;
var _month = string_replace_all(string_format(current_month, 2, 0), " ", "0"); //string_pad_zeroes(current_month, 2);
var _day =  string_replace_all(string_format(current_day, 2, 0), " ", "0"); //string_pad_zeroes(current_day,2);
var _hour =  string_replace_all(string_format(current_hour, 2, 0), " ", "0"); //string_pad_zeroes(current_hour,2);
var _minute =  string_replace_all(string_format(current_minute, 2, 0), " ", "0"); //string_pad_zeroes(current_minute,2);
var _second = string_replace_all(string_format(current_second, 2, 0), " ", "0"); //string_pad_zeroes(current_second,2);

var _iter = 0, _iter_string = "", _filename = ""

while(true) {
	_iter_string = string_replace_all(string_format(_iter, 4, 0), " ", "0"); //string_pad_zeroes(_iter, 4);
	// there shouldn't be any filename collisions but this should prevent overwriting I think
	_filename = $"{working_directory}Screens\Screenshot_{_year}{_month}{_day}_{_hour}{_minute}{_second}_{_iter}.png"

	if (file_exists(_filename)) {
		// take the screenshot?
		
		// play a prank on the user?
		
		screen_save(_filename);		
		break;
	}
	
	// increase _iter until you come across a filename without collision
	_iter++;
}

