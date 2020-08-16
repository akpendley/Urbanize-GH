if !global.locked then
	{
	if global.time = 20 then
		{
		instance_create_layer(obj_camera_controller.x, obj_camera_controller.y, "Instances", obj_timer);
		}
	else if global.time < 20 then
		{
		global.time += 1;
		alarm[0] = global.time_seconds * room_speed;
		}
	}