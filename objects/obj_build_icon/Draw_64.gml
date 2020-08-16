gpu_set_zwriteenable(false);
if auto_set then
	{
	draw_sprite(icon_sprite, 0, gui_x, gui_y);
	draw_set_font(font);
	draw_set_color(color);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(font_small);
	draw_text(gui_x + name_x, gui_y + name_y, basic_id);
	
	var count = 0;
	
	if wood_to_complete > 0 then
		{
		draw_sprite(spr_logs, 0, gui_x + materials_x, gui_y + materials_y_sep * count);
		if wood_to_complete <= global.total_logs then
			{
			draw_set_color(c_lime);
			}
		else
			{
			draw_set_color(c_orange);
			}
		draw_text(gui_x + materials_x + text_sep_x, gui_y + materials_y + materials_y_sep * count, wood_to_complete);
		count += 1;
		}
		
	if stone_to_complete > 0 then
		{
		draw_sprite(spr_stones, 0, gui_x + materials_x, gui_y + materials_y_sep * count);
		if stone_to_complete <= global.total_stone then
			{
			draw_set_color(c_lime);
			}
		else
			{
			draw_set_color(c_orange);
			}
		draw_text(gui_x + materials_x + text_sep_x, gui_y + materials_y + materials_y_sep * count, stone_to_complete);
		count += 1;
		}
		
	if lumber_to_complete > 0 then
		{
		draw_sprite(spr_lumber, 0, gui_x + materials_x, gui_y + materials_y_sep * count);
		if lumber_to_complete <= global.total_lumber then
			{
			draw_set_color(c_lime);
			}
		else
			{
			draw_set_color(c_orange);
			}
		draw_text(gui_x + materials_x + text_sep_x, gui_y + materials_y + materials_y_sep * count, lumber_to_complete);
		count += 1;
		}
	
	if GUIHover() then
		{
		draw_set_font(font_build_tray);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		var hh = string_height_ext(text, 24, 330)/2;
		draw_set_color(c_greyblue)
		draw_set_alpha(0.74);
		draw_rectangle(gui_x-360,gui_y-hh-10+48,gui_x-10,gui_y+hh+10+48,false);
		draw_set_alpha(1);
		draw_set_color(c_ublue);
		draw_rectangle(gui_x-360,gui_y-hh-10+48,gui_x-10,gui_y+hh+10+48,true);
		draw_rectangle(gui_x-361,gui_y-hh-11+48,gui_x-9,gui_y+hh+11+48,true);
		draw_set_color(c_ured);
		draw_rectangle(gui_x-362,gui_y-hh-12+48,gui_x-8,gui_y+hh+12+48,true);
		draw_rectangle(gui_x-363,gui_y-hh-13+48,gui_x-7,gui_y+hh+13+48,true);
		draw_set_color(c_uyellow);
		draw_rectangle(gui_x-364,gui_y-hh-14+48,gui_x-6,gui_y+hh+14+48,true);
		draw_rectangle(gui_x-365,gui_y-hh-15+48,gui_x-5,gui_y+hh+15+48,true);
		draw_set_color(c_white);
		draw_text_ext(gui_x-350, gui_y-hh+48, text, 24, 330);
		}
	}
gpu_set_zwriteenable(true);