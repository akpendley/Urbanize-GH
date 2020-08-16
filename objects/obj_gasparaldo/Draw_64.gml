if show_text then
	{
	draw_set_alpha(1);
	draw_sprite(spr_gasparaldo, 0, gui_x + 12, gui_y);
	draw_sprite(spr_text_box, 0, gui_x, gui_y);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(font_text_box);
	draw_set_color(c_white);
	draw_text_ext(gui_x + 30, gui_y + 40, str, 36, w);
	}
//draw_text(gui_x, gui_y, part);