building = true;
target_x = round((bbox_right + bbox_left) / 2);
target_y = round((bbox_bottom + bbox_top) / 2);
repeat(builders)
	{
	ds_priority_add(global.worklist, id, 10);
	builders_requested += 1;
	}