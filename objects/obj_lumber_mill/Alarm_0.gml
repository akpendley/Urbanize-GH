repeat(workers)
	{
	var w = instance_create_layer(x + 80, y + 85, "Instances", worker);
	w.home = id;
	w.home_x = x + 80;
	w.home_y = y + 85;
	}