target_x = x;
target_y = y;
if (irandom_range(1,2) == 1) then
	{
	solid = false;
	}
depth = -1;
selected_sprite = spr_small_tree_selected;
unselected_sprite = spr_small_tree;
item_drop = obj_logs;
task_type = "harvest";
work_required = 1;
value = 1;

setup_3d_plane();