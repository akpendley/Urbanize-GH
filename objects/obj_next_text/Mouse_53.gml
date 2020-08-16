if GUIHover() then
	{
		audio_play_sound(snd_click, 2, false);
		if obj_gasparaldo.line<obj_gasparaldo.lines-1 then
			{
			obj_gasparaldo.line += 1;
			}
		else
			{
			obj_gasparaldo.show_text = false;
			obj_gasparaldo.line = 0;
			obj_gasparaldo.part += 1;
			global.locked = false;
			obj_resource_tracker.alarm[0] = global.time_seconds*room_speed;
			if !instance_exists(obj_helper) then
				{
				h = instance_create_layer(0,0,"Instances",obj_helper);
				}
			else
				{
				h = instance_find(obj_helper, 0);
				}
			h.text = obj_gasparaldo.help_text[obj_gasparaldo.part];
			instance_destroy();
			}
		if obj_gasparaldo.part = 1 and obj_gasparaldo.line = 5 then
			{
			instance_create_layer(0,1344,"Instances",obj_marker);
			}
		if obj_gasparaldo.part = 6 and obj_gasparaldo.line = 3 then
			{
			global.unlocked[? "Quarry"] = 1;
			global.unlocked[? "Builder's Hut"] = 1;
			global.unlocked[? "Town Hall"] = 1;
			}
	}