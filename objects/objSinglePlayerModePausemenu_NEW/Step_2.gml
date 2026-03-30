/// @description UNIQUE MENU CODE SHOULD BE KEPT IN A SEPARATE STEP EVENT
if ( isHubLevel(room) ) {
	MENU_ELEMENTS[2].disable();
	MENU_ELEMENTS[2].hide();
	MENU_ELEMENTS[3].disable();
	MENU_ELEMENTS[3].hide();
} else {
	MENU_ELEMENTS[2].enable();
	MENU_ELEMENTS[2].show();
	MENU_ELEMENTS[3].enable();
	MENU_ELEMENTS[3].show();
}
//MENU_RESIZE();
var _newSize = MenuResizeFunctionNew(MENU_ELEMENTS, MENU_PAD);
MENU_WIDTH = _newSize.width;
MENU_HEIGHT = _newSize.height;