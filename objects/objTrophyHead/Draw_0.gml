/// @description DRAW THE SPRITE ONLY WHEN YOU'VE MET THE FRIEND IN QUESTION

// SPECIAL SPRITE FOR YOUR MOST SPECIAL FRIENDS
var _i = (FRIEND_ID == FRIENDS.DOG_GIRL || FRIEND_ID == FRIENDS.BUNNY_GIRL) ? 1 : 0;
draw_sprite(sprTrophyMountNEW, _i, x, y);
if (have_met_friend(FRIEND_ID)) {
	var present = getFriendSprite(FRIEND_ID);
	draw_sprite(present, 3, x, y);
}