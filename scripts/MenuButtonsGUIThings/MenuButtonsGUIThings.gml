//global.element_id_counter = 0;

///@func GUIButton() 
///@desc Parent struct to all the buttons and GUI elements
///@returns {struct}
function GUIButton() constructor {
	//self.id = global.element_id_counter++;
	static _ElementGUIid = 0;
	self.name = "BASE GUI ELEMENT";
	
	self.x = 0; 
	self.y = 0; 
	self.w = 1; 
	self.h = 1;
	self.enabled= true;
	self.visible = true;
	self.has_focus = false;
	self.do_action = do_nothing();

	self.play_sound_on_click = sfxClick;
	
	static show = function() {self.visible = true;}
	static hide = function() {self.visible = false;}
	static enable = function() {self.enabled = true;}
	static disable = function() {self.enabled = false;}
	static mouseover = function() {
		return point_in_rectangle(GUI_MOUSE_X, GUI_MOUSE_Y, self.x, self.y, self.x + self.w, self.y + self.h);
	}
	///@func draw()
	static draw = function() { if (!self.visible) {return;} }
	
	///@func step()
	static step = function() { if (click()) {do_stuff();} }
	
	///@func click()
	static click = function() {
		// ONLY ENABLED GUI ELEMENTS REGISTER CLICKS
		if (!self.enabled) {exit;}
		// REPLACE OLD KEY PRESSED FUNCTION WITH NEW INPUT BASED FUNCTION
		if (self.has_focus && (mouse_check_button_pressed(mb_left) || input_check_pressed("CHOP") )) {
			return true;
		}
		return false;
	}
	
	///@func do_stuff()
	///@desc perform associated actions
	static do_stuff = function() {
		debug_msg($"GUI element {self.name} with id {self._ElementGUIid} was clicked!");
		
		if (self.play_sound_on_click != noone) { play_sfx(self.play_sound_on_click); }
		
		try {
			// CHECK IF self.do_action IS AN ARRAY
			if (is_array(self.do_action)) {		
				// IF IT IS, THE FIRST ELEMENT IS THE ACTUAL FUNCTION THAT NEEDS TO BE RUN
				// THE OTHER ELEMENTS ARE PARAMETERS
				var _act = self.do_action[0];	
				if (array_length(self.do_action) == 1) {
					// THERE IS SOMEHOW ONLY A SINGLE PARAMETER
					debug_msg($"GUI element {self.name} with id {self._ElementGUIid} is performing {script_get_name(_act)}");
					script_execute(_act);
				} else {
					debug_msg($"GUI element {self.name} with id {self._ElementGUIid} is performing {script_get_name(_act)} with parameters {self.do_action}");
					script_execute_ext(_act, self.do_action, 1);
				} 
			} else {
				
				// IF self.do_action IS NOT AN ARRAY IT MUST BE A FUNCTION
				if (self.do_action != noone) {
					script_execute(self.do_action); 
				} else {debug_msg("No action defined for this GUI element");}
				
			}
			
		} catch (e) { debug_msg( string(e) ); }
	}
	
	_ElementGUIid++;
}

/// @func SpriteButton(sprite_index, image_index, x, y, [do_action], [background], [play_sound_on_click], [name])  
/// @desc a button with a sprite inside it
/// @param {Asset.GMSprite} sprite_index the sprite to use
/// @param {real} [image_index] the image of the sprite to use
/// @param {real} [x] the x-coordinate for the button
/// @param {real} [y] the y-coordinate for the button
/// @param {function | array<function> | array<any>} [do_action] Associated function and/or parameters
/// @param {Asset.GMSprite} [background] Background
/// @param {Asset.gmsound} [play_sound_on_click] Sound effect
/// @param {string} [name] Special name for GUI element
/// @returns {struct} Description
function SpriteButton(sprite_index, image_index = 0, x = 0, y = 0, do_action = do_nothing, background = sprMenuBackNone, play_sound_on_click = sfxClick, name = "SPRITE BUTTON") : GUIButton() constructor {
	self.sprite_index = sprite_index;
	self.image_index = image_index;
	
	self.image_alpha = 1;
	self.image_blend = c_white;
	self.image_angle = 0;
	self.image_xscale = 1;
	self.image_yscale = 1;
	
	self.x = x; 
	self.y = y; 
	self.w = sprite_get_width(sprite_index) ?? 1;
	self.h = sprite_get_height(sprite_index) ?? 1;
	self.do_action = do_action; //is_null(argument[4], noone);
	self.background = background; //is_null(argument[5], sprMenuBackNone);
	self.play_sound_on_click = play_sound_on_click;
	self.name = name;
	
	//drawing
	///@function draw()
	static draw = function() { 
		if (!self.visible) {return;}
		if (self.background != noone)  {
			draw_sprite_stretched_ext(self.background, self.has_focus, self.x, self.y, self.w, self.h, self.image_blend, self.image_alpha);
		}
		draw_sprite_ext(self.sprite_index, self.image_index, self.x, self.y, self.image_xscale, self.image_yscale, self.image_angle, self.image_blend, self.image_alpha);
	}	
	
	_ElementGUIid++;
}

