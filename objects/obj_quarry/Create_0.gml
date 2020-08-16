depth = -1;
increase = 0;
cancel = 0;
target_x = x + 140;
target_y = y + sprite_height;
my_builders = ds_priority_create();
builders_requested = 0;
hover = false;
task_type = "mining";
mining_item = "stone";
work_to_mine = 4;
repetitions = 100;
total_production = 0;
width = sprite_width div 16;
height = sprite_height div 16;
total_stone = 0;
for(var i = 0; i < width; i++)
	{
	for(var j = 0; j < height; j++)
		{
		total_stone += global.stone_density_grid[# x div 16 + i, y div 16 + j];
		}
	}
total_stone = round(total_stone/5);
production_remaining = total_stone;
qd_production = 0;
frame = 14;
if instance_exists(obj_generator) then
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}