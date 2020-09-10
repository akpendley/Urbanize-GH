function transferSelectedToWorklist() {
	while (ds_queue_size(global.destroyables_selected) > 0)
		{
		var a = ds_queue_dequeue(global.destroyables_selected);
		with (a)
			{
			sprite_index = unselected_sprite;
			}
		ds_priority_add(global.worklist, a, 2);
		}
	instance_destroy();


}
