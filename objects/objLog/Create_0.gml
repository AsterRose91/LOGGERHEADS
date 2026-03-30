/// @description Log

// TYPE / COLOR
BLOCKTYPE = choose(LOG_COLORS.RED, LOG_COLORS.BLUE, LOG_COLORS.NONE);

// BEHAVIOUR / STATE
BLOCKSTATE = LOG_STATES.NONE;

// MOVEMENT / DIRECTION
DIR = DIRECTION.RIGHT;
XX = 0;
YY = 0;
PIXELS_COUNTER = 0; // HMMM

// Only used with Horizontal logs and Stationary logs
// Stationary logs may be horizontal or vertical
SIZE = 1;
V_SIZE = 1;

// Collisions
ALLOW_COLLISIONS = true;

// VULNERABLE TO EXPLOSIONS
EXPLODE_PROOF = false;

// NEW BOMB TYPE
EXPLODE_COUNTER = -1; 

// MAGNETIC
MAGNET_ACTIVE = false;

image_speed = 0;
image_index = BLOCKTYPE;


// Special effects/animations
ANIM_TIMER = 0;