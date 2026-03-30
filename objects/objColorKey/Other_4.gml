///@description DELETE WHEN THE APPROPRIATE KEY IS COLLECTED
var _collected = false;
switch KEY_COLOR {
	default:
	case QUEST_ITEMS.RED_KEY:
		_collected = RED_KEY_COLLECTED;
		break;
	case QUEST_ITEMS.BLUE_KEY:
		_collected = BLUE_KEY_COLLECTED;
		break;
	case QUEST_ITEMS.GREEN_KEY:
		_collected = GREEN_KEY_COLLECTED;
		break;
}
if (_collected) {instance_destroy(self);}