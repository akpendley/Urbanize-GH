function createRocks() {
	for(var j = 0; j < height; j++)
		{
		for(var i = 0; i < width; i++)
			{
				var zz = ds_grid_get(rock_grid, i, j);
				var zzz = ds_grid_get(land_grid, i, j);
				if zz > 60 and zz < 75 and zzz > 35 and zzz < 80 then
					{
						if irandom_range(1, 100) > 92 then
							instance_create_layer(i*blockSize + irandom_range(-10, 10), j*blockSize + irandom_range(-10, 10), "Instances", obj_small_rock);	
					}
				else if (zz > 45 and zz < 60 and zzz > 35 and zzz < 80) or (zz > 75 and zzz > 80 and zzz < 95) then
					{
						if irandom_range(1, 100) > 82 then
							instance_create_layer(i*blockSize + irandom_range(-10, 10), j*blockSize + irandom_range(-10, 10), "Instances", obj_small_rock);		
					}
			}
		}


}