/// @desc  CheckboxButton([sprite_index], [image_index], x, y, [do_action], [background], [play_sound_on_click], [name], [param_monitor])  Checkbox/toggle for certain things, monitors a global variable's current value
/// @param {asset.GMSprite} [sprite_index] the image being used
/// @param {real} [image_index] indicator
/// @param {real} [x] X-position
/// @param {real} [y] Y-position
/// @param {Function | Array<Function>} [do_action] Function
/// @param {Asset.GMSprite} [background] Description
/// @param {Asset.GMSound} [play_sound_on_click]Sound effect
/// @param {string} [name] Special name
/// @param {string} [param_monitor] global variable being monitored
function CheckboxButton(sprite_index = sprButtonsSmall_transbackNEW, image_index = 3, x = 0, y = 0, do_action = do_nothing, background = sprMenuBackSmallNEW, play_sound_on_click = sfxClick, name = "CHECKBOX BUTTON", param_monitor = "") : GUIButton() constructor {
	self.sprite_index = sprite_index;
	self.image_index = image_index;
	self.x = x; 
	self.y = y; 
	self.w = sprite_get_width(sprite_index) ?? 1;
	self.h = sprite_get_height(sprite_index) ?? 1;
	self.do_action = do_action; 
	self.background = background;
	self.play_sound_on_click = play_sound_on_click;
	self.name = "CHECKBOX BUTTON";
	self.param_monitor = param_monitor;
	
	static check_param = function() {
		if (variable_global_exists(self.param_monitor)) {
			return variable_global_get(self.param_monitor);		
		}
		return false;
	}
	
	//drawing
	///@function draw()
	static draw = function() { 
		if (!self.visible) {return;}
		if (self.background != noone)  {
			draw_sprite_stretched(self.background, self.has_focus, self.x, self.y, self.w, self.h);
		}
		draw_sprite(self.sprite_index, self.check_param()?3:2, self.x, self.y);
	}	
	_ElementGUIid++;
}

///@func TextButton(message, x, y, pad, [do_action], [background], [play_sound_on_click], [name])
///@desc a Button with a text caption
///@arg {string} message
///@arg {real} x
///@arg {real} y
///@arg {real} pad
///@arg {Function|Array<Function>|Array<Any>} [do_action]
///@arg {Asset.GMSprite} [background]
///@arg {Asset.GMSound} [play_sound_on_click]
///@arg {string} [name]
///@returns {struct}
function TextButton(message = "UNDEFINED!", x = 0, y = 0, pad = 4, do_action = do_nothing, sprite_index = sprMenuBack1NEW, play_sound_on_click = sfxClick, name = "TEXT BUTTON") : GUIButton() constructor{
	self.sprite_index = sprite_index; //background sprite
	self.image_index = 0;
	self.message = message; 
	self.x = x; 
	self.y = y; 
	
	self.image_alpha = 1;
	self.image_blend = c_white;
	
	self.pad = pad; 
	self.w = string_width(message) + (2 * self.pad); 
	self.h = string_height(message) + (2 * self.pad);
	self.do_action = do_action; 
	self.play_sound_on_click = play_sound_on_click;
	self.name = name;

	//drawing
	///@function draw()
	static draw = function() { 
		if (!visible) {return;}
		draw_text_box(self.x, self.y, self.w, self.h, self.message, self.sprite_index, self.has_focus, self.pad, true);
		
	}
	_ElementGUIid++;
}

