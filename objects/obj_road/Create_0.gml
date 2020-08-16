with obj_road
	sprite_index = resetRoadSprites();
if instance_exists(obj_gasparaldo) then
	{
	if !global.unlocked[? "Stockpile"] and x = 0 and y = 1344 then
		{
		global.unlocked[? "Stockpile"] = 1;
		obj_gasparaldo.part = 2;
		obj_gasparaldo.line = 0;
		sfx(snd_chord, 5, false);
		obj_gasparaldo.show_text = true;
		instance_create_layer(0,0,"Instances",obj_next_text);
		instance_create_layer(-480, 1354, "Instances", obj_starting_caravan);
		}
	}
if instance_exists(obj_generator) then
	{
	mp_grid_clear_rectangle(global.road_network, x, y, x + sprite_width - 1, y + sprite_height - 1);
	}	
	
depth = -1;