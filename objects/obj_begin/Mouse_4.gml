audio_play_sound(snd_click, 2, false);
obj_camera_controller.locked = false;

instance_create_layer(0, 0, "Instances", obj_resource_tracker);

with (obj_tree)
	{
	if x < 350 and y > 1150 and y < 1500 then
		{
		instance_destroy();
		}
	}
with (obj_small_tree)
	{
	if x < 350 and y > 1150 and y < 1500 then
		{
		instance_destroy();
		}
	}
	
with (obj_logs)
	{
	instance_destroy();
	}	

with (obj_big_rock)
	{
	if x < 350 and y > 1150 and y < 1500 then
		{
		instance_destroy();
		}	
	}
	
with (obj_small_rock)
	{
	if x < 350 and y > 1150 and y < 1500 then
		{
		instance_destroy();
		}	
	}

with (obj_stone)
	{
	instance_destroy();
	}
	
ds_priority_clear(global.worklist);

instance_create_layer(0, 1300, "Instances", obj_citizen);
instance_create_layer(32, 1300, "Instances", obj_citizen);
instance_create_layer(64, 1300, "Instances", obj_citizen);
global.player_one = instance_create_layer(196, 1300, "Instances", obj_planner);

////////////////////// TUTORIAL MODE ////////////////////////

/*instance_create_layer(x,y,"Instances",obj_gasparaldo);
		global.unlocked[? "Road"] = 1;
		global.unlocked[? "Stockpile"] = 1;
		global.unlocked[? "Silo"] = 1;
		global.unlocked[? "Lumber Mill"] = 1;
		global.unlocked[? "Quarry"] = 1;
		global.unlocked[? "Builder's Hut"] = 1;
		global.unlocked[? "Farm"] = 1;
		global.unlocked[? "Town Hall"] = 1;
		global.unlocked[? "Inn"] = 1;
*/
////////////////////// TUTORIAL MODE /////////////////////////

global.unlocked[? "Road"] = 1;
global.unlocked[? "Stockpile"] = 1;
global.unlocked[? "Silo"] = 1;
global.unlocked[? "Lumber Mill"] = 1;
global.unlocked[? "Quarry"] = 1;
global.unlocked[? "Builder's Hut"] = 1;
global.unlocked[? "Farm"] = 1;
global.unlocked[? "Town Hall"] = 1;
global.unlocked[? "Inn"] = 1;

obj_camera_controller.x = 0;
obj_camera_controller.y = 1344;
instance_destroy();