/// @description DRAW THE NOTEBOOK

if (!JOURNAL_ACTIVE) {
	
	// it's a sprite the size of the entire screen right now. I COULD fix that
	draw_sprite(sprBobbiesNotebookIcon, 0, 0, 0);

} else {
	
	switch (JOURNAL_CURRENT_PAGE) {
		default:
		case 0: 
			draw_sprite(sprBobbiesNotebook, 0, 0, 0);
			break;
			
		case 1:
			draw_sprite(sprBobbiesNotebook, 0, 0, 0);
			break;
	
	}

}