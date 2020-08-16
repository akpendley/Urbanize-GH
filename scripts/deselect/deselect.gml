while (ds_queue_size(global.destroyables_selected) > 0)
	{
	with (ds_queue_dequeue(global.destroyables_selected))
		{
		if task_type != "store food" or task_type != "collect" then
			{
			sprite_index = unselected_sprite;
			}
		else
			{
			sprite_index = rejected_sprite;
			}
		}
	}
with (obj_remove_obstructions)
	{
	instance_destroy();
	}
number_selected = 0;