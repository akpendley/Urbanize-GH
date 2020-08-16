depth = -1;
target_x = x + 16;
target_y = y + 16;
slots[0] = "none";
slots[1] = "none";
slots[2] = "none";
slots[3] = "none";
values[3] = 0;
qd_values[3] = 0;
qd_withdraw[3] = 0;
hover = false;
if instance_exists(obj_generator) then
	{
	mp_grid_clear_rectangle(global.road_network, x, y, x + sprite_width - 1, y + sprite_height - 1);
	}	