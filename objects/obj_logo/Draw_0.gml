draw_sprite_ext(sprite_index, image_index, room_width/2, room_height/2, 10,10,0,c_white,1);
draw_set_color(c_black);
if fade_to_black then
	{
	draw_set_alpha(fade_time/max_fade_time);
	audio_set_master_gain(0, 1 - fade_time/max_fade_time);
	}
else
	{
	draw_set_alpha(fade_time/max_fade_time);
	audio_set_master_gain(0, 1 - fade_time/max_fade_time);
	}
draw_rectangle(-1000,0,room_width,room_height,false);
draw_set_alpha(1);