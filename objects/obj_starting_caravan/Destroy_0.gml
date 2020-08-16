var value = 10;
var item_drop = obj_lumber;
repeat(value)
	{
	instance_create_layer(x + irandom_range(-20, 20), y + irandom_range(-20, 20), "Instances", item_drop);
	}
	
value = 10;
item_drop = obj_stone;
repeat(value)
	{
	instance_create_layer(x + irandom_range(-20, 20), y + irandom_range(-20, 20), "Instances", item_drop);
	}
	
value = 10;
item_drop = obj_food;
repeat(value)
	{
	instance_create_layer(x + irandom_range(-20, 20), y + irandom_range(-20, 20), "Instances", item_drop);
	}
	
global.total_gold += 50;