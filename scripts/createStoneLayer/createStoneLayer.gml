for(var j = 0; j < height; j++)
	{
	for(var i = 0; i < width; i++)
		{
			var zz = ds_grid_get(global.stone_density_grid, i, j);
			var zzz = ds_grid_get(land_grid, i, j);
			clamp(global.stone_density_grid[# i, j], 1, 100);
			if zzz < 35 then
				global.stone_density_grid[# i, j] = 0;
		}
	}