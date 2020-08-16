depth = -1;
instance_create_layer(x + 20, y + 80, "Instances", obj_citizen);
if instance_exists(obj_generator) then
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}