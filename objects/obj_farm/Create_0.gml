depth = -1;
workers = 1;
worker = obj_farmer;
produced_today = false;
quantity = 0;
width = sprite_width div 16;
height = sprite_height div 16;
fertility_bonus = 0;
for(var i = 0; i < width; i++)
	{
	for(var j = 0; j < height; j++)
		{
		fertility_bonus += global.fertility_grid[# x div 16 + i, y div 16 + j] div 61; //maximum of 1 bonus food for fertility above 50
		}
	}
food_per_day = 20 + fertility_bonus;
show_debug_message(food_per_day);
alarm[0] = 1;
frame = 0;
if obj_gasparaldo.part = 6 and !obj_gasparaldo.show_text then
	{
	obj_gasparaldo.show_text = true;
	instance_create_layer(0,0,"Instances",obj_next_text);
	}
if instance_exists(obj_generator) then
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}