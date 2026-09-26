/// @description GIFT FROM A FRIEND
if (!GIFTED) {
	// ADD FRIEND
	add_friend(FRIEND_ID);
	play_sfx(sfxChop1);
	var gift = instance_create_layer(x, y, layer, objFriendGift);
	with (gift) {
		image_xscale = other.image_xscale; 
		XX = image_xscale * -4; 
		YY = -5;
		FRIEND_ID = other.FRIEND_ID;
	}	
	GIFTED = true;
	
	// SPARK AN EVENT
	// ENABLE_DETECTIVE_SPAWN = true;
}

// BOBBIE'S POST-MURDER DIALOGUE
// ALSO ASSOCIATED DETECTIVE ENCOUNTER EVENT
switch FRIEND_ID {
	default:
		break;
	
	case FRIENDS.CHIPMUNK_GIRL:{
		createDialogBox([
			new Dialog("Yep! You'll fit in well next to all the others",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Let's see you swipe the last bag of nuts at TreeMart now, bitch",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
		global.story_flags.post_giggles_killed_detective_encounter = true;
		break;
	}
		
	case FRIENDS.CAT_GIRL: {
		createDialogBox([
			new Dialog("Dumb bitch.",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("That's the last time you and your manslut of a hubby talk shit about me behind my back",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("[headless gurgling noises]",objFriend, sfxTalksound_Scrachy),
			new Dialog("Oh, and by the way? He's cheating on you with some dumb rat boy at his workplace.",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("[continues to make headless gurgling noises]",objFriend, sfxTalksound_Scrachy),
			new Dialog("Oh yeah definitely, I'll be killing him too.",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
		global.story_flags.post_mrs_scratchy_killed_detective_encounter = true;
		break;
	}
	
	case FRIENDS.CAT_BOY: {
		createDialogBox([
			new Dialog("Looks like my axe is as sharp as ever, thanks for helping me check!",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("[Headless gurgling noises]",objFriend, sfxTalksound_Scrachy),
			new Dialog("Nah I'm good- I bet your axe sharpener would've made my axe blade duller than a spoon",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("[continues to make headless gurgling noises]",objFriend, sfxTalksound_Scrachy),
			new Dialog("Maybe if you wasted less cash on your little rat sidepiece you might be able to stock better shit",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("[even more headless gurgling noises]",objFriend, sfxTalksound_Scrachy),
			new Dialog("What do you mean he called in sick? I guess I'll have to go pay him a visit.",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
		global.story_flags.post_mr_scratchy_killed_detective_encounter = true;
		break;
	}
	
	case FRIENDS.DOG_GIRL:{
		createDialogBox([
			new Dialog("I honestly don't even have any beef with ya, Meg.",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("I just thought your head would look really pretty with my new carpet.",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
		break;
	}
	
	case FRIENDS.BUNNY_GIRL:{
		createDialogBox([
			new Dialog("[Gurgling, obscene noises]",objFriend, sfxTalksound_Serena),
			new Dialog("God, you were always a freak. Loved that about you.",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
		global.story_flags.post_serena_killed_detective_encounter = true;
		break;
	}
}