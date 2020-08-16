if global.time = 12 and !produced_today then
	{
	quantity += food_per_day;
	produced_today = true;
	}

if global.time = 6 then
	{
	produced_today = false;
	}