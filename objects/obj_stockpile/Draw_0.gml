draw_sprite(sprite_index, 0, x, y);
for(var i = 0; i < array_length_1d(slots); i++)
	{
	if values[i] > 0 then
		{
		draw_sprite(global.item_sprites[? slots[i]], 0, x + (((i + 2) mod 2) * 16), y + i div 2 * 16);
		if hover then
			{
			draw_set_font(font_stockpile);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text(x + (((i + 2) mod 2) * 16), y + i div 2 * 16, values[i]);
			}
		}
	}