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
	draw_set_font(font_building_GUI);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(x + 105, y + 15, "Max Lumber");
	draw_text(x + 70, y + 32,string(global.max_lumber));
	draw_sprite(spr_lumber, 0, x + 110, y + 12);
	}