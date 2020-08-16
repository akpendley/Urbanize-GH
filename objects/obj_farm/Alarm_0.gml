repeat(workers)
	{
	var w = instance_create_layer(x + 30, y + 115, "Instances", worker);
	w.home = id;
	w.home_x = x + 30;
	w.home_y = y + 115;
	}