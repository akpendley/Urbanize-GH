function createFertilityLayer() {
	for(var j = 0; j < height; j++)
		{
		for(var i = 0; i < width; i++)
			{
				var zz = ds_grid_get(global.fertility_grid, i, j);
				var zzz = ds_grid_get(land_grid, i, j);
				zz = 100 - zz;
				clamp(zz, 1, 100);
				global.fertility_grid[# i, j] = zz;
			}
		}


}
