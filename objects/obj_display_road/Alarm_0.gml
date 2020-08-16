if instance_exists(obj_resource_tracker) and !global.locked and pr_dedicated = -1 then
	{
	if !pr_generated then //generate a PR
		{
		required_appeal = global.last_appeal + irandom_range(0, global.city_level);
		pr_generated = true;
		}
	if pr_generated then //PR hasn't purchased a parcel
		{
		if ds_list_size(global.parcels_for_sale) > 0 then //there are parcels for sale
			{
			if global.overall_appeal >= required_appeal then //this PR wants to live in your town
				{
				pr_dedicated = ds_list_find_value(global.parcels_for_sale, 0);
				ds_list_delete(global.parcels_for_sale, 0);
				alarm[1] = irandom_range(3, 20) * room_speed; //set move in date between 3 and 20 seconds from now
				}
			else	
				{
				alarm[0] = room_speed;
				}
			}
		else
			{
			alarm[0] = room_speed;
			}
		}
	else
		{
		alarm[0] = room_speed;
		}
	}
else
	{
	alarm[0] = room_speed;
	}