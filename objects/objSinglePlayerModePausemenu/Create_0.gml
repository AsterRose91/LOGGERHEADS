/// @description CREATE BUTTONS
enabled = false;
//draw a big PAUSED! 
//Maybe replace this with a sprite button.
draw_set_font(Font_Big);
paused_text_w = string_width("PAUSED!") + 16;
paused_text_h = string_height("PAUSED!") + 16;

//buttons
draw_set_font(Font_Small);
but_pad = 4;
BUTTONS= [
	//new SpriteButton(),
	new TextButton("EXIT TO TITLE SCREEN", 0, 0, but_pad, [gotoLevel, SPECIALROOMS.TITLE_SCREEN]), 
	new TextButton("EXIT TO LEVEL SELECT", 0, 0, but_pad,  [gotoLevel, SPECIALROOMS.LEVEL_SELECT]),
	new TextButton("RESTART LEVEL", 0, 0, but_pad, [levelRestart]),	
	new TextButton("QUIT GAME", 0, 0, but_pad, [Quit]) 
];

if (room == Hub0) {
	BUTTONS[1].disable();
	BUTTONS[1].hide();
	BUTTONS[2].disable();
	BUTTONS[2].hide();
} else {
	BUTTONS[1].enable();
	BUTTONS[1].show();
	BUTTONS[2].enable();
	BUTTONS[2].show();
}


// set the menu width/height
w = 0; 
h = 0;
var max_w = 0, max_h = 0, i = 0;
repeat( array_length(BUTTONS) ) { 
	max_w = max(BUTTONS[i].w, max_w);
	max_h = max(BUTTONS[i].h, max_h);
	i++;
}

w = ( max(max_w, paused_text_w) ) + 8;
h = paused_text_h + ( (max_h + 8) * array_length(BUTTONS) ) + 16;
x = (GUI_W div 2) - (w div 2);
y = (GUI_H div 2) - (h div 2);

// set button positions
i = 0;
repeat( array_length(BUTTONS) ) {
	BUTTONS[i].x = (GUI_W div 2) - (BUTTONS[0].w div 2);
	BUTTONS[i].y = (i == 0) ? (y + paused_text_h + 8) : (BUTTONS[i - 1].y + BUTTONS[i - 1].h + 8);
	i++;
}