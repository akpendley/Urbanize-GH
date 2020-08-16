depth = -1;
value = 0;
target_x = x + 62;
target_y = y + sprite_height;
max_value = 600;
qd_value = 0;
qd_withdraw = 0;
if !global.unlocked[? "Farm"] then
	{
	global.unlocked[? "Farm"] = 1;
	obj_gasparaldo.show_text = true;
	instance_create_layer(0,0,"Instances",obj_next_text);
	}
if instance_exists(obj_generator) then
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}