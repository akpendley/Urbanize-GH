switch(step)
	{
	case 0: //Generating Land
		{
		audio_set_master_gain(0, 1);
		audio_play_sound(snd_forest, 1, true);
		draw = false;
		draw2 = false;
		randomize();
		global.locked = false;
		global.locked_time = 0;
		depth = -6000;
		seed = round(random_range(1000000,10000000));
		blockSize = 16;

		width = room_width / blockSize;
		height = room_height / blockSize;

		land_grid = ds_grid_create(width, height);
		tree_grid = ds_grid_create(width, height);
		rock_grid = ds_grid_create(width, height);
		global.stone_density_grid = ds_grid_create(width, height);
		global.fertility_grid = ds_grid_create(width, height);

		generate(land_grid);
		//seed = round(random_range(1000000,10000000));
		createRivers(irandom_range(1,6));
		createTiles();
		//seed = round(random_range(1000000,10000000));

		global.surf = -1;
		
		step = 1;
		progress = "Growing Trees";
		alarm[0] = 1;
		break;
		}
	case 1: //Generating Trees
		{
		generate(tree_grid);
		createTrees();
		step = 2;
		progress = "Tossing Rocks";
		alarm[0] = 1;
		break;
		}
	case 2: //Generating Rocks
		{
		generate(rock_grid);
		createRocks();
		step = 3;
		progress = "Playing with Dirt";
		alarm[0] = 1;
		break;
		}
	case 3: //Generating filter grids
		{
		//seed = round(random_range(1000000,10000000));
		generate(global.stone_density_grid);
		//seed = round(random_range(1000000,10000000));
		generate(global.fertility_grid);
		createStoneLayer();
		createFertilityLayer();
		step = 4;
		progress = "Letting the Ink Dry";
		alarm[0] = 30;
		break;
		}
	case 4: //Generating lists/maps
		{
		global.obstruction_worklist = ds_queue_create();
		global.collectables = ds_queue_create();
		global.worklist = ds_priority_create();

		global.item_sprites = ds_map_create();
		global.item_sprites[? "logs"] = spr_logs;
		global.item_sprites[? "stone"] = spr_stones;
		global.item_sprites[? "lumber"] = spr_lumber;

		global.item_to_object = ds_map_create();
		global.item_to_object[? "logs"] = obj_logs;
		global.item_to_object[? "stone"] = obj_stone;
		global.item_to_object[? "lumber"] = obj_lumber;
		global.item_to_object[? "food"] = obj_food;

		global.max_lumber = 20;
		global.max_bricks = 20;

		global.basics = ds_list_create(); //has all the keys
		ds_list_add(global.basics, "Road");
		ds_list_add(global.basics, "Stockpile");
		ds_list_add(global.basics, "Silo");
		ds_list_add(global.basics, "Builder's Hut");

		global.resources = ds_list_create();
		ds_list_add(global.resources, "Lumber Mill");
		ds_list_add(global.resources, "Quarry");
		ds_list_add(global.resources, "Farm");

		global.govts = ds_list_create();
		ds_list_add(global.govts, "Town Hall");
		
		global.amen = ds_list_create();
		ds_list_add(global.amen, "Inn");

		global.unlocked = ds_map_create();
		global.unlocked[? "Road"] = 1;
		global.unlocked[? "Stockpile"] = 1;
		global.unlocked[? "Silo"] = 1;
		global.unlocked[? "Lumber Mill"] = 1;
		global.unlocked[? "Quarry"] = 1;
		global.unlocked[? "Builder's Hut"] = 1;
		global.unlocked[? "Farm"] = 1;
		global.unlocked[? "Town Hall"] = 1;
		global.unlocked[? "Inn"] = 1;


		global.build_icon_sprites = ds_map_create();
		global.build_icon_sprites[? "Road"] = spr_build_icon_road;
		global.build_icon_sprites[? "Stockpile"] = spr_build_icon_stockpile;
		global.build_icon_sprites[? "Silo"] = spr_build_icon_silo;
		global.build_icon_sprites[? "Lumber Mill"] = spr_build_icon_lumber_mill;
		global.build_icon_sprites[? "Quarry"] = spr_build_icon_quarry;
		global.build_icon_sprites[? "Builder's Hut"] = spr_build_icon_builders_hut;
		global.build_icon_sprites[? "Farm"] = spr_build_icon_farm;
		global.build_icon_sprites[? "Town Hall"] = spr_build_icon_town_hall;
		global.build_icon_sprites[? "Inn"] = spr_build_icon_inn;

		global.build_objects = ds_map_create();
		global.build_objects[? "Road"] = obj_road;
		global.build_objects[? "Stockpile"] = obj_stockpile;
		global.build_objects[? "Silo"] = obj_grain_silo;
		global.build_objects[? "Lumber Mill"] = obj_lumber_mill;
		global.build_objects[? "Quarry"] = obj_quarry;
		global.build_objects[? "Builder's Hut"] = obj_builders_hut;
		global.build_objects[? "Farm"] = obj_farm;
		global.build_objects[? "Town Hall"] = obj_town_hall;
		global.build_objects[? "Inn"] = obj_inn;

		global.build_object_sprites = ds_map_create();
		global.build_object_sprites[? "Road"] = spr_road_solo;
		global.build_object_sprites[? "Stockpile"] = spr_supplydepot;
		global.build_object_sprites[? "Silo"] = spr_grain_silo;
		global.build_object_sprites[? "Lumber Mill"] = spr_lumber_mill;
		global.build_object_sprites[? "Quarry"] = spr_quarry;
		global.build_object_sprites[? "Builder's Hut"] = spr_builders_hut;
		global.build_object_sprites[? "Farm"] = spr_farm;
		global.build_object_sprites[? "Town Hall"] = spr_town_hall;
		global.build_object_sprites[? "Inn"] = spr_inn;

		global.work = ds_map_create();
		global.work[? "Road"] = 1;
		global.work[? "Stockpile"] = 3;
		global.work[? "Silo"] = 15;
		global.work[? "Lumber Mill"] = 10;
		global.work[? "Quarry"] = 40;
		global.work[? "Builder's Hut"] = 20;
		global.work[? "Farm"] = 25;
		global.work[? "Town Hall"] = 100;
		global.work[? "Inn"] = 100;

		global.wood = ds_map_create();
		global.wood[? "Road"] = 0;
		global.wood[? "Stockpile"] = 0;
		global.wood[? "Silo"] = 5;
		global.wood[? "Lumber Mill"] = 10;
		global.wood[? "Quarry"] = 20;
		global.wood[? "Builder's Hut"] = 15;
		global.wood[? "Farm"] = 20;
		global.wood[? "Town Hall"] = 0;
		global.wood[? "Inn"] = 15;

		global.lumber = ds_map_create();
		global.lumber[? "Road"] = 0;
		global.lumber[? "Stockpile"] = 0;
		global.lumber[? "Silo"] = 15;
		global.lumber[? "Lumber Mill"] = 0;
		global.lumber[? "Quarry"] = 0;
		global.lumber[? "Builder's Hut"] = 5;
		global.lumber[? "Farm"] = 0;
		global.lumber[? "Town Hall"] = 80;
		global.lumber[? "Inn"] = 30;

		global.stone = ds_map_create();
		global.stone[? "Road"] = 0;
		global.stone[? "Stockpile"] = 0;
		global.stone[? "Silo"] = 10;
		global.stone[? "Lumber Mill"] = 0;
		global.stone[? "Quarry"] = 0;
		global.stone[? "Builder's Hut"] = 0;
		global.stone[? "Farm"] = 15;
		global.stone[? "Town Hall"] = 80;
		global.stone[? "Inn"] = 25;

		global.iron = ds_map_create();
		global.iron[? "Road"] = 0;
		global.iron[? "Stockpile"] = 0;
		global.iron[? "Silo"] = 0;
		global.iron[? "Lumber Mill"] = 0;
		global.iron[? "Quarry"] = 0;
		global.iron[? "Builder's Hut"] = 0;
		global.iron[? "Farm"] = 0;
		global.iron[? "Town Hall"] = 0;
		global.iron[? "Inn"] = 0;

		global.steel = ds_map_create();
		global.steel[? "Road"] = 0;
		global.steel[? "Stockpile"] = 0;
		global.steel[? "Silo"] = 0;
		global.steel[? "Lumber Mill"] = 0;
		global.steel[? "Quarry"] = 0;
		global.steel[? "Builder's Hut"] = 0;
		global.steel[? "Farm"] = 0;
		global.steel[? "Town Hall"] = 0;
		global.steel[? "Inn"] = 0;

		global.cement = ds_map_create();
		global.cement[? "Road"] = 0;
		global.cement[? "Stockpile"] = 0;
		global.cement[? "Silo"] = 0;
		global.cement[? "Lumber Mill"] = 0;
		global.cement[? "Quarry"] = 0;
		global.cement[? "Builder's Hut"] = 0;
		global.cement[? "Farm"] = 0;
		global.cement[? "Town Hall"] = 0;
		global.cement[? "Inn"] = 0;

		global.gold = ds_map_create();
		global.gold[? "Road"] = 0;
		global.gold[? "Stockpile"] = 0;
		global.gold[? "Silo"] = 0;
		global.gold[? "Lumber Mill"] = 0;
		global.gold[? "Quarry"] = 0;
		global.gold[? "Builder's Hut"] = 0;
		global.gold[? "Farm"] = 0;
		global.gold[? "Town Hall"] = 0;
		global.gold[? "Inn"] = 0;
		
		global.build_icon_text = ds_map_create();
		
		global.build_icon_text[? "Road"] = "Road\n\nGreen shirts, residents, and tourists will only use your road network to get around town. Builders are more rugged and go where they please.\n\nCannot be placed on obstacles or water. Left click to set the anchor point, left click again to set the distance of road to build.";
		global.build_icon_text[? "Stockpile"] = "Stockpile\n\nThe storage means for any burgeoning settlement. The stockpile has four item slots that can each hold one hundred of any resource.";
		global.build_icon_text[? "Silo"] = "Silo\n\nThe host of your village's food supplies. The silo can hold up to six hundred food.";
		global.build_icon_text[? "Lumber Mill"] = "Lumber Mill\n\nWhere logs are cut into lumber. A green shirt carpenter works here and will cut logs until the max lumber target is met. Left click to increase max lumber target by 10, right click to decrease.";
		global.build_icon_text[? "Quarry"] = "Quarry\n\nThough an eye-sore the quarry is a necessity for its ample stone supply. The quarry must be operated by your Builders. The maximum production of the quarry is determined by the land it occupies. Once dry the quarry can be filled via canals to function as a mill pond.";
		global.build_icon_text[? "Builder's Hut"] = "Builder's Hut\n\nUpon completion another Builder will join the settlement's entourage.";
		global.build_icon_text[? "Farm"] = "Farm\n\nMore than just a family garden, this farm can potentially provide up to ninety food per day. The crop is mature at noon each day and a green shirt farmer will harvest and transport the food to a nearby silo. The minimum food per day of a farm is twenty food.";
		global.build_icon_text[? "Town Hall"] = "Town Hall\n\nThe first true beacon of civilization, the Town Hall forms the backbone of the local government. The first office of the Hall is the Landlord's. Use the Landlord to designate land parcels for sale to potential residents.";		
		global.build_icon_text[? "Inn"] = "Inn\n\nA hub for the weary and wandering, the Inn will bring in tourism from the Capital. The upkeep for the Inn is 10 food per day. A green shirt innkeep will fetch the food from the silo. The tourism output of the inn is relative to its food supply.\n\nThe inn will provide income based on taxes from sales to visitors.";

		global.gui_layer = layer_create(-6000);

		show_debug_message(instance_count);		
		
		global.road_network = mp_grid_create(-480,0,180,150,16,16);
		global.workers_map = mp_grid_create(-480,0,180,150,16,16);

		for(var j = 0; j < height; j++)
			{
			for(var i = 0; i < width; i++)
				{
				var tl = tile_get_index(tilemap_get_at_pixel(global.ground_tilemap_grass, i * 16, j * 16));
				if (tl >= 4) then
					{
					mp_grid_add_cell(global.workers_map, i+30, j);
					}
				}
			}			
		
		mp_grid_add_rectangle(global.road_network, -480, 0, room_width, room_height);
		mp_grid_clear_rectangle(global.road_network, -480, 1344, 0, 1360);

		basic = false;
		resource = false;
		govt = false;
		amen = false;
		autoset = true;
		instance_create_layer(-480,0,"Instances",obj_left_border);
		instance_create_layer(-480,1200,"Instances",obj_left_border);
		instance_create_layer(-272,1216,"Instances",obj_display_farm);
		instance_create_layer(-432,1376,"Instances",obj_display_farm);
		instance_create_layer(-544,1344,"Instances",obj_display_road);
		var count = 16;
		for (var i = 0; i < count; i++)
			{
			instance_create_layer(-512 + i * 32, 1344, "Instances", obj_road);
			}
		instance_create_layer(1216,1312,"Instances",obj_begin);
		instance_create_layer(1216,1216,"Instances",obj_camera_controller);
		instance_create_layer(1216,480,"Instances",obj_camera);
		instance_create_layer(1300, 1344, "Instances", obj_starting_caravan);
		break;
		}
	}