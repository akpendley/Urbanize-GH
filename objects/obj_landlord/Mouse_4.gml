with (obj_build_site) //if you're trying to place a building and press this button then destroy the placer
	{
	if follow_mouse then
		instance_destroy();
	}
instance_create_layer(mouse_x div 16, mouse_y div 16, "Instances", obj_parcel_placer);