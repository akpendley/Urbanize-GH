//cycle through all stockpiles and update global totals
var total_logs = 0;
var total_stone = 0;
var total_lumber = 0;
var total_bricks = 0;
var total_iron = 0;
var total_coal = 0;
var total_steel = 0;
var total_cement = 0;
var total_food = 0;

for (var i = 0; i < instance_number(obj_stockpile); i ++)
	{
	stockpile = instance_find(obj_stockpile,i);
	for (var j = 0; j < array_length_1d(stockpile.slots); j++)
		{
		switch(stockpile.slots[j])
			{
			case "logs": total_logs += stockpile.values[j]; break;
			case "stone": total_stone += stockpile.values[j]; break;
			case "lumber": total_lumber += stockpile.values[j]; break;
			case "bricks": total_bricks += stockpile.values[j]; break;
			case "iron": total_iron += stockpile.values[j]; break;
			case "coal": total_coal += stockpile.values[j]; break;
			case "steel": total_steel += stockpile.values[j]; break;
			case "cement": total_cement += stockpile.values[j]; break;
			}
		}
	}

for (var i = 0; i < instance_number(obj_grain_silo); i ++)
	{
	silo = instance_find(obj_grain_silo,i);
	if instance_exists(silo) then
		{
		total_food += silo.value;
		}
	}
		
global.total_logs = total_logs;
global.total_stone = total_stone;
global.total_lumber = total_lumber;
global.total_bricks = total_bricks;
global.total_iron = total_iron;
global.total_coal = total_coal;
global.total_steel = total_steel;
global.total_cement = total_cement;
global.total_food = total_food;
global.food_consumed = instance_number(obj_citizen) + instance_number(obj_lumber_mill_worker) + instance_number(obj_farmer);

if global.total_lumber = 10 and obj_gasparaldo.part = 3 and obj_gasparaldo.show_text = false then
	{
	obj_gasparaldo.show_text = true;
	instance_create_layer(0,0,"Instances",obj_next_text);
	global.unlocked[? "Lumber Mill"] = 1;
	show_debug_message("I unlocked Lumber Mill");
	}	