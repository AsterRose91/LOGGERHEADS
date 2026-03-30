/// @description BLOCK OFF ACCESS UNLESS YOU HAVE THE RIGHT KEY

DRAW_MESSAGE = false;
GATE_COLOR = QUEST_ITEMS.RED_KEY;
ALL_DONE = false;
DISABLED = false;

UPDATE_MESSAGE = function(_color = GATE_COLOR) {
	var _colorkey = "";
	switch _color {
		default:
		case QUEST_ITEMS.RED_KEY:
			_colorkey = "Red";
			break;
		case QUEST_ITEMS.BLUE_KEY:
			_colorkey = "Blue";
			break;
		case QUEST_ITEMS.GREEN_KEY:
			_colorkey = "Green";
			break;
		case QUEST_ITEMS.PINK_KEY:
			_colorkey = "Pink";
			break;
		case QUEST_ITEMS.ICE_KEY:
			_colorkey = "Ice";
			break;
			
	}
	var draw_message = $"This gate needs the {_colorkey} key!";
	return draw_message;
}
