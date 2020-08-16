if !first_anchor and !second_anchor and valid_placement then
	{
	first_anchor = true;
	parcel_x = x;
	parcel_y = y;
	}
else if first_anchor and !second_anchor and valid_placement then
	{
	second_anchor = true;
	}