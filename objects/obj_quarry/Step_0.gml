if cancel = 0 and ds_priority_size(my_builders) > 0 then //if there is no cancel button and there are assigned workers
	{
	cancel = instance_create_layer(x + (sprite_width/2) + 10, y + (sprite_height/3), "Instances", obj_cancel_workers);
	cancel.my_dropper = id;
	}
else if ds_priority_size(my_builders) = 0 then
	{
	if cancel != 0 then
		{
		with cancel
			instance_destroy();
		}
	}	
if increase = 0 then
	{
	increase = instance_create_layer(x + (sprite_width/2) - 10, y + (sprite_height/3), "Instances", obj_increase_workers);
	increase.my_dropper = id;
	increase.priority = 6;
	}
			
if checkHover() then
	{
	increase.visible = true;
	cancel.visible = true;
	}
else
	{
	increase.visible = false;
	cancel.visible = false;
	}