///@func GUITextMessage(message, x, y, pad, [name])
///@desc just a text bubble
///@arg {string} message
///@arg {real} x
///@arg {real} y
///@arg {real} pad
///@arg {string} [name]
///@returns {struct}
function GUITextMessage(message = "CAPTION!", x = 0, y = 0, pad = 2, name = "GUI TEXT MESSAGE") : TextButton(message, x, y, pad) constructor {
	self.sprite_index = sprMenuBackNone;
	self.image_index = 0;
	self.message = message; 
	self.x = x; 
	self.y = y; 
	self.pad = pad; 
	self.w = string_width(self.message) + (2 * self.pad);
	self.h = string_height(self.message) + (2 * self.pad);
	self.do_action = noone; // does nothing when clicked
	self.enabled = false;
	self.visible = true;
	self.name = name;
	static enable = function() {return;} // cannot be enabled
	static disable = function() {return;} // cannot be disabled
	
	_ElementGUIid++;
}

///@func GUIImage(sprite_index, image_index, x, y)
///@desc just a picture
///@arg {Asset.GMSprite} sprite_index
///@arg {real} image_index
///@arg {real} x
///@arg {real} y
///@returns {struct}
function GUIImage(sprite_index, image_index = 0, x = 0, y = 0, name = "GUI IMAGE") : SpriteButton(sprite_index, image_index, x, y) constructor{
	self.sprite_index = sprite_index;
	self.image_index = image_index; 
	self.x = x; 
	self.y = y;
	self.w = sprite_get_width(sprite_index);
	self.h = sprite_get_height(sprite_index);	
	self.do_action = do_nothing;
	self.background = sprMenuBackNone;
	self.name = name;
	
	_ElementGUIid++;
}

#region SPECIAL/SPECIFIC GUI ELEMENTS

///@func VolumeButton(x, y, [bgm_or_sfx], [amount])
///@desc creates a volume change button
///@arg {real} x
///@arg {real} y
///@arg {bool} [bgm_or_sfx] true for a BGM button, false for SFX
///@arg {real} [amount] should be either +1 or -1
///@returns {struct}
function VolumeButton(x, y, bgm_or_sfx, amount) {
	var option = bgm_or_sfx ? change_music_volume : change_sound_volume ;
	var img = (amount > 0) ? 0 : 1;
	return new SpriteButton( 
		sprButtonsSmall_transbackNEW
		,img
		,x
		,y
		,[option, sign(amount)]
		,sprMenuBackSmallNEW
	);
}

///@func VolumeIndicator(x, y, [bgm_or_sfx])
///@desc acts as a volume indicator
///@arg {real} x
///@arg {real} y
///@arg {bool} [bgm_or_sfx] true for a BGM button, false for SFX
///@returns {struct}
function VolumeIndicator(x, y, bgm_or_sfx = true) : GUIButton() constructor {
	self.x = x;
	self.y = y;
	self.sprite_index = sprButtons_volumeIndicator_backNEW;
	self.indicator_index = sprButtons_volumeIndicator_arrowNEW; 
	self.w = sprite_get_width(sprite_index);
	self.h = sprite_get_height(sprite_index);
	
	self.is_bgm = bgm_or_sfx ?? true;
	
	static draw = function() {
		var _lerp = 0;
		if (is_bgm) { _lerp = lerp(0, self.w - 10, BGM_VOL); }
		else { _lerp = lerp(0, self.w - 10, SFX_VOL); }
		draw_sprite_ext(self.sprite_index, 0, self.x, self.y, 1, 1, 0, c_white, 1);	
		draw_sprite_ext(self.indicator_index, 0, self.x + _lerp, self.y, 1, 1, 0, c_white, 1);
	}
}

///@func GamespeedIndicator(x, y)
///@desc acts as a volume indicator
///@arg {real} x
///@arg {real} y
///@returns {struct}
function GamespeedIndicator(x, y) : GUIButton() constructor {
	self.x = x;
	self.y = y;
	self.sprite_index = sprButtons_volumeIndicator_backNEW;
	self.indicator_index = sprButtons_volumeIndicator_arrowNEW; 
	self.w = sprite_get_width(sprite_index);
	self.h = sprite_get_height(sprite_index);
	
	static draw = function() {
		var _lerp = 0;
		
		//_lerp = lerp(0, self.w - 10, BGM_VOL);
		_lerp = remap(MOVEMENT_SPEEDSETTING, MIN_MOVESPEED, MAX_MOVESPEED, 0, self.w - 10);
		draw_sprite_ext(self.sprite_index, 0, self.x, self.y, 1, 1, 0, c_white, 1);	
		draw_sprite_ext(self.indicator_index, 0, self.x + _lerp, self.y, 1, 1, 0, c_white, 1);
	}
}


