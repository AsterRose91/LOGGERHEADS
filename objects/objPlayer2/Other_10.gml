/// @description GET A PRIZE
if (!CAN_DIE) {exit;}
if (GIFTED) {exit;}
STATE = CHARACTER_STATES.OOPS;
OOPSY_WOOPSY = OOPSY_TYPES.CHOPPED;

add_friend(FRIENDS.P2);

play_sfx(sfxChop1);
var gift = instance_create_layer(x, y, layer, objFriendGift);
with (gift) {
	image_xscale = other.FACING; 
	XX = image_xscale * -4; 
	YY = -5;
	FRIEND_ID = FRIENDS.P2;
}	
GIFTED = true;	
