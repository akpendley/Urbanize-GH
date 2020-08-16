depth = -1;
if !global.locked then
{
if collision_point(x, y, obj_road, false, true) then
	{
	speed_mod = 1.5;
	}
else
	{
	speed_mod = 1;
	}
	
//	phases of work
//	
//	1. Take food from home
//	2. Dropoff food at silo
//	3. Return home

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
	if task = "none" then
		{
		if hunger = 0 or tried_to_eat then
			{
			if task = "none" and home.quantity > 0 then
				{
				target_id = findNearestSilo(1, true);
				if target_id != -1 then
					{
					home.quantity -= 1;
					target_x = target_id.target_x;
					target_y = target_id.target_y;			
					task = "deliver food";
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
				has_task = true;			
				}
			else
				{
				tried_to_eat = true;
				alarm[9] = 3*room_speed;
				task = "none";
				}		
			}
		}
	if task = "eating" then
		{	
		checkEnRoute();
		if !en_route then
			{
			target_id.value -= 1;
			target_id.qd_withdraw -= 1;
			hunger = 0;
			task = "none";
			}
		}
	if task = "deliver food" then
		{
		checkEnRoute();
		if !en_route then
			{
			target_id.value += 1;
			target_id.qd_value -= 1;
			task = "go home";
			}
		}
	if task = "go home" then
		{
		checkEnRouteHome();
		if !en_route then
			{
			task = "none";
			pause = true;
			alarm[0] = 10;
			}
		}
	}
}