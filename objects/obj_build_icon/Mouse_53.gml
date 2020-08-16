if auto_set then
	{
	if hover and !my_tray.icons_inactive then
		{
		audio_play_sound(snd_click, 2, false);
		my_tray.move_right = true;
		my_tray.move_left = false;
		my_tray.death = true;
		my_tab.move_right = true;
		my_tab.move_left = false;
		my_tab.activated = false;
	
		var instance = instance_create_layer(mouse_x, mouse_y, "Instances", obj_build_site);
		//required values
		instance.complete_obj = complete_obj;
		instance.sprite = sprite;
		instance.work_to_complete = work_to_complete;
		instance.wood_to_complete = wood_to_complete;
		instance.lumber_to_complete = lumber_to_complete;
		instance.stone_to_complete = stone_to_complete;
		instance.iron_to_complete = iron_to_complete;
		instance.steel_to_complete = steel_to_complete;
		instance.cement_to_complete = cement_to_complete;
		instance.gold_to_complete = gold_to_complete;
		}
	}