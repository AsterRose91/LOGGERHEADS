/// @description THIS WILL LET YOU SELECT A LEVEL
image_index = 0;
image_speed = 0;

HIGHLIGHT = false;
SHOW_LEVEL_INFO = false;


// SECRET OCCURS IF YOU TRY TO RETURN TO A PREVIOUS LEVEL
SECRET_WARP = false;
if (SECRET_VALUE == ERR_TYPES.ERR_WRONGWARP && hasLevelBeenCleared(LEVEL_ID) ) {
	if (random(1) > 0.5) { SECRET_WARP = true; }
}