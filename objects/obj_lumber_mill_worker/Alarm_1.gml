target_id = findNearestStockpileWithItem("lumber", 1, true);
if target_id != -1 then
	{
	target_x = target_id.x;
	target_y = target_id.y;
	task = "stow lumber";
	en_route = false;
	pause = false;
	}
else
	{
	alarm[1] = 30;
	}