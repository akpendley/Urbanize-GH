frame = 0;
max_increase = 0;
max_decrease = 0;
workers = 1;
worker = obj_lumber_mill_worker;
alarm[0] = 1;
if !global.unlocked[? "Silo"] then
	{
	global.unlocked[? "Silo"] = 1;
	obj_gasparaldo.show_text = true;
	instance_create_layer(0,0,"Instances",obj_next_text);
	}
if instance_exists(obj_generator) then
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}
global.overall_appeal += 1;
depth = -1;