///@func GUIUserInputTextDisplayer(x, y): TextButton() {
///@desc displays what the user has input so far.
function GUIUserInputTextDisplayer(message, x, y, pad): TextButton(message, x, y, pad) constructor {
	self.id = global.element_id_counter++;
	self.sprite_index = sprMenuBackNone;
	self.image_index = 0;
	self.x = x;					//is_null(_x, 0);
	self.y = y;					//is_null(_y, 0);
	self.pad = pad;				//is_null(_pad, 2);
	self.w = 240; //string_width(self.message) + (2 * self.pad);
	self.h = 20; //string_height(self.message) + (2 * self.pad);
	self.do_action = noone;		// does nothing when clicked
	self.enabled = false;
	self.visible = true;
	self.name = name;
	static enable = function() {return;} // cannot be enabled
	static disable = function() {return;} // cannot be disabled
	///@function draw()
	static draw = function() { 
		// use message variable to get contents of a global variable?
		var _ = "";
		//draw_text_box(self.x, self.y, self.w, self.h, _, self.sprite_index, self.has_focus, self.pad, true);
		draw_sprite_ext(sprTextInputBoxBack,0,self.x, self.y, 1, 1, 0, c_white, 1);
		//if variable_global_exists(self.message){
		if (instance_exists(objTextEntry)) {
			//_ = string(variable_global_get(self.message));
			with (objTextEntry) {_ = TEXT_INPUT;}
		}
		if (!visible) {return;}
		draw_text_box(self.x, self.y, self.w, self.h, _, self.sprite_index, self.has_focus, self.pad, true);
		
	}

}

///@func GamespeedButton(x, y, [amount])
///@desc creates a speed change button
///@arg {real} x
///@arg {real} y
///@arg {real} [amount] should be either +1 or -1
///@returns {Struct.SpriteButton}
function GamespeedButton(x, y, amount = 1) {
	var option = change_game_speed;
	var img = (amount > 0) ? 0 : 1;
	return new SpriteButton( 
		sprButtonsSmall_transbackNEW
		,img
		,x
		,y
		,[option, sign(amount)]
		,sprMenuBackSmallNEW
	);
}

///@func PartsIndicator(x, y)
///@desc checkbox for if particles are enabled
///@arg {real} x
///@arg {real} y
///@returns {Struct.CheckboxButton}
function PartsIndicator(x, y){
	return new CheckboxButton( 
		sprButtonsSmall_transbackNEW
		,3
		,x
		,y
		,[ToggleParticles]
		,sprMenuBackSmallNEW
		,sfxClick
		,"PARTICLES CHECKBOX"
		,"particles_enabled"
	);
}

///@func GridIndicator(x, y)
///@desc checkbox for if the grid is enabled
///@arg {real} x
///@arg {real} y
///@returns {Struct.CheckboxButton}
function GridIndicator(x, y){
	return new CheckboxButton( 
		sprButtonsSmall_transbackNEW
		,3
		,x
		,y
		,[ToggleGrid]
		,sprMenuBackSmallNEW
		,sfxClick
		,"GRID CHECKBOX"
		,"show_grid"
	);
}

///@func FullscreenIndicator(x, y)
///@desc checkbox for fullscreen mode
///@arg {real} x
///@arg {real} y
///@returns {Struct.CheckboxButton}
function FullscreenIndicator(x, y){
	return new CheckboxButton( 
		sprButtonsSmall_transbackNEW
		,3
		,x
		,y
		,[ToggleFullscreen]
		,sprMenuBackSmallNEW
		,sfxClick
		,"FULLSCREEN CHECKBOX"
		,"game_fullscreen"
	);
}

///@func MovehintsIndicator(x, y)
///@desc checkbox for movement hints
///@arg {real} x
///@arg {real} y
///@returns {Struct.CheckboxButton}
function MovehintsIndicator(x, y){
	return new CheckboxButton( 
		sprButtonsSmall_transbackNEW
		,3
		,x
		,y
		,[ToggleMovehints]
		,sprMenuBackSmallNEW
		,sfxClick
		,"MOVEMENT HINTS CHECKBOX"
		,"movement_hints"
	);
}

