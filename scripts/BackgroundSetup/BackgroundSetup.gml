
function auto_background_stuff(){
	/// SKY
	var sky_exists = layer_exists("BG_SKY");
	var sky_id = sky_exists ? layer_get_id("BG_SKY") : layer_create(900, "BG_SKY");
	var sky_bg_id = sky_exists ? layer_background_get_id(sky_id) : layer_background_create(sky_id, bgSkyNEW);
	
	layer_depth(sky_id, 900);
	layer_background_change(sky_bg_id, bgSkyNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(sky_bg_id, true);
	
	/// FAR CLOUDS
	var cloud1_exists = layer_exists("BG_CLOUDS_1");
	var cloud1_id = cloud1_exists ? layer_get_id("BG_CLOUDS_1") : layer_create(800, "BG_CLOUDS_1");
	var cloud1_bg_id = cloud1_exists ? layer_background_get_id(cloud1_id) : layer_background_create(cloud1_id, bgCloudsNEW);
	
	layer_background_change(cloud1_bg_id, bgClouds_backNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(cloud1_bg_id, true);
	layer_x(cloud1_id, irandom_range(0, GUI_W div 2));
	layer_hspeed(cloud1_id, 0.5);
	layer_depth(cloud1_id, 800);
	
	/// NEAR CLOUDS
	var cloud0_exists = layer_exists("BG_CLOUDS_0");
	var cloud0_id = cloud0_exists ? layer_get_id("BG_CLOUDS_0") : layer_create(700, "BG_CLOUDS_0");
	var cloud0_bg_id = cloud0_exists ? layer_background_get_id(cloud0_id) : layer_background_create(cloud0_id, bgCloudsNEW);
	
	layer_background_change(cloud0_bg_id, bgCloudsNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(cloud0_bg_id, true);
	layer_x(cloud0_id, irandom_range(0, GUI_W div 2));
	layer_y(cloud0_id, -20);
	layer_hspeed(cloud0_id, 1);
	layer_depth(cloud0_id, 700);
	
	/// FAR MOUNTAINS
	var mount1_exists = layer_exists("BG_MOUNT_1");
	var mount1_id = mount1_exists ? layer_get_id("BG_MOUNT_1") : layer_create(600, "BG_MOUNT_1");
	var mount1_bg_id = mount1_exists ? layer_background_get_id(mount1_id) : layer_background_create(mount1_id, bgMountains_backNEW);
	
	layer_background_change(mount1_bg_id, bgMountains_backNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(mount1_bg_id, true);
	layer_x(mount1_id, irandom_range(0, GUI_W div 2));
	layer_depth(mount1_id, 600);
	
	/// NEAR MOUNTAINS
	var mount0_exists = layer_exists("BG_MOUNT_0");
	var mount0_id = mount0_exists ? layer_get_id("BG_MOUNT_0") : layer_create(500, "BG_MOUNT_0");
	var mount0_bg_id = mount0_exists ? layer_background_get_id(mount0_id) : layer_background_create(mount0_id, bgMountains_frontNEW);
	
	layer_background_change(mount0_bg_id, bgMountains_frontNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(mount0_bg_id, true);
	layer_x(mount0_id, irandom_range(0, GUI_W div 2));
	layer_depth(mount0_id, 500);
	
	/// FAR TREES
	var tree1_exists = layer_exists("BG_TREE_1");
	var tree1_id = tree1_exists ? layer_get_id("BG_TREE_1") : layer_create(400, "BG_TREE_1");
	var tree1_bg_id = tree1_exists ? layer_background_get_id(tree1_id) : layer_background_create(tree1_id, bgTrees_backNEW);
	
	layer_background_change(tree1_bg_id, bgTrees_backNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(tree1_bg_id, true);
	layer_x(tree1_id, irandom_range(0, GUI_W div 2));
	layer_depth(tree1_id, 400);
	
	/// NEAR TREES
	var tree0_exists = layer_exists("BG_TREE_0");
	var tree0_id = tree1_exists ? layer_get_id("BG_TREE_0") : layer_create(300, "BG_TREE_0");
	var tree0_bg_id = tree1_exists ? layer_background_get_id(tree0_id) : layer_background_create(tree0_id, bgTrees_frontNEW);
	
	layer_background_change(tree0_bg_id, bgTrees_frontNEW); // IF ALREADY EXISTS BUT WRONG SPRITE, CHANGE IT
	layer_background_htiled(tree0_bg_id, true);
	layer_x(tree0_id, irandom_range(0, GUI_W div 2));
	layer_depth(tree0_id, 300);
	
	
	/// HOUSE LAYER
	var house_exists = layer_exists("BG_HOUSE");
	
	if (house_exists) {
		var house_id = layer_get_id("BG_HOUSE");
		layer_depth(house_id, 200);
	}
	
	


	/// TILESET
	var tile_layer_exists = layer_exists("Tiles_1");
	if (tile_layer_exists) {
		var tile_layer_id = layer_get_id("Tiles_1");
		layer_depth(tile_layer_id, 100);
	}
	
	var instance_layer_exists = layer_exists("Instances");
	if (instance_layer_exists){
		var inst_layer_id = layer_get_id("Instances");
		layer_depth(inst_layer_id, 0);
	}
	var player_layer_exists = layer_exists("Player");
	if (player_layer_exists){
		var player_layer_id = layer_get_id("Player");
		layer_depth(player_layer_id, -100);
	}
	
	
}