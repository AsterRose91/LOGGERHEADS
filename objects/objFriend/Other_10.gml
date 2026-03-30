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
		],x,y);
		global.story_flags.post_mrs_scratchy_killed_detective_encounter = true;
		break;
	}
	
	case FRIENDS.CAT_BOY: {
		createDialogBox([
			new Dialog("Take that, you damned slut.",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Shoulda told the Missus about your affair with that damn rat. Oh well.",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
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