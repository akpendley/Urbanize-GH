if autoset then
	{
	if complete_obj != obj_road or already_placed then
		{
		if follow_mouse then
			{
			if valid_placement then
				{
				draw_sprite_ext(sprite, 0, x, y, 1, 1, 0, c_white, 0.6);
				}
			else
				{
				draw_sprite_ext(sprite, 0, x, y, 1, 1, 0, c_red, 0.6);
				}
			}
		}
	else if complete_obj = obj_road and !already_placed then
		{
		if !building then
			{
			if valid_placement then
				{
				draw_set_color(c_lime);
				}
			else
				{
				draw_set_color(c_red);
				}
			draw_set_alpha(0.4);
			if road_horizontal then
				{
				if negative then
					{
					draw_rectangle(x + 32,y,x-road_size*32,y+31,false);
					}
				else
					{
					draw_rectangle(x,y,x+road_size*32,y+31,false);
					}
				}
			else
				{
				if negative then
					{
					draw_rectangle(x,y + 32,x+31,y-road_size*32,false);
					}
				else
					{
					draw_rectangle(x,y,x+31,y+road_size*32,false);
					}
				}
			draw_set_alpha(1);			
			}
		}

	if building then
		{
		var count = 0;
		for(var j = 0; j < ysize; j++)
			{
			for(var i = 0; i < xsize; i++)
				{
				if delay[count] > 0 then
					{
					delay[count] -= 1;
					}
				else
					{
					draw_sprite(spr_build_site_dirt, 0, x + i * 16, y + y_off + j * 16 - y_val[count]);
					if y_val[count] > 0 then
						{
						y_val[count] -= 8;
						}
					}
				count += 1;
				}
			}

		//draw_sprite(spr_build_site_post_left, 0, x, y + y_off + ysize * 16);
		//draw_sprite(spr_build_site_post_right, 0, x + xsize * 16, y + y_off);
		//draw_sprite(spr_build_site_post_right, 0, x + xsize * 16, y + y_off + ysize * 16);	
		draw_set_color(c_black);
		draw_rectangle((x * 2 + xsize * 16) div 2 - 11, (bbox_top * 2 + y_off + ysize * 16) div 2 - 3, (x * 2 + xsize * 16) div 2 + 11, (bbox_top * 2 + y_off + ysize * 16) div 2 + 3, false);
		draw_set_color(c_blue);
		draw_rectangle((x * 2 + xsize * 16) div 2 - 10, (bbox_top * 2 + y_off + ysize * 16) div 2 - 2, (x * 2 + xsize * 16) div 2 - 10 + work/work_to_complete * 20, (bbox_top * 2 + y_off + ysize * 16) div 2 + 3, false);	
	
		var count = 1;

		draw_sprite(spr_workers_small_icon, 0, x, y + y_off);
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(font_stockpile);
		draw_text(x + 15, y + y_off + 8, string(ds_priority_size(my_builders)) + "/" + string(builders_requested));

		if text_wood > 0 then
			{
			draw_sprite(spr_logs, 0, x, y + y_off + 16 * count);
			if text_wood - wood_to_complete < text_wood then
				{
				draw_set_color(c_white);
				}
			else
				{
				draw_set_color(c_green);
				}
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_font(font_stockpile);
			draw_text(x + 20, y + y_off + 8 + 16 * count, string(text_wood - wood_to_complete) + "/" + string(text_wood));
			count += 1;
			}
		if text_stone > 0 then
			{
			draw_sprite(spr_stone, 0, x, y + y_off + 16 * count);
			if text_stone - stone_to_complete < text_stone then
				{
				draw_set_color(c_white);
				}
			else
				{
				draw_set_color(c_green);
				}
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_font(font_stockpile);
			draw_text(x + 20, y + y_off + 8 + 16 * count, string(text_stone - stone_to_complete) + "/" + string(text_stone));
			count += 1;
			}
		if text_lumber > 0 then
			{
			draw_sprite(spr_lumber, 0, x, y + y_off + 16 * count);
			if text_lumber - lumber_to_complete < text_lumber then
				{
				draw_set_color(c_white);
				}
			else
				{
				draw_set_color(c_green);
				}
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_font(font_stockpile);
			draw_text(x + 20, y + y_off + 8 + 16 * count, string(text_lumber - lumber_to_complete) + "/" + string(text_lumber));
			count += 1;
			}
		}
	}