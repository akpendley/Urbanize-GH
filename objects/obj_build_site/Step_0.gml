if autoset then
	{
	if complete_obj != obj_road or already_placed then
		{
		if follow_mouse then
			{
			x = mouse_x;
			y = mouse_y;
			move_snap(16,16);
			depth = -bbox_top;
			//check if there are any objects under then placement
			valid_placement = checkPlacement(global.ground_tilemap_grass, xsize, ysize);
			}

		if !has_all_materials then
			{
			has_all_materials = true;
			if wood_to_complete - qd_wood > 0 then
				has_all_materials = false;
			if lumber_to_complete - qd_lumber > 0 then
				has_all_materials = false;
			if stone_to_complete - qd_stone > 0 then
				has_all_materials = false;
			if iron_to_complete - qd_iron > 0 then
				has_all_materials = false;
			if steel_to_complete - qd_steel > 0 then
				has_all_materials = false;
			if cement_to_complete - qd_cement > 0 then
				has_all_materials = false;
			}
	
		if !all_materials_arrived then
			{
			all_materials_arrived = true;
			if wood_to_complete > 0 then
				all_materials_arrived = false;
			if lumber_to_complete > 0 then
				all_materials_arrived = false;
			if stone_to_complete > 0 then
				all_materials_arrived = false;
			if iron_to_complete > 0 then
				all_materials_arrived = false;
			if steel_to_complete > 0 then
				all_materials_arrived = false;
			if cement_to_complete > 0 then
				all_materials_arrived = false;
			}	
	
		if work >= work_to_complete and !done_building then
			{
			done_building = true;
			if instance_exists(increase) then
				{
				with increase
					instance_destroy();
				}
			if instance_exists(cancel) then
				{
				with cancel
					instance_destroy();
				}
			for (var i = 0; i < ds_priority_size(my_builders); i++)
				{
				var bl = ds_priority_delete_max(my_builders);
				with (bl)
					{
					clearTask();
					}
				}
			alarm[0] = 2;
			}
	
		if !done_building and building then
			{
			if cancel = 0 and ds_priority_size(my_builders) > 0 then //if there is no cancel button and there are assigned workers
				{
				cancel = instance_create_layer(x + 48, y + y_off, "Instances", obj_cancel_workers);
				cancel.my_dropper = id;
				}
			else if ds_priority_size(my_builders) = 0 then
				{
				if cancel != 0 then
					{
					with cancel
						instance_destroy();
					}
				}
			if increase = 0 then
				{
				increase = instance_create_layer(x + 35, y + y_off, "Instances", obj_increase_workers);
				increase.my_dropper = id;
				increase.priority = 10;
				}
			}
		}
	else if complete_obj = obj_road and !already_placed then
		{
		if !first_anchor and !second_anchor then
			{
			x = mouse_x;
			y = mouse_y;
			move_snap(16,16);
			valid_placement = checkRoadPlacement(1, x, y, road_horizontal, negative);
			}
		if first_anchor and !second_anchor then
			{
			if mouse_x > x + 32 or mouse_x < x then
				{
				road_horizontal = true;
				window_set_cursor(cr_none);
				cursor_sprite = spr_road_horizontal_cursor;
				}
			else
				{
				road_horizontal = false;
				window_set_cursor(cr_none);
				cursor_sprite = spr_road_vertical_cursor;
				}
			if road_horizontal then
				{
				if mouse_x > x then
					{
					road_size = ceil((mouse_x - x) / 32);
					negative = false;
					}
				else
					{
					road_size = ceil((x - mouse_x) / 32);
					negative = true;
					}
				}
			else
				{
				if mouse_y > y then
					{
					road_size = ceil((mouse_y - y) / 32);
					negative = false;
					}
				else
					{
					road_size = ceil((y - mouse_y) / 32);
					negative = true;
					}
				}
			road_size = clamp(road_size, 1, 100);
			valid_placement = checkRoadPlacement(road_size, road_x, road_y, road_horizontal, negative);
			}
	
		if first_anchor and second_anchor then
			{
			road_x = x;
			road_y = y;
			show_debug_message(road_size);
			placeRoads(road_size, road_x, road_y, road_horizontal, negative);
			instance_destroy();
			}
		depth = -y;	
		}
	}