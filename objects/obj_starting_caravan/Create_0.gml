target_x = x;
target_y = y;
selected_sprite = spr_starting_caravan;
unselected_sprite = spr_starting_caravan;
task_type = "harvest";
work_required = 3;
active = false;
pp = path_add();
if mp_grid_path(global.road_network, pp, x, y, -10, 1354, true) then
	{
	path_start(pp, 3, path_action_stop, true);
	}