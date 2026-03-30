/// @description ELIMINATE SELF IF ALREADY KILLED
if (have_met_friend(FRIEND_ID)) {
	instance_destroy(self); 
	
	// SUMMON A SPECIAL CREEPY EFFECT
	if (SECRET_VALUE == 9) {
		instance_create_layer(x, y, layer, objNobody);
	}
	
	instance_destroy(self);
	exit; // DO NOT PROCEED TO CREATE A DIALOG BOX
}

// CREATE DIALOG BOX
switch FRIEND_ID {
	default:
		break;
	
	case FRIENDS.CHIPMUNK_GIRL: {
		createDialogBox([
			new Dialog("Oh hey Dahlia, how are ya?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Hey Bobbie! I'm doing great. Looks like you've been busy",objFriend, sfxTalksound_Dahlia),
			new Dialog("Yep! I've been wanting some more furniture! I got an idea for how to really brighten up the place!",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Oh, What is it?",objFriend, sfxTalksound_Dahlia),
		],x,y);
		break;
	}
		
	case FRIENDS.CAT_GIRL: {
		createDialogBox([
			new Dialog("Hi Mrs. Scratch, what's happening?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Hello Bobbie! Not much today. Yourself?",objFriend, sfxTalksound_Scrachy),
			new Dialog("Just looking for some pretty furniture for my house- Hm, I don't see Mr. Scratch anywhere. Where's he at?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Oh! He just went out to get some things. Maybe you'll spot him by the lake",objFriend, sfxTalksound_Scrachy),
		],x,y);
		break;
	}
	
	case FRIENDS.DOG_GIRL: {
		createDialogBox([
			new Dialog("'sup babe?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("There you are, Bobbie, I was wondering when you'd come by",objFriend, sfxTalksound_Nutmeg),
			new Dialog("Sorry about that, I've been busy. Heck, I've still got a lot on my plate right now.",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Oh well... Just remember to come by here after you're done, there'll be something for you later.",objFriend, sfxTalksound_Nutmeg),
			new Dialog("Oh?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Yeah, it's that thing we talked about. But you gotta come here AFTER you've finished everything",objFriend, sfxTalksound_Nutmeg),
			new Dialog("Thanks pup, you're the best. I'll try and make this quick.",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("(you really are...)",objPlayer_SP, sfxTalksound_Bobr),
		],x,y);
		break;
	}
	
	case FRIENDS.BUNNY_GIRL: {
		createDialogBox([
			new Dialog("How's it going babe?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("Oh shit, you're really going through with it?",objFriend, sfxTalksound_Serena),
			new Dialog("Yep. You ready?",objPlayer_SP, sfxTalksound_Bobr),
			new Dialog("You bet. Hurry up!",objFriend, sfxTalksound_Serena),
		],x,y);
		break;
	
	}
}