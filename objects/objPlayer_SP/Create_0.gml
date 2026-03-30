/// @description THE PLAYER OBJECT FOR THE SINGLE PLAYER MODE
image_speed = 0;
playerInputVars()

STATE = CHARACTER_STATES.NONE;
FACING = DIRECTION.RIGHT;
IS_FALL = false;
IS_AI = false;
COLOR = LOG_COLORS.RED;
PLAYER_ID = PLAYERS.PLAYER_NONE;

DEST_X = x;
DEST_Y = y;

KEY_DELAY = 0;
ANIM_TIMER= 0;

CAN_MOVE_UP = false;
CAN_MOVE_DOWN = false;
CAN_MOVE_LEFT = false;
CAN_MOVE_RIGHT = false;
CAN_INTERACT_DOOR = false; //this may be tricky to work out...
CAN_INTERACT_PAL = false;
OOPSY_WOOPSY = 0; // the type of indignity suffered