function placeRoads(argument0, argument1, argument2, argument3, argument4) {
	var num = argument0; //number of 32x32 roads to place
	var xx = argument1; //the x position to start placing
	var yy = argument2; //the y position to start placing
	var horizontal = argument3;
	var neg = argument4;

	if horizontal then
		{
		if neg then
			{
			for (var i = 0; i < num + 1; i++)
				{
				var instance = instance_create_layer(xx - i * 32, yy, "Instances", obj_build_site);
				instance.already_placed = true;
				instance.complete_obj = obj_road;
				instance.sprite = spr_road_solo;
				instance.work_to_complete = 1;
				instance.wood_to_complete = 0;
				instance.lumber_to_complete = 0;
				instance.stone_to_complete = 0;
				instance.iron_to_complete = 0;
				instance.steel_to_complete = 0;
				instance.cement_to_complete = 0;
				instance.gold_to_complete = 0;	
				instance.follow_mouse = false;
				instance.alarm[2] = 1;
				}		
			}
		else
			{
			for (var i = 0; i < num; i++)
				{
				var instance = instance_create_layer(xx + i * 32, yy, "Instances", obj_build_site);
				instance.already_placed = true;
				instance.complete_obj = obj_road;
				instance.sprite = spr_road_solo;
				instance.work_to_complete = 1;
				instance.wood_to_complete = 0;
				instance.lumber_to_complete = 0;
				instance.stone_to_complete = 0;
				instance.iron_to_complete = 0;
				instance.steel_to_complete = 0;
				instance.cement_to_complete = 0;
				instance.gold_to_complete = 0;	
				instance.follow_mouse = false;
				instance.alarm[2] = 1;
				}
			}
		}
	else
		{
		if neg then
			{
			for (var i = 0; i < num + 1; i++)
				{
				var instance = instance_create_layer(xx, yy - i * 32, "Instances", obj_build_site);
				instance.already_placed = true;
				instance.complete_obj = obj_road;
				instance.sprite = spr_road_solo;
				instance.work_to_complete = 1;
				instance.wood_to_complete = 0;
				instance.lumber_to_complete = 0;
				instance.stone_to_complete = 0;
				instance.iron_to_complete = 0;
				instance.steel_to_complete = 0;
				instance.cement_to_complete = 0;
				instance.gold_to_complete = 0;	
				instance.follow_mouse = false;
				instance.alarm[2] = 1;
				}		
			}
		else
			{
			for (var i = 0; i < num; i++)
				{
				var instance = instance_create_layer(xx, yy + i * 32, "Instances", obj_build_site);
				instance.already_placed = true;
				instance.complete_obj = obj_road;
				instance.sprite = spr_road_solo;
				instance.work_to_complete = 1;
				instance.wood_to_complete = 0;
				instance.lumber_to_complete = 0;
				instance.stone_to_complete = 0;
				instance.iron_to_complete = 0;
				instance.steel_to_complete = 0;
				instance.cement_to_complete = 0;
				instance.gold_to_complete = 0;	
				instance.follow_mouse = false;
				instance.alarm[2] = 1;
				}	
			}
		}


}
