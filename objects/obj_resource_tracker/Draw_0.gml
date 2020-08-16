if draw_stone_filter then
	{
	var width = obj_generator.width;
	var height = obj_generator.height;
	var cam_width = 914;
	var cam_height = 684;
	var cam_x = obj_camera_controller.x;
	var cam_y = obj_camera_controller.y;
	draw_set_alpha(0.9);
	for(var i = 0; i < width; i++)
		{
		for(var j = 0; j < height; j++)
			{
			//if the cell is onscreen
			if i*16 > cam_x - cam_width and i*16 < cam_x + cam_width and j*16 > cam_y - cam_height and j*16 < cam_y + cam_height then
				{
				//draw its stone density lerped between black and grey
				var lerped_color = merge_color(c_black, stone_color, global.stone_density_grid[# i, j]/100);
				draw_set_color(lerped_color);
				draw_rectangle(i*16,j*16,i*16+16,j*16+16,false);
				}
			}
		}
	draw_set_alpha(1);
	}
if draw_fertility_filter then
	{
	var width = obj_generator.width;
	var height = obj_generator.height;
	var cam_width = 914;
	var cam_height = 684;
	var cam_x = obj_camera_controller.x;
	var cam_y = obj_camera_controller.y;
	draw_set_alpha(0.9);
	for(var i = 0; i < width; i++)
		{
		for(var j = 0; j < height; j++)
			{
			//if the cell is onscreen
			if i*16 > cam_x - cam_width and i*16 < cam_x + cam_width and j*16 > cam_y - cam_height and j*16 < cam_y + cam_height then
				{
				//draw its stone density lerped between black and yellow
				var lerped_color = merge_color(brown, c_lime, global.fertility_grid[# i, j]/100);
				draw_set_color(lerped_color);
				draw_rectangle(i*16,j*16,i*16+16,j*16+16,false);
				}
			}
		}
	draw_set_alpha(1);
	}

//draw_set_alpha(0.1);
//if global.time < 12 then
//	{
//	draw_set_color(merge_color(spring[1],spring[0],12-global.time/6));
//	}
//else if global.time > 12 then
//	{
//	draw_set_color(merge_color(spring[2], spring[1],20-global.time/8));
//	}
//draw_rectangle(-480,0,room_width,room_height,false);
//draw_set_alpha(1);

//draw_text(0,100,global.time);