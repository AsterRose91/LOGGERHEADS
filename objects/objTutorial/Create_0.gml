/// @description A TUTORIAL

// TEST! BLURRING THE BACKGROUNDS BEHIND MENUS
BUFFER = 0;
BLUR_AMT = 0;
BLUR_AMT_MAX = 4;
BLUR_FILTER = "_effect_gaussian_blur"; //"_filter_large_blur"; // "_filter_linear_blur";	//replace with kawase blur?
BLUR_PARAM = "g_numDownsamples"; //"g_Radius";// "g_LinearBlurVector";	

MENU_BLUR_FX_LAYER = layer_create(-10000, "BLURRING_LAYER");
MENU_BLUR_FILTER = fx_create(BLUR_FILTER); // LINEAR BLUR?
layer_set_fx(MENU_BLUR_FX_LAYER , MENU_BLUR_FILTER);
fx_set_parameter(MENU_BLUR_FILTER, BLUR_PARAM, 0);

JOURNAL_ACTIVE = false;

JOURNAL_CURRENT_PAGE = 0;
JOURNAL_MAX_PAGES = 5;

TURN_PAGE = function(_turn_direction = 1) {
	JOURNAL_CURRENT_PAGE = (JOURNAL_CURRENT_PAGE + _turn_direction) mod JOURNAL_MAX_PAGES;
	return
};