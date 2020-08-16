var rivers = argument0;

//repeat(rivers)
	{
	river_res = 100;
	river_x[0] = irandom_range(40, width - 40);
	river_y[0] = 0;
	
	for(var i = 1; i <= river_res; i++) //generate the river indices
		{
		river_x[i] = river_x[i-1] + irandom_range(-3,3);
		river_y[i] = round(i*height/river_res);
		ds_grid_set(land_grid, river_x[i], river_y[i],110);
		}
	
	for(var j = 0; j < 100; j++)
		{
		for(var i = 0; i <= height/river_res; i++) //lerp between two x points by i to find the x points
			{
				var xxx = round(lerp(river_x[j], river_x[j+1], i));
				ds_grid_set(land_grid, xxx, river_y[j] + i, 0);
				ds_grid_set(land_grid, xxx - 1, river_y[j] + i, 0);
				ds_grid_set(land_grid, xxx + 1, river_y[j] + i, 0);
				ds_grid_set(land_grid, xxx, river_y[j] + i + 1, 0);
				ds_grid_set(land_grid, xxx, river_y[j] + i - 1, 0);
				ds_grid_set(land_grid, xxx - 2, river_y[j] + i, 0);
				ds_grid_set(land_grid, xxx + 2, river_y[j] + i, 0);
				ds_grid_set(land_grid, xxx, river_y[j] + i + 2, 0);
				ds_grid_set(land_grid, xxx, river_y[j] + i - 2, 0);
				ds_grid_set(land_grid, xxx + 1, river_y[j] + i + 1, 0);
				ds_grid_set(land_grid, xxx - 1, river_y[j] + i - 1, 0);
				ds_grid_set(land_grid, xxx - 1, river_y[j] + i + 1, 0);
				ds_grid_set(land_grid, xxx + 1, river_y[j] + i - 1, 0);
			}
		}
	}
	
//Define the resolution of the river
//Give it lateral bounds
//Find indices
//Lerp between indices to fill in river
//Reduce zz of all adjacent tiles