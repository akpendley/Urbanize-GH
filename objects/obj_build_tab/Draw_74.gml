gpu_set_zwriteenable(false);
draw_sprite(sprite, 0, gui_x, gui_y);
if hover then
	{
	draw_set_color(c_white);
	draw_set_font(font_build_tray);
	draw_set_alpha(1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text(gui_x - 6, gui_y + 50, hover_text);
	}
gpu_set_zwriteenable(true);