/// @description Insert description here
// You can write your code in this editor

// GRAVITY
if (!place_meeting(x, y + 1, objBlock) ) {if (YY < T) {YY++;} }
else {
	
	if (YY >= 0) {	
		if (BOUNCE > 0) { 
			play_sfx(sfxThud);
			YY = -3;
			XX = XX div 2;
			BOUNCE--; 
		} else {
			YY = 0; 
			XX = 0;
		} 
	}
}

var T2 = T div 2;
repeat (abs(YY)) {	
	if (place_meeting(x, y + sign(YY), objBlock) ) {
		YY = 0; break;
	}
	if ( (bbox_bottom + YY) >= (room_height + T2) || bbox_top - YY <= -T2) { YY = 0; break;}
	
	y += sign(YY);
}

repeat (abs(XX)) {
	
	if (place_meeting(x + sign(XX), y , objBlock) ) {
		XX = 0; break;
	}
	if ( (bbox_right + XX) >= (room_width + T2) || (bbox_left + XX) < -T2 ) { XX = 0; break;}
	
	x += sign(XX);
}