var ww = argument0;
var xx = argument1;
var yy = argument2;
var horizontal = argument3;
var neg = argument4;

if horizontal then
	{
	if neg then
		{
		for (var i = 0; i < ww; i++)
			{
			if !place_free(xx - i * 32, yy) or collision_rectangle(xx - i * 32, yy, xx - i * 32 - 32, yy + 32, obj_tree, false, true) or collision_rectangle(xx - i * 32, yy, xx - i * 32 - 32, yy + 32, obj_big_rock, false, true) or collision_rectangle(xx - i * 32, yy, xx - i * 32 - 32, yy + 32, obj_small_tree, false, true) or collision_rectangle(xx - i * 32, yy, xx - i * 32 - 32, yy + 32, obj_small_rock, false, true) or collision_rectangle(xx - i * 32, yy, xx - i * 32 - 32, yy + 32, obj_build_site, false, true) or collision_rectangle(xx - i * 32, yy, xx - i * 32 - 32, yy + 32, obj_stockpile, false, true) then
				{
				return false;
				}
			}

		for(var j = 0; j < 2; j++)
			{
			for(var i = 0; i < road_size * 2; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(global.ground_tilemap_grass, xx - i * 16, yy + j * 16));
				if (tl >= 4) then
					{
					return false;
					}
				}
			}

		return true;		
		}
	else
		{
		for (var i = 0; i < ww; i++)
			{
			if !place_free(xx + i * 32, yy) or collision_rectangle(xx + i * 32, yy, xx + i * 32 + 32, yy + 32, obj_tree, false, true) or collision_rectangle(xx + i * 32, yy, xx + i * 32 + 32, yy + 32, obj_big_rock, false, true) or collision_rectangle(xx + i * 32, yy, xx + i * 32 + 32, yy + 32, obj_small_tree, false, true) or collision_rectangle(xx + i * 32, yy, xx + i * 32 + 32, yy + 32, obj_small_rock, false, true) or collision_rectangle(xx + i * 32, yy, xx + i * 32 + 32, yy + 32, obj_build_site, false, true) or collision_rectangle(xx + i * 32, yy, xx + i * 32 + 32, yy + 32, obj_stockpile, false, true) then
				{
				return false;
				}
			}

		for(var j = 0; j < 2; j++)
			{
			for(var i = 0; i < road_size * 2; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(global.ground_tilemap_grass, xx + i * 16, yy + j * 16));
				if (tl >= 4) then
					{
					return false;
					}
				}
			}

		return true;
		}
	}
else
	{
	if neg then
		{
		for (var i = 0; i < ww; i++)
			{
			if !place_free(xx, yy - i * 32) or collision_rectangle(xx, yy - i * 32, xx + 32, yy - i * 32 - 32, obj_tree, false, true) or collision_rectangle(xx, yy - i * 32, xx + 32, yy - i * 32 - 32, obj_big_rock, false, true) or collision_rectangle(xx, yy - i * 32, xx + 32, yy - i * 32 - 32, obj_small_tree, false, true) or collision_rectangle(xx, yy - i * 32, xx + 32, yy - i * 32 - 32, obj_small_rock, false, true) or collision_rectangle(xx, yy - i * 32, xx + 32, yy - i * 32 - 32, obj_build_site, false, true) or collision_rectangle(xx, yy - i * 32, xx + 32, yy - i * 32 - 32, obj_stockpile, false, true) then
				{
				return false;
				}
			}

		for(var j = 0; j < 2; j++)
			{
			for(var i = 0; i < road_size * 2; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(global.ground_tilemap_grass, xx + j * 16, yy - i * 16));
				if (tl >= 4) then
					{
					return false;
					}
				}
			}

		return true;		
		}
	else
		{
		for (var i = 0; i < ww; i++)
			{
			if !place_free(xx, yy + i * 32) or collision_rectangle(xx, yy + i * 32, xx + 32, yy + i * 32 + 32, obj_tree, false, true) or collision_rectangle(xx, yy + i * 32, xx + 32, yy + i * 32 + 32, obj_big_rock, false, true) or collision_rectangle(xx, yy + i * 32, xx + 32, yy + i * 32 + 32, obj_small_tree, false, true) or collision_rectangle(xx, yy + i * 32, xx + 32, yy + i * 32 + 32, obj_small_rock, false, true) or collision_rectangle(xx, yy + i * 32, xx + 32, yy + i * 32 + 32, obj_build_site, false, true) or collision_rectangle(xx, yy + i * 32, xx + 32, yy + i * 32 + 32, obj_stockpile, false, true) then
				{
				return false;
				}
			}

		for(var j = 0; j < 2; j++)
			{
			for(var i = 0; i < road_size * 2; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(global.ground_tilemap_grass, xx + j * 16, yy + i * 16));
				if (tl >= 4) then
					{
					return false;
					}
				}
			}

		return true;
		}
	}