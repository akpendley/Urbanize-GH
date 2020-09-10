function createTiles() {
	global.ground_layer = layer_create(0);
	global.ground_tilemap_grass = layer_tilemap_create(global.ground_layer, 0, 0, tileset_grass, room_width, room_height);


	for(var j = 0; j < height; j++)
		{
		for(var i = 0; i < width; i++)
			{
				var zz = ds_grid_get(land_grid, i, j);
				if zz < 30 then
					{
						tilemap_set(global.ground_tilemap_grass, 4, i, j); //water
					}
				else
					{
						tilemap_set(global.ground_tilemap_grass, 2, i, j); //grass	
					}
			}
		}

	tilemap = global.ground_tilemap_grass;


	//Left Border Water Removal
	var left_lim = 300;
	for(var j = 0; j < height; j++)
		{
		for(var i = 0; i < width; i++)
			{
			var tl = tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16));
			if (tl = 4) then
				{
				if i * 16 < left_lim then
					{
					tilemap_set(tilemap, 2, i, j);	//change the water to grass																					
					}
				}
			}
		}




	var still_bad = true;

	while still_bad
		{	
		var changed_tiles = 0;
		for(var j = 0; j < height; j++)
			{
			for(var i = 0; i < width; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16));
				if (tl = 4) then
					{
					//im water, check for at least 2 water around me. if < 4 water around me, turn me into grass
					var total_water = 0;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16)) = 4 then
						total_water += 1;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 - 16)) = 4 then
						total_water += 1;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16)) = 4 then
						total_water += 1;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 + 16)) = 4 then
						total_water += 1;
					if total_water < 2 then
						{
						changed_tiles += 1;
						tilemap_set(tilemap, 2, i, j);
						}																						
					}
				}
			}
	//Island and Peninsula Detection
		for(var j = 0; j < height; j++)
			{
			for(var i = 0; i < width; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16));
				if (tl = 2) then
					{
					//im ground, check for 4 water around me. if  4 water around me, turn me into water
					var total_water = 0;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16)) = 4 then
						total_water += 1;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 - 16)) = 4 then
						total_water += 1;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16)) = 4 then
						total_water += 1;
					if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 + 16)) = 4 then
						total_water += 1;
					if total_water > 2 then
						{
						changed_tiles += 1;
						tilemap_set(tilemap, 4, i, j);	
						}																					
					}
				}
			}
		if changed_tiles = 0 then
			still_bad = false;
		}		
			
	//Tileset water tiles

	for(var j = 0; j < height; j++)
		{
		for(var i = 0; i < width; i++)
			{
			var tl = tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16));
			if (tl = 4) then
				{
				var tl = false;
				var tm = false;
				var tr = false;
				var ml = false;
				var mr = false;
				var bl = false;
				var bm = false;
				var br = false;
			
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16)) = 2 then
					ml += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 - 16)) = 2 then
					tm += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16)) = 2 then
					mr += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 + 16)) = 2 then
					bm += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16 - 16)) = 2 then
					tl += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16 - 16)) = 2 then
					tr += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16 + 16)) = 2 then
					br += 1;
				if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16 + 16)) = 2 then
					bl += 1;
				if tm and ml then
					{
					tilemap_set(tilemap, 9, i, j);
					}
				if tm and mr then
					{
					tilemap_set(tilemap, 11, i, j);
					}	
				if bm and ml then
					{
					tilemap_set(tilemap, 24, i, j);
					}	
				if bm and mr then
					{
					tilemap_set(tilemap, 27, i, j);
					}	
				if tl and !tm and !ml and !mr and !bm then
					{
					tilemap_set(tilemap, 22, i, j);
					}
				if tr and !tm and !ml and !mr and !bm then
					{
					tilemap_set(tilemap, 21, i, j);
					}	
				if bl and !tm and !ml and !mr and !bm then
					{
					tilemap_set(tilemap, 18, i, j);
					}	
				if br and !tm and !ml and !mr and !bm then
					{
					tilemap_set(tilemap, 17, i, j);
					}	
				if !tm and !ml and !mr and bm then
					{
					tilemap_set(tilemap, 25, i, j);
					}
				if !tm and !ml and mr and !bm then
					{
					tilemap_set(tilemap, 15, i, j);
					}	
				if !tm and ml and !mr and !bm then
					{
					tilemap_set(tilemap, 16, i, j);
					}	
				if tm and !ml and !mr and !bm then
					{
					tilemap_set(tilemap, 10, i, j);
					}																					
				}
			}
		}			
			
	//Randomize the grass tiles and create obj_waters
	for(var j = 0; j < height; j++)
		{
		for(var i = 0; i < width; i++)
			{
			var tl = tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16));
			if (tl = 2) then
				{
				tilemap_set(tilemap, choose(1,2,3), i, j);																					
				}
			}
		}			
			
			
			
			
			
			
			
			
			
			
			//else if (tl = 2) then
			//	{
			//	////im grass, check for at least 4 grass around me, if < 4 grass then turn into water
			//	//var total_grass = 0;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16 - 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16 - 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 - 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 - 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16 - 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16 - 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16 + 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 - 16, j * 16 + 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 + 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16, j * 16 + 16)) = 5 then
			//	//	total_grass += 1;
			//	//if tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16 + 16)) = 2 or tile_get_index(tilemap_get_at_pixel(tilemap, i * 16 + 16, j * 16 + 16)) = 5 then
			//	//	total_grass += 1;
			//	//if total_grass < 4 then
			//	//	tilemap_set(tilemap, 3, i, j);	
			//	//else
			//		tilemap_set(tilemap, choose(1,2,5), i, j);			
			//	}


}
