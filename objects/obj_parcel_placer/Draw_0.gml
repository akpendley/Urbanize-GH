if valid_placement then
	{
	draw_set_color(c_lime);
	}
else
	{
	draw_set_color(c_red);
	}
draw_set_alpha(0.4);
draw_rectangle(x,y,x+parcel_width*16,y+31,false);
draw_set_alpha(1);