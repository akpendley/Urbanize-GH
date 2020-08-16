draw_sprite(sprite_index, image_index, gui_x, gui_y);
if GUIHover() then
	{
	draw_set_font(font_resource_tracker);
	var hh = string_height_ext(text, 24, 330);
	draw_set_color(c_greyblue)
	draw_set_alpha(0.74);
	draw_rectangle(gui_x,gui_y-hh-30,gui_x+350,gui_y-10,false);
	draw_set_alpha(1);
	draw_set_color(c_ublue);
	draw_rectangle(gui_x,gui_y-hh-30,gui_x+350,gui_y-10,true);
	draw_rectangle(gui_x-1,gui_y-hh-31,gui_x+351,gui_y-9,true);
	draw_set_color(c_ured);
	draw_rectangle(gui_x-2,gui_y-hh-32,gui_x+352,gui_y-8,true);
	draw_rectangle(gui_x-3,gui_y-hh-33,gui_x+353,gui_y-7,true);
	draw_set_color(c_uyellow);
	draw_rectangle(gui_x-4,gui_y-hh-34,gui_x+354,gui_y-6,true);
	draw_rectangle(gui_x-5,gui_y-hh-35,gui_x+355,gui_y-5,true);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(gui_x + 10, gui_y - hh - 20, text, 24, 330);
	}
	