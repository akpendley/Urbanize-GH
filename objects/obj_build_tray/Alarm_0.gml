var count = 0;
for (var i = 0; i < ds_list_size(list); i++)
	{
	if global.unlocked[? list[| i]] = 1
		{
		var instance = instance_create_layer(x, y, "Instances", obj_build_icon);
		instance.my_tray = id;
		instance.tray_slot = count;
		instance.basic_id = list[| i];
		instance.my_tab = my_tab;
		ds_queue_enqueue(icons, instance);
		count += 1;
		}	
	}