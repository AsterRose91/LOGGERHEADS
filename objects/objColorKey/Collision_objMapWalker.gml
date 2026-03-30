/// @description TRIGGER STORY FLAGS WHEN COLLECTED
switch KEY_COLOR {
	default:
	case QUEST_ITEMS.RED_KEY:
		RED_KEY_COLLECTED = true;
		break;
	case QUEST_ITEMS.BLUE_KEY:
		BLUE_KEY_COLLECTED = true;
		break;
	case QUEST_ITEMS.GREEN_KEY:
		GREEN_KEY_COLLECTED = true;
		break;
}

// PLAY A JINGLE
with (objMusicMan) {event_perform(ev_other, ev_user0);}

instance_destroy(self);