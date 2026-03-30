/// @description HE TALKS TO YOU THEN VANISHES

if (global.story_flags.post_giggles_killed_detective_encounter) { 
	createDialogBox([
		new Dialog("Who are you?",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("Agent Nasser, from Treetown PD",objDetective, sfxTalksound_Hatman),
		new Dialog("Well Officer, what brings you down to this neck of the woods?",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("Funny you should mention 'necks'- A body of a local has been found near their home, head missing.",objDetective, sfxTalksound_Hatman),
		new Dialog("Oh no! that's awful! How could that have happened??",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("We don't know yet. We suspect assault with a deadly weapon... Have you seen or heard anything suspicious?",objDetective, sfxTalksound_Hatman),
		new Dialog("No! Not at all! I was busy collecting wood to make furniture with, I didn't see anything",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("Is there someone around here who has a lot of grudges? Reasons to be violent towards their neighbors or suchlike?",objDetective, sfxTalksound_Hatman),
		new Dialog("Well I haven't the foggiest idea, officer! We all get along pretty well here.",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("I see. Thanks for your time, ma'am.",objDetective, sfxTalksound_Hatman),
	],x,y);
	global.story_flags.post_giggles_killed_detective_encounter = false;
}

if (global.story_flags.post_mrs_scratchy_killed_detective_encounter) { 
	createDialogBox([
		new Dialog("Agent Nasser! Did you find out who did it? I hope you throw the book at the psycho.",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("Not yet, but I did learn a lot of interesting gossip",objDetective, sfxTalksound_Hatman),
		new Dialog("You're Bobbie Chopper, right? Moved here pretty recently?",objDetective, sfxTalksound_Hatman),
		new Dialog("That's my name... I've been here SIX YEARS",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("I meant relatively to everyone else",objDetective, sfxTalksound_Hatman),
		new Dialog("But, the point is... Can you believe all these people with their nice houses and nice clothes... actually hate each other's guts?",objDetective, sfxTalksound_Hatman),
		new Dialog("(Oh don't I fucking know it)",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("It seems like everyone here has a reason to kill everyone else. They're just barely held back by the rules of polite society.",objDetective, sfxTalksound_Hatman),
		new Dialog("(also how have you not noticed there's been a second killing?)",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("Speaking of... it does seem like there's been another killing. Same exact situation- body found near home, head missing. You had best be careful out there, Miss.",objDetective, sfxTalksound_Hatman),
	],x,y);
	global.story_flags.post_mrs_scratchy_killed_detective_encounter = false;
}

if (global.story_flags.post_serena_killed_detective_encounter) { 
	createDialogBox([
		new Dialog("Hello again Detective, how's the investigation?",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("No good I'm afraid, we thought we had a suspect, only for THEM to also turn up dead.",objDetective, sfxTalksound_Hatman),
		new Dialog("(Did... Did this idiot suspect Serena to be the killer??)",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("Suspect was something of an outcast and had an interest in dark and occult subject matter. We figured if anyone had a motive to do shit, that'd fit.",objDetective, sfxTalksound_Hatman),
		new Dialog("(NO FUCKING WAY HE ACTUALLY DID)",objPlayer_SP, sfxTalksound_Bobr),
		new Dialog("I must go. I need to find out who did it.",objDetective, sfxTalksound_Hatman),
	],x,y);
	global.story_flags.post_serena_killed_detective_encounter = false;
}


// HATMAN_ENCOUNTER_NUMBER++;
// ENABLE_DETECTIVE_SPAWN = false;