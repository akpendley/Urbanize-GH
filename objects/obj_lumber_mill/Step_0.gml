if max_increase = 0 or !instance_exists(max_increase) then
	{
	max_increase = instance_create_layer(x+75,y+28,"Instances", obj_max_increase);
	max_increase.stat = "lumber";
	max_increase.my_dropper = id;
	}
	
if max_decrease = 0 or !instance_exists(max_decrease) then	
	{
	max_decrease = instance_create_layer(x+88,y+28,"Instances", obj_max_decrease);
	max_decrease.stat = "lumber";
	max_decrease.my_dropper = id;
	}

if checkHover() then
	{
	max_increase.visible = true;
	max_decrease.visible = true;
	}
else
	{
	max_increase.visible = false;
	max_decrease.visible = false;
	}