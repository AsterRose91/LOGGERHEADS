/// @description TAKE SCREENSHOTS
var iter = 0, filename = "";
while (true) {
	
	filename = $"Screenshot_{current_day}{current_month}{current_year}_{current_hour}{current_minute}{current_second}_{iter}.png"
	
	// PREVENT REDUNDANT FILENAMES
	if (!file_exists(filename)) {
		screen_save(filename);
		break;
	}
	
	iter++;
}