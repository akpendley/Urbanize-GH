if !hover then
	{
	draw_sprite(sprite_index, 0, x, y);
	draw_sprite(spr_more_options, frame, x, y);
	frame += 1;
	if frame > 14 then
		frame = 0;
	}
else
	{
	draw_sprite(sprite_index, 0, x, y);
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(font_stockpile);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(x,y,string(production_remaining) + "/" + string(total_stone));
	draw_text(x + sprite_width/2 - 50, y + sprite_height/2, string(ds_priority_size(my_builders)) + "/" + string(builders_requested));
	}