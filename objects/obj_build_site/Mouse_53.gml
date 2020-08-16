if autoset then
	{
	if complete_obj != obj_road or already_placed then
		{
		if valid_placement and !building and complete_obj != obj_road then
			{
			follow_mouse = false;
			building = true;
			lp1 = instance_create_layer(x, y + y_off, "Instances", obj_build_site_post_left);
			lp2 = instance_create_layer(x, y + y_off + ysize * 16, "Instances", obj_build_site_post_left);
			rp1 = instance_create_layer(x + xsize * 16, y + y_off, "Instances", obj_build_site_post_right);
			rp2 = instance_create_layer(x + xsize * 16, y + y_off + ysize * 16, "Instances", obj_build_site_post_right);
			target_x = round((bbox_right + bbox_left) / 2);
			target_y = round((bbox_bottom + bbox_top) / 2);
			repeat(builders)
				{
				ds_priority_add(global.worklist, id, 10);
				builders_requested += 1;
				}
			//if complete_obj = obj_road then
			//	{
			//	var instance = instance_create_layer(mouse_x, mouse_y, "Instances", obj_build_site);
			//	//required values
			//	instance.complete_obj = obj_road;
			//	instance.sprite = spr_road_solo;
			//	instance.work_to_complete = 1;
			//	instance.wood_to_complete = 0;
			//	instance.lumber_to_complete = 0;
			//	instance.stone_to_complete = 0;
			//	instance.iron_to_complete = 0;
			//	instance.steel_to_complete = 0;
			//	instance.cement_to_complete = 0;
			//	instance.gold_to_complete = 0;		
			//	}
			}
		}
	else if complete_obj = obj_road and !already_placed then
		{
		if !first_anchor and !second_anchor and valid_placement then
			{
			first_anchor = true;
			road_x = x;
			road_y = y;
			}
		else if first_anchor and !second_anchor and valid_placement then
			{
			second_anchor = true;
			window_set_cursor(cr_default);
			cursor_sprite = -1;
			}
		}
	}