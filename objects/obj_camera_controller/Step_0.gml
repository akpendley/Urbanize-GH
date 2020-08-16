if !global.locked then
	{
	if !locked then
		{
		if (keyboard_check(ord("A"))) then
			{
			if (x - camera_speed > 0) then
				{
				x -= camera_speed;
				}
			}
		if (keyboard_check(ord("D"))) then
			{
			if (x + camera_speed < room_width - 540) then
				{
				x += camera_speed;
				}
			}
		if (keyboard_check(ord("W"))) then
			{
			if (y - camera_speed > 270) then
				{
				y -= camera_speed;
				}
			}
		if (keyboard_check(ord("S"))) then
			{
			if (y + camera_speed < room_height - 270) then
				{
				y += camera_speed;
				}
			}
		if (keyboard_check(vk_escape)) then
			{
			game_end();
			}
	
		if draw_selection_box then
			{
			global.selection_box_x2 = mouse_x;
			global.selection_box_y2 = mouse_y;
			}
		}
	else
		{
		if instance_exists(global.player_one)
			{
			x = global.player_one.x;
			y = global.player_one.y;
			}
		}
	}