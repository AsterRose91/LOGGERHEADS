/// @description DRAW STUFF
if (TransitionEffectActive()) {exit;}

// GUI width and height
var gw = GUI_W, gh =  GUI_H;

var _msg, msg_w, msg_h, msg_color, msg_x, msg_y;


//WHOSE TURN IS IT
draw_set_font(Font_Small);
var curr_player = (CURRENT_TURN == PLAYERS.PLAYER_1) ? "PLAYER 1" : "PLAYER 2";
msg_color = (CURRENT_TURN == PLAYERS.PLAYER_1)? COLORS.COLOR_BLUE: COLORS.COLOR_RED;
_msg = curr_player + "'S TURN!"
msg_x = 16; msg_y = 16;
draw_text_drop_shadow(msg_x, msg_y, _msg, msg_color, c_black, 1, 1);

//TURN COUNTER
draw_set_font(Font_Small);
msg_color = c_white;
_msg = "TURN NUMBER " + string(TURN_COUNT);
msg_x = 16; msg_y = 32;
draw_text_drop_shadow(msg_x, msg_y, _msg, msg_color, c_black, 1, 1);


switch MATCH_STATE {
	case MATCH_STAGE.MATCH_START:
		break;
		
	default:
	case MATCH_STAGE.MATCH_DURING:
		
		#region draw the game HUD
		msg_color = c_white;
		
		if (!GAME_PAUSED) {	
			#region TIMER
			draw_set_font(Font_Small);
			_msg = "TIME:  " + string(floor(TIMER));
			msg_x = 16; msg_y = 48;
			#endregion
		} 
		
		if (GAME_PAUSED) {
			draw_set_font(Font_Big);
			_msg = "PAUSED!";
			msg_w = string_width(_msg); msg_h = string_height(_msg);
			msg_x = (gw div 2) - (msg_w div 2); 
			msg_y = (gh div 2) - (msg_h div 2);
		}
		
		draw_text_drop_shadow(msg_x, msg_y, _msg, msg_color, c_black, 1, 1);
		#endregion
		break;
	
	case MATCH_STAGE.MATCH_TIMBER:
		#region WAIT
		msg_w = sprite_get_width(sprTIMBER);
		msg_h = sprite_get_height(sprTIMBER);
		msg_x = (gw div 2) - (msg_w div 2);
		msg_y = (gh div 2) - (msg_h div 2);
		draw_sprite(sprTIMBER,0, msg_x, msg_y);
		
		#endregion
		break;
		
	case MATCH_STAGE.FINISH_HER:
		#region FINISH HER
		msg_w = sprite_get_width(sprFinishHer);
		msg_h = sprite_get_height(sprFinishHer);
		
		msg_x = (gw div 2) - (msg_w div 2);
		msg_y = (gh div 2) - (msg_h div 2);
		
		draw_sprite(sprFinishHer, msg_color, msg_x, msg_y);	
		#endregion
		break;
		
	case MATCH_STAGE.MATCH_END:
		//Victory
		#region VICTORY MESSAGE
		
		var KilledPlayerYet = false;
		with (PLAYER_1_OBJ) {if (GIFTED) {KilledPlayerYet = true;} }
		with (PLAYER_2_OBJ) {if (GIFTED) {KilledPlayerYet = true;} }
		if (KilledPlayerYet) {
		
			//draw big victory graphics
			if (MATCH_WINNER == PLAYERS.PLAYER_1) { _msg =  "PLAYER 1 WINS!"; msg_color = 0; } 
			else if (MATCH_WINNER == PLAYERS.PLAYER_2) { _msg =  "PLAYER 2 WINS!"; msg_color = 1; } 
			else { _msg = "IT'S A TIE?"; msg_color = 2; }
		
			msg_w = sprite_get_width(sprPlayerVictory);
			msg_h = sprite_get_height(sprPlayerVictory);
		
			msg_x = (gw div 2) - (msg_w div 2);
			msg_y = (gh div 2) - (msg_h div 2);
		
			draw_sprite(sprPlayerVictory, msg_color, msg_x, msg_y);		
		
		} else {
		
			msg_w = sprite_get_width(sprFinishHer);
			msg_h = sprite_get_height(sprFinishHer);
		
			msg_x = (gw div 2) - (msg_w div 2);
			msg_y = (gh div 2) - (msg_h div 2);
		
			draw_sprite(sprFinishHer, msg_color, msg_x, msg_y);	
		
		}
		#endregion
		break;

}