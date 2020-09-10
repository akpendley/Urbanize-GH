depth = -y;
if !global.locked then
	{
	if collision_point(x, y, obj_road, false, true) then
		{
		speed_mod = 1.25;
		}
	else
		{
		speed_mod = 1;
		}
	
	if global.time = 6 and !daily_done then
		{
		tried_to_eat = false;
		hunger += 1;
		daily_done = true;
		}	
	
	if global.time = 20 then
		{
		daily_done = false;
		}

	if !place_free(x,y) then
		{
		findFreedom();
		}
	
if !pause then
	{
	//check the worklist for tasks
	if !has_task then
		{
		if !manual_input then	
			{
			if hunger = 0 or tried_to_eat then //i dont need to eat yet or i tried but i cant find food
				{
				if (ds_priority_size(global.worklist) > 0) then
					{
					target_id = ds_priority_delete_max(global.worklist);
					if instance_exists(target_id) then
						{
						target_x = target_id.target_x;
						target_y = target_id.target_y;
						task = target_id.task_type;
						has_task = true;
						if task = "construction" then
							{
							ds_priority_add(target_id.my_builders, id, 1);
							}
						if task = "mining" then
							{
							ds_priority_add(target_id.my_builders, id, 1);
							repetitions_remaining = target_id.repetitions;
							value_needed = 1; //this will prevent immediate abandonment of the task when cancelling
							}
						}
					else
						{
						clearTask();
						}
					}
				}
			else  //i need to eat
				{
				target_id = findNearestSilo(1, false); //find food to eat
				if target_id != -1 then
					{
					target_x = target_id.target_x;
					target_y = target_id.target_y;
					task = "eating";
					has_task = true;			
					}
				else
					{
					tried_to_eat = true;
					alarm[9] = 3*room_speed;
					clearTask();
					}
				}
			}
		else
			{
			has_task = true;
			task = "go to point";
			target_x = goto_x;
			target_y = goto_y;
			manual_input = false;
			goto_x = 0;
			goto_y = 0;
			}
		}

	if has_task then
		{
		if task != "go to point" then
			{
			if instance_exists(target_id) then
				{
			if (task = "construction" or task = "construction delivery") then
				{
				//if the build site needs materials then set transport target to the nearest stockpile with resource
				if !target_id.has_all_materials or task = "construction delivery" then
					{
					if transport_to_site_id = -2 then
						{
						//check to see what materials are required
				
						//wood
						if item_needed = "none" then
							{
							if target_id.wood_to_complete - target_id.qd_wood > 0 and global.total_logs > 0 then
								{
								//look for wood
								value_needed = 1;
								item_needed = "logs";
								transport_to_site_id = findNearestStockpileWithItem(item_needed, value_needed, false);
								if transport_to_site_id = -1 then
									{
									//couldnt find logs, move on to next material
									item_needed = "none";
									value_needed = 0;
									}
								else
									{
									task = "construction delivery";
									target_id.qd_wood += value_needed;
									picked_up = false;
									}
								}
							}
				
				
						if item_needed = "none" then
							{
							if target_id.stone_to_complete - target_id.qd_stone > 0 and global.total_stone > 0 then	//stone
								{
								//look for stone
								value_needed = 1;
								item_needed = "stone";
								transport_to_site_id = findNearestStockpileWithItem(item_needed, value_needed, false);
								if transport_to_site_id = -1 then
									{
									//couldnt find stone, move on to next material
									item_needed = "none";
									value_needed = 0;
									}
								else
									{		
									task = "construction delivery";				
									target_id.qd_stone += value_needed;
									picked_up = false;
									}
								}
							}
				
						if item_needed = "none" then
							{
							if target_id.lumber_to_complete - target_id.qd_lumber > 0 and global.total_lumber > 0 then	//lumber
								{
								//look for lumber
								value_needed = 1;
								item_needed = "lumber";
								transport_to_site_id = findNearestStockpileWithItem(item_needed, value_needed, false);
								if transport_to_site_id = -1 then
									{
									//couldnt find lumber, move on to next material
									item_needed = "none";
									value_needed = 0;
									}
								else
									{		
									task = "construction delivery";				
									target_id.qd_lumber += value_needed;
									picked_up = false;
									}
								}
							}
					
						if item_needed = "none" and !target_id.has_all_materials then	//materials are still needed but i cant find any
							{
							//remove myself from the my_builders
							ds_priority_delete_value(target_id.my_builders, id);
							target_id.builders_requested -= 1;
							//clear my task
							clearTask();
							}					
						}
					else
						{
						//am i still en route to the stockpile
						var dist = distance_to_object(transport_to_site_id);
						if dist > 20 then
							{
							if !en_route then
								{
								path_success = mp_grid_path(map, path, x, y, transport_to_site_id.target_x, transport_to_site_id.target_y, true);
								if path_success then
									{
									path_start(path, walk_speed * speed_mod / room_speed, path_action_stop, false);
									en_route = true;
									}
								else
									{
									rejectTask();
									}
								}
							}
						else
							{
							en_route = false;
							}
						if !en_route then
							{
							if picked_up then	//if picked up then dropoff at site, reset transport_to_site_id to 0
								{
								if item_needed == "logs" then
									{
									target_id.wood_to_complete -= value_needed;
									target_id.qd_wood -= value_needed;
									show_debug_message("Dropped off logs");
									}
								else if item_needed == "stone" then
									{
									target_id.stone_to_complete -= value_needed;
									target_id.qd_stone -= value_needed;
									show_debug_message("Dropped off stone");
									}
								else if item_needed == "lumber" then
									{
									target_id.lumber_to_complete -= value_needed;
									target_id.qd_lumber -= value_needed;
									show_debug_message("Dropped off lumber");
									}
								value_needed = 0;
								item_needed = "none";
								transport_to_site_id = -2;
								task = "construction";
								if end_task then
									{
									clearTask();
									}
								}
							else	//if not picked up then take from stockpile and set task to go back to build site
								{
								transport_to_site_id.values[slot] -= value_needed;
								transport_to_site_id.qd_withdraw[slot] -= value_needed;
								transport_to_site_id = target_id;
								picked_up = true;
								}
							}
						}
					}
				else	//if the build site has all materials then go to the site and work it
					{
					checkEnRoute();
					if !en_route then
						{
						if target_id.all_materials_arrived then //dont start work until all the materials have been delivered
							{
							target_id.work += work_per_second/room_speed; //perform work
							if target_id.work >= target_id.work_to_complete then
								{
									clearTask();
								}
							}
						}
					}
				}
			else	//non construction tasks
				{
				if task = "mining" or task = "mining delivery" then
					{
					if task = "mining" then
						{
						//go to mining site
						checkEnRoute();
						if !en_route then  //mine until complete
							{
							if target_id.production_remaining - target_id.qd_production > 0 then
								{
								target_id.qd_production += 1;
								pause = true;
								alarm[1] = round(target_id.work_to_mine/work_per_second*room_speed);
								}
							else
								{
								//remove myself from the my_builders
								ds_priority_delete_value(target_id.my_builders, id);
								target_id.builders_requested -= 1;
								//clear my task
								repetitions_remaining = 0;
								clearTask();
								}
							}
						}
					else
						{
						//am i still en route to the stockpile
						var dist = distance_to_object(transport_to_site_id);
						if dist > 20 then
							{
							if !en_route then
								{
								mp_grid_path(map, path, x, y, transport_to_site_id.target_x, transport_to_site_id.target_y, true);
								path_start(path, walk_speed * speed_mod / room_speed, path_action_stop, false);
								en_route = true;
								}
							}
						else
							{
							en_route = false;
							}
						if !en_route then
							{
							transport_to_site_id.values[slot] += transport_value;
							transport_to_site_id.qd_values[slot] -= transport_value;					
							repetitions_remaining -= 1;
							if repetitions_remaining = 0 or end_task or target_id.production_remaining < 1 then
								{
								repetitions_remaining = 0;
								if !end_task
									{
									//remove myself from the my_builders
									ds_priority_delete_value(target_id.my_builders, id);
									target_id.builders_requested -= 1;
									}
								//clear my task
								clearTask();
								}
							else
								{
								task = "mining";
								transport_item = "none";
								transport_value = 0;
								slot = 0;
								transport_to_site_id = -2;						
								}
							}				
						}
					}
				else
					{
					checkEnRoute();			
					if !en_route then
						{
		
						if task = "harvest" then
							{
							target_id.work_required -= work_per_second/room_speed; //perform work
							if target_id.work_required < 1 then
								{
								with target_id
									{
									instance_destroy();
									}
								clearTask();	
								}
							}
			
						if task = "transport" then
							{
							target_id.slots[slot] = transport_item;
							target_id.values[slot] += transport_value;
							target_id.qd_values[slot] -= transport_value;
							clearTask();
							}

						if task = "transport food" then
							{
							target_id.value += transport_value;
							target_id.qd_value -= transport_value;
							clearTask();
							}
						
						if task = "collect" then
							{
							transport_item = target_id.transport_item;
							transport_value = target_id.value;
							with target_id
								{
								instance_destroy();
								}
							task = "transport";
							target_id = findNearestStockpileWithItem(transport_item,transport_value,true);
							if target_id = -1 then //there are no valid targets
								{
								var reject = global.item_to_object[? transport_item];
								var reject_id = instance_create_layer(x, y, "Instances", reject);
								reject_id.rejected = true;
								clearTask();
								}
							else
								{
								target_x = target_id.target_x;
								target_y = target_id.target_y;
								}
							}
				
						if task = "eating" then
							{
							target_id.value -= 1;
							target_id.qd_withdraw -= 1;
							hunger = 0;
							clearTask();
							}
				
				
						if task = "store food" then
							{
							transport_item = target_id.transport_item;
							transport_value = target_id.value;
							with target_id
								{
								instance_destroy();
								}
							task = "transport food";
							target_id = findNearestSilo(transport_value,true);
							if target_id = -1 then //there are no valid targets
								{
								var reject = global.item_to_object[? transport_item];
								var reject_id = instance_create_layer(x, y, "Instances", reject);
								reject_id.rejected = true;
								clearTask();
								}
							else
								{
								target_x = target_id.target_x;
								target_y = target_id.target_y;
								}
							}
						}
					}
				}
			}
			else
				{
				clearTask();
				}
			}
		else if task = "go to point" then
			{
			checkEnRoute();
			if !en_route then
				{
				clearTask();
				}	
			}
		}
	}
}