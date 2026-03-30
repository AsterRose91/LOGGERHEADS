/// @description DIFFERENT COLORS

switch KEY_COLOR {
	default:
	case QUEST_ITEMS.RED_KEY:
		image_index = 0;
		break;
	case QUEST_ITEMS.BLUE_KEY:
		image_index = 1;
		break;
	case QUEST_ITEMS.GREEN_KEY:
		image_index = 2;
		break;
}
draw_self();