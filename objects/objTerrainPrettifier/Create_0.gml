/// @description a "manual" automatic tiling method

// USE THIS LAYER
terrain_types_tilemap = layer_tilemap_get_id("BaseTerrainTiles");

// TO FILL OUT THIS LAYER
terrain_pretty_tilemap = layer_tilemap_get_id("PrettifiedTerrain");

// AND THIS LAYER
collision_tilemap = layer_tilemap_get_id("CollisionTiles");

tilemap_width = tilemap_get_width(terrain_types_tilemap);
tilemap_height = tilemap_get_height(terrain_types_tilemap);

tiles_count = tilemap_width * tilemap_height;

var i, _tile, _row, _col, _index;
for (i = 0; i < tiles_count; i++) {
	// GET THE TERRAIN TYPE OF THE TILE AT THE CURRENT POSITION
	_row = i mod tilemap_width;
	_col = i div tilemap_width;
	_tile = tilemap_get(terrain_types_tilemap, _row, _col);	
	_index = tile_get_index(_tile);

	// WATER OR TREES
	if (_index == 4 || _index == 3) {
		// this means make it solid
		tilemap_set(collision_tilemap, 1, _row, _col);		
	} else {
		tilemap_set(collision_tilemap, 0, _row, _col);
	}
}

// THE TREES ARE BASED ON 2x2 tiles...
// NW NE
// SW SE
var _nw, _ne, _sw, _se;
for (_col = 1; _col < tilemap_height; _col += 2) {
	for (_row = 1; _row < tilemap_width; _row += 2) {
		
		_tile = tilemap_get(terrain_types_tilemap, _row, _col);	
		_nw = tile_get_index(_tile);
		
		_tile = tilemap_get(terrain_types_tilemap, _row + 1, _col);	
		_ne = tile_get_index(_tile);
		
		_tile = tilemap_get(terrain_types_tilemap, _row, _col + 1);	
		_sw = tile_get_index(_tile);
		
		_tile = tilemap_get(terrain_types_tilemap, _row + 1, _col + 1);	
		_se = tile_get_index(_tile);
		
		// NO TREE TILES
		if (_nw != 4 && _ne != 4 && _sw != 4 && _se != 4) {continue;}
		
		// ALL TREE
		if (_nw == 4 && _ne == 4 && _sw == 4 && _se == 4) {
			tilemap_set(terrain_pretty_tilemap,44, _row, _col);
			tilemap_set(terrain_pretty_tilemap,45, _row + 1,_col);
			tilemap_set(terrain_pretty_tilemap,62, _row, _col + 1);
			tilemap_set(terrain_pretty_tilemap,63, _row + 1,_col + 1);
		}
		
		// BOTTOM EDGE TREE
		if (_nw == 4 && _ne == 4 && _sw != 4 && _se != 4) {
			tilemap_set(terrain_pretty_tilemap,62, _row, _col);
			tilemap_set(terrain_pretty_tilemap,63, _row + 1,_col);
		}
		
		// TOP EDGE TREE
		if (_nw != 4 && _ne != 4 && _sw == 4 && _se == 4) {
			tilemap_set(terrain_pretty_tilemap,44, _row, _col + 1);
			tilemap_set(terrain_pretty_tilemap,45, _row + 1,_col + 1);
		}
		
		// LEFT EDGE TREE
		if (_nw == 4 && _ne != 4 && _sw == 4 && _se != 4) {
			tilemap_set(terrain_pretty_tilemap,45, _row, _col);
			tilemap_set(terrain_pretty_tilemap,63, _row, _col + 1);
		}
		
		// RIGHT EDGE TREE
		if (_nw != 4 && _ne == 4 && _sw != 4 && _se == 4) {
			tilemap_set(terrain_pretty_tilemap,44, _row + 1, _col);
			tilemap_set(terrain_pretty_tilemap,62, _row + 1, _col + 1);
		}
		
		
	
	}
}