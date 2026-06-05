#region FRIEND NAMES, SPRITES, INFORMATION
global.friends_bios = [];
global.friends_met = [];
#macro FRIENDS_BIOS global.friends_bios
#macro FRIENDS_MET global.friends_met
enum FRIENDS {
	NONE = -3,
	P2 = -2,
	BOBBIE = -1, 
	CHIPMUNK_GIRL= 0,
	CHIPMUNK_BOY = 1,
	CAT_BOY = 2,
	CAT_GIRL = 3,
	BUNNY_BOY = 4,
	BUNNY_GIRL = 5,
	DOG_BOY = 6,
	DOG_GIRL = 7
};

FRIENDS_BIOS = 	[
	{
		id: FRIENDS.NONE // -3
		, name: "ERROR"
		, desc: "Hey, something fucky happened here!"
		, sprite: sprPal1
		, likes_you: false
	}
	
	,{
		id: FRIENDS.P2 //-2
		, name: "BOBBIE CHOPPER?"
		, desc: "Bobbie woke up o- hey, that's not Bobbie! Who is that?"
		, sprite: sprBobbie2_kill
		, likes_you: false
	}
	,{
		id: FRIENDS.BOBBIE // -1
		, name: "BOBBIE CHOPPER"
		, desc: "Bobbie woke up one day and decided to behead all her friends!"
		, sprite: sprBobbie_kill
		, likes_you: false
	}
	,{
		id: FRIENDS.CHIPMUNK_GIRL // 0
		, name: "DAHLIA"
		, desc: "She used to be an internet superstar!"
		, sprite: sprPal1
		, likes_you: false
	}
	,{
		id: FRIENDS.CHIPMUNK_BOY // 1
		, name: "NUTTY"
		, desc: "PLACEHOLDER DESCRIPTION"
		, sprite: sprPal1
		, likes_you: false
	}
	,{
		id: FRIENDS.CAT_BOY // 2
		, name: "MR. SCRATCH"
		, desc: "Has a thing for blue rats"
		, sprite: sprPal2
		, likes_you: false
	}
	,{
		id: FRIENDS.CAT_GIRL // 3
		, name: "MRS. SCRATCH"
		, desc: "She looks different today! Did she do something with her hair?"
		, sprite: sprPal2
		, likes_you: false
	}
	,{
		id: FRIENDS.BUNNY_BOY // 4
		, name: "RAINBOW"
		, desc: "I think he said don't forget the video?"
		, sprite: sprPal4
		, likes_you: false
	}
	,{
		id: FRIENDS.BUNNY_GIRL // 5
		, name: "SERENA"
		, desc: "A real murder tramp!"
		, sprite: sprPal4
		, likes_you: true
	}
	,{
		id: FRIENDS.DOG_GIRL
		, name: "NUTMEG"
		, desc: "A friendly and lovable pup, loyal to the end!"
		, sprite: sprPal3
		, likes_you: true
	}
];
#endregion

///@func SetupFriendInformation()
///@desc set up which friends you have met
///@returns Array{<Struct>}
function SetupFriendInformation() {
	var array_new = [];
	array_foreach(
		FRIENDS_BIOS,
		method( {target: array_new},
		function(a) {
			array_push( target, { id: a.id, met: false} );
		})
	);
	return array_new;
}
FRIENDS_MET = SetupFriendInformation();

///@func getFriendBiography(friendID)
///@desc returns a struct containing the name and description of the friend in question
///@arg {real} friendID 
///@returns {struct}
function getFriendBiography(friendID) {
	var i = array_find_index(
		FRIENDS_BIOS
		,method({j: friendID}, function(c) {return c.id == j;} ) 
	);
	return (i != -1) ? FRIENDS_BIOS[i] : FRIENDS_BIOS[0];
}

///@func getFriendSprite(friendID)
///@desc gets the sprite for the friend
///@arg {real} friendID
///@returns {Asset.GMSprite}
function getFriendSprite(friendID) {
	var i = array_find_index(
		FRIENDS_BIOS
		, method({j: friendID}, function(k){return k.id == j;})
	);
		
	return (i != -1) ? FRIENDS_BIOS[i].sprite : sprPal1;
}

///@func add_friend(friendID)
///@desc add the friend to your list!
///@arg {Real} friendID
///@returns {Bool}
function add_friend(friendID) {
	var i = array_find_index(
		FRIENDS_MET
		,method( {j: friendID}, function(k) {return k.id == j;} ) 
	);
	if (i != -1) { 
		FRIENDS_MET[i].met = true;
		return true;
	}
	return false;
}

///@func have_met_friend(friendID)
///@desc check if you've met this friend
///@arg {real} friendID
///@returns {bool}
function have_met_friend(friendID){
	var i = array_find_index(
		FRIENDS_MET
		,method( {j: friendID}, function(k) {return k.id == j;} ) 
	);
	return (i != -1) ? FRIENDS_MET[i].met : false;
}
///@func totalFriendsMet()
///@desc return the total number of friends you've met
///@returns {Real}
function totalFriendsMet() {
	var i = array_length( array_filter(FRIENDS_MET, function(k) {return k.met;}) );
	return i;
}