///@func ErrorCorrectionIndicator(x, y)
///@desc checkbox for "Error Correction"
///@arg {real} x
///@arg {real} y
///@returns {Struct.CheckboxButton}
function ErrorCorrectionIndicator(x, y){
	return new CheckboxButton( 
		sprButtonsSmall_transbackNEW
		,3
		,x
		,y
		,[ToggleErrorCorrection]
		,sprMenuBackSmallNEW
		,sfxClick
		,"ERROR CORRECTION CHECKBOX"
		,"enable_secrets"
	);
}

#endregion

#region MISC GUI FUNCTIONS

///@func do_nothing()
///@desc literally does nothing
function do_nothing() {
	//debug_msg("DOES NOTHING!");
	// OH THANK GOD, THAT'S WHERE THAT WAS COMING FROM
	return;
}

///@func draw_gui_element(gui_element)
///@desc calls the draw function of a GUIButton struct
///@arg {struct} gui_element
function draw_gui_element(gui_element) { gui_element.draw(); }

///@func gui_element_do_step(gui_element)
///@desc calls the step function of a GUIButton struct
///@arg {struct} gui_element
function gui_element_do_step(gui_element) { gui_element.step(); }

///@func gui_element_defocus(gui_element)
///@desc sets has_focus to false for the specified GUI element
///@arg {struct} gui_element
function gui_element_defocus(gui_element) {gui_element.has_focus = false;}

///@func gui_element_mouseover(gui_element)
///@desc sets a GUI element's has_focus to true if it's enabled and you mouse over it
///@arg {struct} gui_element
function gui_element_mouseover(gui_element) { if (gui_element.mouseover() && gui_element.enabled) {gui_element.has_focus = true;} else {gui_element.has_focus = false;} }
#endregion

#region TEXT ENTRY 

///	THERE IS ONLY ONE MENU OBJECT THAT TAKES TEXT NOW

///@func gui_append_letter(letter)
///@desc add text to the text entry holding thingy.
///@param {String} letter
function gui_append_letter(letter) {
	var _singleLetter = string_copy(letter, 0, 1); // only the first letter
	if (string_length(_singleLetter) > 0) {
		with (objTextEntry) {TEXT_INPUT += _singleLetter;}
		return true;
	}	
	return false;
}

///@func gui_text_backspace()
///@desc backspace
function gui_text_backspace() {

	with (objTextEntry) {
		var _len = string_length(TEXT_INPUT);
		if (_len <= 0) {return false;}
		var _newtext = string_copy(TEXT_INPUT, 0, _len - 1);
		TEXT_INPUT = _newtext;
	}
	return true;
}

///@func gui_text_clear()
///@desc clear
function gui_text_clear() {
	//global.TextEntryHolder = "";
	with (objTextEntry) {
		TEXT_INPUT = "";
	}
	return true;
}

#endregion

///@func MenuResizeFunctionNew(array_menuelements, [pad])
///@desc resizes the menu window based on the positions/sizes + padding of buttons/elements within the menu
///@arg {Array<Struct.GUIButton>} array_menuelements
///@arg {Real} [pad]
///@returns {Struct<Real, Real>}
function MenuResizeFunctionNew(array_menuelements, pad = 2){
	var _width = 0, _height = 0;
	
	var min_x = array_menuelements[0].x - pad, 
		max_x = array_menuelements[0].x + array_menuelements[0].w + pad, 
		min_y = array_menuelements[0].y, 
		max_y = array_menuelements[0].y + array_menuelements[0].h + pad;
	
	// WORK OUT THE BIGGEST AND SMALLEST X, Y VALUES
	var i, j;
	for (i = 0; i < array_length(array_menuelements); i++) {
		j = array_menuelements[i];
		min_x = min( j.x - pad, min_x);
		max_x = max( j.x + j.w + pad, max_x);
		min_y = min( j.y - pad, min_y);
		max_y = max( j.y + j.h + pad, max_y);
	}
	x = min_x;
	y = min_y;
	_width = abs(max_x - min_x);
	_height = abs(max_y - min_y);

	return {width: _width, height: _height};
}