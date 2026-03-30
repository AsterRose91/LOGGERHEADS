/// @description UNLOCK ONCE YOU HAVE THE RIGHT KEY

var _check = false; 

switch (GATE_COLOR) {
	default:
	case QUEST_ITEMS.RED_KEY:
		_check = RED_KEY_COLLECTED;
		break;
	case QUEST_ITEMS.BLUE_KEY:
		_check = BLUE_KEY_COLLECTED;
		break;
	case QUEST_ITEMS.GREEN_KEY:
		_check = GREEN_KEY_COLLECTED;
		break;

}

if ( _check ) {
	ALL_DONE = true;
}
