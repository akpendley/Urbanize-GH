if !global.locked then
{
if !locked then
{
if draw_selection_box then
	{
	draw_selection_box = false;
	//orient the box correctly
	if global.selection_box_x1 > global.selection_box_x2 then
		{
		var tempx = global.selection_box_x1;
		global.selection_box_x1 = global.selection_box_x2;
		global.selection_box_x2 = tempx;
		}
	if global.selection_box_y1 > global.selection_box_y2 then
		{
		var tempy = global.selection_box_y1;
		global.selection_box_y1 = global.selection_box_y2;
		global.selection_box_y2 = tempy;
		}
		
	//calculate area of the box to determine if it is big enough to be valid
	if ((global.selection_box_x2 - global.selection_box_x1) * (global.selection_box_y2 - global.selection_box_y1)) > 30 then
		{
		//select the objects	
		with (obj_tree)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				sprite_index = selected_sprite;
				ds_queue_enqueue(global.destroyables_selected, id);
				other.number_selected += 1;
				}
			}
		
		with (obj_small_tree)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				sprite_index = selected_sprite;
				ds_queue_enqueue(global.destroyables_selected, id);
				other.number_selected += 1;
				}
			}

		with (obj_small_rock)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				sprite_index = selected_sprite;
				ds_queue_enqueue(global.destroyables_selected, id);
				other.number_selected += 1;
				}
			}
			
		with (obj_big_rock)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				sprite_index = selected_sprite;
				ds_queue_enqueue(global.destroyables_selected, id);
				other.number_selected += 1;
				}
			}

		with (obj_starting_caravan)
			{
			if active then
				{
				if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
					{
					sprite_index = selected_sprite;
					ds_queue_enqueue(global.destroyables_selected, id);
					other.number_selected += 1;
					}
				}
			}

		with (obj_food)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				if rejected then
					{
					sprite_index = selected_sprite;
					ds_queue_enqueue(global.destroyables_selected, id);
					other.number_selected += 1;
					}
				}
			}
			
		with (obj_logs)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				if rejected then
					{
					sprite_index = selected_sprite;
					ds_queue_enqueue(global.destroyables_selected, id);
					other.number_selected += 1;
					}
				}
			}

		with (obj_stone)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				if rejected then
					{
					sprite_index = selected_sprite;
					ds_queue_enqueue(global.destroyables_selected, id);
					other.number_selected += 1;
					}
				}
			}			
		
		with (obj_lumber)
			{
			if x > global.selection_box_x1 and x < global.selection_box_x2 and y > global.selection_box_y1 and y < global.selection_box_y2 then
				{
				if rejected then
					{
					sprite_index = selected_sprite;
					ds_queue_enqueue(global.destroyables_selected, id);
					other.number_selected += 1;
					}
				}
			}
		
		if number_selected > 0 then
			{
			//create the remove obstructions icon
			instance_create_layer((global.selection_box_x1 + global.selection_box_x2)/2, (global.selection_box_y1 + global.selection_box_y2)/2, "Instances", obj_remove_obstructions);	
			}
		}
	}
}
}