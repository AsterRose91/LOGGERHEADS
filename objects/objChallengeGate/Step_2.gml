/// @description UNLOCK ONCE ALL NEEDED LEVELS HAVE BEEN CLEARED

if (!variable_instance_exists(self,"LEVEL_NEEDED")) {exit;}
if (is_undefined(LEVEL_NEEDED)) {exit;}


var _check = LEVEL_SCORE_CHECK(LEVEL_NEEDED, SCORE_NEEDED);


if ( _check ) {
	ALL_DONE = true;
	//instance_destroy(self);
}
