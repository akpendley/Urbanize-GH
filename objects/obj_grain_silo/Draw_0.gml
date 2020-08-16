draw_sprite(sprite_index, 0, x, y);
if checkHover() then
	{
	draw_set_alpha(0.5);
	var count = value div 60;
	clamp(count, 1, 10);
	for (var i = 0; i < count; i++)
		{
		draw_sprite(spr_silo_food, 0, x + 8, y + 83 - i * 7);
		}
	draw_set_alpha(1);
	draw_sprite(spr_food, 0, x+16, y+39);
	draw_set_color(c_white);
	draw_set_font(font_building_GUI);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(x+24, y+55, value);
	}