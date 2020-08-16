if autoset then
	{
	if draw then
		{
		draw_set_alpha(0.3);
		mp_grid_draw(global.workers_map);
		draw_set_alpha(1);
		}
	if draw2 then
		{
		draw_set_alpha(0.3);
		mp_grid_draw(global.road_network);
		draw_set_alpha(1);
		}
	}
else
	{
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(0,0,960,540,false);
	draw_set_color(make_color_rgb(255,231,127));
	draw_rectangle(400,300,560,330,true);
	draw_rectangle(400,301,400 + 160 * step/5,330,false);
	draw_set_font(font_resource_tracker);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(480, 270, progress);
	}