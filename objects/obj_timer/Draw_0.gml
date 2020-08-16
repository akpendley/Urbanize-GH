draw_set_color(c_black);
if fade_to_black then
	{
	draw_set_alpha(fade_time/max_fade_time)
	}
else
	{
	draw_set_alpha(fade_time/max_fade_time);
	}
draw_rectangle(-1000,0,room_width,room_height,false);
draw_set_alpha(1);