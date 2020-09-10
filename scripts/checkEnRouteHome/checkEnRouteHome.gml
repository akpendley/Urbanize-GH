function checkEnRouteHome() {
	//calculate distance to target
	var dist = distance_to_point(home_x, home_y);
	if dist > 20 then
		{
		if !en_route then
			{
			mp_grid_path(map, path, x, y, home_x, home_y, true);
			path_start(path, walk_speed * speed_mod / room_speed, path_action_stop, false);
			en_route = true;
			}
		}
	else
		{
		en_route = false;
		}


}
