repeat(value)
	{
	instance_create_layer(x + irandom_range(-20, 20), y + irandom_range(-20, 20), "Instances", item_drop);
	}