var grid = argument0;
for(var j = 0; j < height; j++)
	{
	for(var i = 0; i < width; i++) 
		{
			var zz = getPerlinNoise(i, j, 100);
			ds_grid_add(grid, i, j, zz);
		}
	}