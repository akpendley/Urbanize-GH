if instance_exists(obj_camera_controller) then
	{
	x = obj_camera_controller.x;
	y = obj_camera_controller.y;
	}

if fade_to_black and fade_time < max_fade_time
	{
	fade_time += 1;
	}
if fade_time = max_fade_time and fade_to_black then 
	{
	fade_to_black = false;
	//the screen is totally black, show day stats, rising moon, make ok button
	instance_deactivate_all(true);
	instance_create_layer(x, y + 400, "Instances", obj_moon);
	//instance_deactivate_all(true);
	//on click ok destroy all the objects and set fade_to_color to true and reactivate all objects
	//fade_to_color = true;
	}
if fade_time > 0 and fade_to_color
	{
	if !reactivated then
		{
		reactivated = true;
		global.time = 6;
		obj_resource_tracker.alarm[0] = global.time_seconds * room_speed;
		obj_camera_controller.locked = false;
		}
	fade_time -= 1;
	}
if fade_time = 0 and fade_to_color then
	{
	instance_destroy();
	}