for(var j = 0; j < height; j++)
	{
	for(var i = 0; i < width; i++)
		{
			var zz = ds_grid_get(tree_grid, i, j);
			var zzz = ds_grid_get(land_grid, i, j);
			if zz > 40 and zz < 60 and zzz > 35 and zzz < 65
				{
					if irandom_range(1, 100) > 72
						{
						instance_create_layer(i*blockSize + irandom_range(-10, 10), j*blockSize + irandom_range(-10, 10), "Instances", obj_tree);
						//inst.name = "tree";
						}
				}
			else if (zz > 30 and zz < 40 and zzz > 35 and zzz < 65) or (zz > 60 and zzz > 35 and zzz < 65)
				{
					if irandom_range(1, 100) > 60
						instance_create_layer(i*blockSize + irandom_range(-10, 10), j*blockSize + irandom_range(-10, 10), "Instances", obj_small_tree);		
				}
		}
	}