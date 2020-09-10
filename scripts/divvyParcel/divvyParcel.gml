function divvyParcel(argument0, argument1, argument2) {
	var www = argument0;
	var xxx = argument1;
	var yyy = argument2;

	poss[3] = 0;

	show_debug_message(www);
	while www > 0 //while parce_width is not filled with maximum number of parcels
		{
		poss[0] = 0;
		poss[1] = 0;
		poss[2] = 0;
		poss[3] = 0;
		for (var i = 5; i > 1; i--)
			{
			if (www div i) >= 1 then //if this size parcel will fit
				{
				if (www div i >= 2) or (www mod i >= 2) or (www mod i = 0) then //and there will either be no remaining parcel space or there will be enough space for more parcels
					{
					poss[i - 2] = 1; //then this parcel is possible to place
					show_debug_message(string(i) + " is a possibility");
					}
				}
			}
	
		var choice = 0;
		var num = 0;
		while choice = 0
			{
			num = irandom_range(0,3);
			choice = poss[num];
			}
		var ins = instance_create_layer(xxx, yyy, "Instances", obj_parcel);
		ins.parcel_size = num + 2;
		www -= (num + 2);
		show_debug_message(www);
		xxx += ((num + 2) * 16);
		}


}
