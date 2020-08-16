if !first_anchor and !second_anchor then
	{
	x = mouse_x;
	y = mouse_y;
	move_snap(16,16);
	valid_placement = checkForRoad(2, x, y);
	}
if first_anchor and !second_anchor then
	{
	parcel_width = (mouse_x - x) div 16;
	parcel_width = clamp(parcel_width, 2, 100);
	valid_placement = checkForRoad(parcel_width, parcel_x, parcel_y);
	}
	
if first_anchor and second_anchor then
	{
	//divvy up the parcels
	parcel_x = x;
	parcel_y = y;
	divvyParcel(parcel_width, parcel_x, parcel_y);
	instance_destroy();
	}
depth = -y;