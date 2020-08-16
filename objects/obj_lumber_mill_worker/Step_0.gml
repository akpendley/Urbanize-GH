depth = -1;

//	phases of work
//	
//	1. Fetching logs
//	2. Cutting logs into lumber
//	3. Stowing lumber

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

if !place_free(x,y) then
	move_outside_solid(270,8);

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

if !pause then
	{
	if !busy then
		{
		if hunger = 0 or tried_to_eat then
			{
			//check if global.total_lumber is less than max_lumber
			if (global.total_lumber < global.max_lumber) and (global.total_logs > 0) then
				{
				//grab some logs to start making lumber
				target_id = findNearestStockpileWithItem("logs", 1, false);
				if target_id != -1 then
					{
					target_x = target_id.target_x;
					target_y = target_id.target_y;
					busy = true;
					task = "fetch logs";
					}
				else
					{
					show_debug_message("I cant find any logs");
					busy = false;
					task = "none";
					target_id = -1;
					target_x = 0;
					target_y = 0;
					en_route = false;
					slot = 0;
					pause = true;
					alarm[0] = 30;				
					}
				}
			}
		else
			{
			target_id = findNearestSilo(1, false); //find food to eat
			if target_id != -1 then
				{
				target_x = target_id.target_x;
				target_y = target_id.target_y;
				task = "eating";
				en_route = false;
				busy = true;			
				}
			else
				{
				tried_to_eat = true;
				alarm[9] = 10*room_speed;
				task = "none";
				}			
			}
		}
	else
		{
		if task = "fetch logs" then
			{
			checkEnRoute();
			if !en_route then
				{
				target_id.values[slot] -= 1;
				target_id.qd_withdraw[slot] -= 1;
				task = "cut logs";
				}
			}
		else if task = "cut logs" then
			{
			checkEnRouteHome();
			if !en_route then
				{
				alarm[1] = work_to_complete / work_per_second * room_speed;
				pause = true;
				}		
			}
		else if task = "stow lumber" then
			{
			checkEnRoute();	
			if !en_route then
				{
				target_id.values[slot] += 1;
				target_id.qd_values[slot] -= 1;
				busy = false;
				task = "none";
				target_id = -2;
				target_x = 0;
				target_y = 0;
				en_route = false;
				slot = 0;
				pause = false;
				}		
			}
		else if task = "eating" then
			{
			checkEnRoute();
			if !en_route then
				{
				target_id.value -= 1;
				target_id.qd_withdraw -= 1;
				hunger = 0;
				task = "none";
				busy = false;
				}			
			}
		}
	}
}