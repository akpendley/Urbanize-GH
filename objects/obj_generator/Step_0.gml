if !global.locked and !instance_exists(obj_begin) and autoset then
	{
	if !basic then
		{
		for (var i = 0; i < ds_list_size(global.basics); i++)
			{
			if global.unlocked[? global.basics[| i]] = 1 then
				{
				basic = true;
				var tab = instance_create_layer(0,0,"Instances",obj_build_tab);
				tab.list = global.basics;
				tab.sprite = spr_build_basics_tab;
				tab.gui_y = 200;
				tab.hover_text = "Build Basics";
				break;
				}
			}
		}
	if !resource then
		{
		for (var i = 0; i < ds_list_size(global.resources); i++)
			{
			if global.unlocked[? global.resources[| i]] = 1 then
				{
				resource = true;
				var tab = instance_create_layer(0,0,"Instances",obj_build_tab);
				tab.list = global.resources;
				tab.list_unlocked = global.unlocked;
				tab.sprite = spr_build_resources_tab;
				tab.gui_y = 300;
				tab.hover_text = "Build Resources";
				show_debug_message("Resource Tab unlocked");
				break;
				}
			}		
		} 
	if !govt then
		{
		for (var i = 0; i < ds_list_size(global.govts); i++)
			{
			if global.unlocked[? global.govts[| i]] = 1 then
				{
				govt = true;
				var tab = instance_create_layer(0,0,"Instances",obj_build_tab);
				tab.list = global.govts;
				tab.sprite = spr_build_govt_tab;
				tab.gui_y = 400;
				tab.hover_text = "Build Government";
				break;	
				}
			}	
		}
	if !amen then
		{
		for (var i = 0; i < ds_list_size(global.amen); i++)
			{
			if global.unlocked[? global.amen[| i]] = 1 then
				{
				amen = true;
				var tab = instance_create_layer(0,0,"Instances",obj_build_tab);
				tab.list = global.amen;
				tab.sprite = spr_build_amen_tab;
				tab.gui_y = 500;
				tab.hover_text = "Build Amenities";
				break;	
				}
			}	
		}
	}