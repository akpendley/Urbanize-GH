switch(task)
	{
		//Builder Specific Tasks
		case "construction": //couldn't find a path to a build site
			{
			//remove builder from my_builders
			ds_priority_delete_value(target_id.my_builders, id);
			target_id.builders_requested -= 1;	
			show_debug_message("Quit construction task due to traffic");
			clearTask();
			break;
			}
		case "construction delivery": //couldn't find a build site or a stockpile
			{
			//remove builder from my_builders
			ds_priority_delete_value(target_id.my_builders, id);
			target_id.builders_requested -= 1;	
			//reset qd values of the build site and spawn rejected item
			switch(item_needed)
				{
					case "logs":
						{
						target_id.qd_wood -= value_needed;
						break;
						}
					case "stone":
						{
						target_id.qd_stone -= value_needed;
						break;
						}
					case "lumber":
						{
						target_id.qd_lumber -= value_needed;
						break;
						}
				}
			if !picked_up then
				{
				//reset qd values of the stockpile also
				transport_to_site_id.qd_withdraw[slot] -= value_needed;
				}
			clearTask();
			break;
			}
		case "harvest": //couldn't find a path to a tree/rock, no additional actions required to clear the task
			{
			clearTask();
			break;
			}
		case "mining": //couldn't find a path to the quarry
			{
			//remove builder from my_builders
			ds_priority_delete_value(target_id.my_builders, id);
			target_id.builders_requested -= 1;	
			clearTask();
			break;
			}
		case "mining delivery": //couldn't find a path to a stockpile
			{
			//reset qd values for the stockpile, spawn a rejected item, remove builder from my_builders
			ds_priority_delete_value(target_id.my_builders, id);
			target_id.builders_requested -= 1;
			transport_to_site_id.qd_values[slot] -= transport_value;
			var reject = global.item_to_object[? transport_item];
			var reject_id = instance_create_layer(x, y, "Instances", reject);
			reject_id.rejected = true;
			clearTask();
			break;
			}
		case "transport": //couldn't find a path to a stockpile
			{
			//reset qd values for the stockpile, spawn a rejected item
			target_id.qd_values[slot] -= transport_value;
			var reject = global.item_to_object[? transport_item];
			var reject_id = instance_create_layer(x, y, "Instances", reject);
			reject_id.rejected = true;
			clearTask();			
			break;
			}
		case "transport food": //couldn't find a path to a silo
			{
			//reset qd values for the silo, spawn a rejected food
			target_id.qd_value -= transport_value;
			var reject = global.item_to_object[? transport_item];
			var reject_id = instance_create_layer(x, y, "Instances", reject);
			reject_id.rejected = true;
			clearTask();
			break;
			}
		case "collect": //couldn't find a path to logs/stone/lumber
			{
			//with the target, switch to rejected sprite
			target_id.rejected = true;
			target_id.sprite_index = target_id.rejected_sprite;
			clearTask();			
			break;
			}
		case "store food": //couldn't find a path to food
			{
			//with the target, switch to rejected sprite
			target_id.rejected = true;
			target_id.sprite_index = target_id.rejected_sprite;
			clearTask();
			break;
			}
		case "go to point": //couldn't find a path to the user defined point
			{
			clearTask();
			break;
			}
	
	
		//Universal AI Tasks
		case "eating": //couldn't find a path to a silo
			{
			//reset qd values of the silo and tried to eat
			target_id.qd_withdraw -= 1;
			tried_to_eat = true;
			alarm[9] = 3*room_speed;
			clearTask();
			break;
			}	
	
		//Carpenter Specific Tasks
		case "fetch logs": //couldn't find a path to a stockpile
			{
			//reset qd values for the stockpile
			target_id.qd_withdraw[slot] -= 1;
			clearTask();
			break;
			}
		case "cut logs": //couldn't find a path back home
			{
			//drop log, pause for distance to home / walk_speed / room_speed and then teleport to homex, homey
			//if there is a path blockage then the carpenter should not be able to return to that stockpile until the blockage is fixed
			var reject = instance_create_layer(x,y,"Instances", obj_logs);
			pause = true;
			alarm[2] = round(distance_to_point(home_x, home_y) / walk_speed / room_speed);
			break;
			}
		case "stow lumber": //couldn't find a path to a stockpile
			{
			//reset qd values of stockpile and create a lumber object
			target_id.qd_values[slot] -= 1;
			instance_create_layer(x,y,"Instances", obj_lumber);
			clearTask();			
			break;
			}
		
		//Farmer Specific Tasks
	
		case "deliver food": //couldn't find a path to a stockpile
			{
			//reset silo qd values and create a food object
			target_id.qd_value -= 1;
			instance_create_layer(x,y,"Instances", obj_food);
			clearTask();
			break;
			}
		case "go home": //couldn't find a path back home
			{
			pause = true;
			alarm[2] = round(distance_to_point(home_x, home_y) / walk_speed / room_speed);			
			break;
			}
	
	}