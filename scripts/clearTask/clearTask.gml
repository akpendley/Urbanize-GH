function clearTask() {
	busy = false;
	has_task = false;
	current_task_type = "none";
	target_id = -2;
	target_x = 0;
	target_y = 0;
	transport_item = "none";
	transport_value = 0;
	slot = 0;
	picked_up = false;
	transport_to_site_id = -2;
	value_needed = 0;
	item_needed = "none";
	pause = true;
	end_task = false;
	en_route = true;
	path_success = false;
	alarm[0] = 10;


}
