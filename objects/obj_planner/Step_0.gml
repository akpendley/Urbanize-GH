if !global.locked
{
	if !locked 
	{
		speed_mod = collision_point(x, y, obj_road, false, true) ? 1.25 : 1; // running on roads is quicker than grass
			
		if !place_free(x,y) // stuck in a wall?
		{
			findFreedom();
		}
		
		var up = keyboard_check(ord("W")) // UP input key
		var left = keyboard_check(ord("A")) // LEFT input key
		var down = keyboard_check(ord("S")) // DOWN input key
		var right = keyboard_check(ord("D")) // RIGHT input key
		
		var xspeed = right - left;
		var yspeed = down - up;
		var dirfacing = point_direction(0, 0, xspeed, yspeed); // get direction from origin to the point (xspeed, yspeed)
		
		
		facing = dirfacing div 90; // reduce direction resolution to cardinals
		var xprop = (x + lengthdir_x(abs(xspeed) * walkspeed, dirfacing)); // calculate vector x component at walking speed
		var yprop = (y + lengthdir_y(abs(yspeed) * walkspeed, dirfacing)); // calculate vector y component at walk speed, accounting for ysign

		image_xscale = facing div 2 > 1 ? -1 : 1;
				
		if place_free(xprop, yprop) // no collisions at destination (x, y)
		{
			x = xprop; // add xspeed to x
			y = yprop; // add yspeed to y
		}	
	}
	
	if keyboard_check_pressed(ord("Q"))
	{
		locked = !locked;
		camera_controller.locked = !camera_controller.locked; // toggle player camera lock
	}
		
	if keyboard_check_pressed(ord("E"))
	{
		show_debug_message("e pressed");
		// action
		var action = "";
		var resource_name = "";
		var inst = noone;
		li = ds_list_create();
		collision_line_list(x, y, x + reach * image_xscale, y, obj_resource, false, true, li, true);
		
		if (ds_list_size(li) > 0)
		{
			for (var i = 0; i < ds_list_size(li); i++)
			{
				inst = li[| i];
				resource_name = inst.name;
				action = global.interactions[? tool + " " + resource_name];
				
				if action != undefined && action != ""
				{
					break;
				}
			}
		}
		
		switch(action)
		{
			case "chop":
				var modifier = stats[? "strength"] / 2 + skills[? "logging"];
				var cl = global.required_levels[? action + " " + resource_name] - skills[? "logging"];
				var roll = irandom_range(1, 20);
				var success = roll + modifier >= cl ? true : false;
				inst.receiver = id;
				if success
				{
					inst.action_received = action;
					inst.alarm[11] = 1;
				}
			break;
			
			case "strip":
			
			case "identify":
			
			case "":
			
			case undefined:
			break;
		}
		
	}
	depth = -y;
}