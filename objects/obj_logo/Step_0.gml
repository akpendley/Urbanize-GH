if fade_to_black and fade_time < max_fade_time
	{
	fade_time += 1;
	}
if fade_time = max_fade_time and fade_to_black then 
	{
	alarm[1] = 1;
	}
	
if fade_time > 0 and fade_to_color
	{
	fade_time -= 1;
	}
if fade_time = 0 and fade_to_color then
	{
	fade_to_color = false;
	alarm[0] = 5*room_speed;
	}