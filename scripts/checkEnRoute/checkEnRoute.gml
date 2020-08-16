//calculate distance to target
var dist = distance_to_point(target_x, target_y);
if dist > 20 then
	{
	if !en_route then
		{
		path_success = mp_grid_path(map, path, x, y, target_x, target_y, true);
		if path_success then
			{
			path_start(path, walk_speed * speed_mod / room_speed, path_action_stop, false);
			}
		else
			{
			show_debug_message("Attempting to reject a task");
			rejectTask();
			}
		en_route = true;
		}
	}
else
	{
	en_route = false;
	}