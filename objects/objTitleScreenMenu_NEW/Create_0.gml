/// @description CREATE BUTTONS
event_inherited();

DO_BLUR = false;
MENU_ACTIVE = true;
DRAW_BACK = false;

MENU_ELEMENTS = [
	new GUIImage(		sprGameTitleLogo, 
						0, 
						(GUI_W div 2) - 160, 
						(GUI_H div 2) - 112),	//logo
	
	new SpriteButton(	sprButtons_transbackNEW, 
						0, 
						(GUI_W div 6) - 32, 
						(GUI_H div 6) * 4, 
						[gotoLevelWithTransition, SPECIALROOMS.LEVEL_SELECT ,TRANSITION_TYPES.PIXELATE],
						sprMenuBack2NEW ),			//Single player
						
	new SpriteButton(	sprButtons_transbackNEW, 
						1, 
						(2 * (GUI_W div 6)) - 32, 
						(GUI_H div 6) * 4, 
						[gotoLevel, SPECIALROOMS.VERSUS_MODE], 
						sprMenuBack2NEW ),			//VS mode
	
	
	new SpriteButton(	sprButtons_transbackNEW, 
						3, 
						(3 * (GUI_W div 6)) - 32, 
						(GUI_H div 6) * 4, 
						[ActivateMenu, objSettingsMenu, objTitleScreenMenu_NEW], 
						sprMenuBack2NEW ),			//Setup
	
	new SpriteButton(	sprButtons_transbackNEW, 
						4, 
						(4 * (GUI_W div 6)) - 32, 
						(GUI_H div 6) * 4, 
						[do_nothing], 
						sprMenuBack2NEW ),			//Help
	
	new SpriteButton(	sprButtons_transbackNEW, 
						2, 
						(5 * (GUI_W div 6)) - 32, 
						(GUI_H div 6) * 4, 
						[Quit], 
						sprMenuBack2NEW ),			//Quit
];