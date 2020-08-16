while ds_queue_size(icons) > 0
	{
	with ds_queue_dequeue(icons)
		instance_destroy();
	}