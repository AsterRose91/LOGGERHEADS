/// @description TEXT ENTRY

event_inherited();

MENU_ACTIVE = true;
TEXT_INPUT = "";

var PROMPT = "WHO ARE YOU?"
var W = 80;
var H = 100;
MENU_ELEMENTS =	[
	new GUITextMessage(	
		PROMPT, 
		(GUI_W div 2) - (W div 2), 
		(GUI_H div 2) - (H div 2), 
		4),
					
	new GUIUserInputTextDisplayer(	
		"This GUI element is not ",
		(GUI_W div 2) - (W div 2), 
		(GUI_H div 2) - (H div 2) + 20,
		4)
];	

var LETTERS = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"," ","0","1","2"];
var LETTERS_COUNT = array_length(LETTERS);

var _X = (GUI_W div 2) - (W div 2);
var _Y = (GUI_H div 2) - (H div 2) + 48;


var _newButton, current_letter;

for (var i = 0; i < LETTERS_COUNT; i++;) {
	current_letter = LETTERS[i]; // CREATE A BUTTON FOR THIS 
	switch current_letter {
		default: {
			// LETTERS AND SPACE
			// USE A SPRITE BUTTON FOR THIS INSTEAD?
			_newButton = new SpriteButton(
				sprSpritefont,
				i,
				_X,
				_Y,
				[gui_append_letter, current_letter],
				sprMenuBackSmallNEW,
			);
			//new TextButton(
			//	current_letter, 
			//	_X, 
			//	_Y,
			//	1,
			//	[gui_append_letter, current_letter],
			//);
			break;
		}
		case "0": {
			// BACKSPACE
			_newButton = new SpriteButton(
				sprSpritefont,
				i,
				_X,
				_Y,
				[gui_text_backspace],
				sprMenuBackSmallNEW,
			);	
			
			//new TextButton(
			//	"BACK", 
			//	_X, 
			//	_Y,
			//	1,
			//	[gui_text_backspace],
			//);
			break;
		}
		case "1": {
			// CLEAR
			_newButton = new SpriteButton(
				sprSpritefont,
				i,
				_X,
				_Y,
				[gui_text_clear],
				sprMenuBackSmallNEW,
			);	
			//new TextButton(
			//		"CLR", 
			//		_X, 
			//		_Y,
			//		1,
			//		[gui_text_clear],
			//	);
			break;
		}
		case "2": {
			// ENTER
			_newButton = new SpriteButton(
				sprSpritefont,
				i,
				_X,
				_Y,
				[DeactivateMenu, id],
				sprMenuBackSmallNEW,
			);	
			//new TextButton(
			//	"ENTER", 
			//	_X, 
			//	_Y,
			//	1,
			//	[DeactivateMenu, id],
			//);
			break;
		}
	}
	
	// APPEND BUTTON TO LIST OF MENU ELEMENTS
	array_push(MENU_ELEMENTS, _newButton)
	
	// NEW ROW OF BUTTONS
	_X += 19;
	if (i % 9 == 8) { 
		_Y += 19; 
		_X = (GUI_W div 2) - (W div 2);
	}
}
//MENU_RESIZE();
var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;