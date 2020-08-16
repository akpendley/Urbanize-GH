if !checkHover() then
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
	draw_text(x + 85, y + 30, "Food per Day");
	draw_text(x + 105, y + 50,string(food_per_day));
	draw_sprite(spr_food, 0, x + 85, y + 50);
	}