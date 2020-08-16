var count = 0;
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(0,0,room_width,60,false);
draw_set_alpha(1);
draw_set_color(font_color);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(font);
if instance_number(obj_citizen) > 0 then
	{
	draw_sprite(spr_worker_icon, 0, gui_x + 100 * count, gui_y);
	draw_text(gui_x + 100 * count + 50, gui_y + gui_font_y, string(instance_number(obj_citizen)));
	count += 1;
	}
if global.total_gold > 0 then
	{
	draw_sprite(spr_gold_icon, 0, gui_x + 100 * count, gui_y);
	draw_text(gui_x + 100 * count + 50, gui_y + gui_font_y, string(global.total_gold));
	count += 1;
	}
if global.total_logs > 0 then
	{
	draw_sprite(spr_logs_icon, 0, gui_x + 100 * count, gui_y);
	draw_text(gui_x + 100 * count + 50, gui_y + gui_font_y, string(global.total_logs));
	count += 1;
	}
if global.total_stone > 0 then
	{
	draw_sprite(spr_stone_icon, 0, gui_x + 100 * count, gui_y);
	draw_text(gui_x + 100 * count + 50, gui_y + gui_font_y, string(global.total_stone));
	count += 1;
	}
if global.total_lumber > 0 then
	{
	draw_sprite(spr_lumber_icon, 0, gui_x + 100 * count, gui_y);
	draw_text(gui_x + 100 * count + 50, gui_y + gui_font_y, string(global.total_lumber));
	count += 1;
	}
if global.total_food > 0 then
	{
	draw_sprite(spr_food_icon, 0, gui_x + 100 * count, gui_y);
	draw_text(gui_x + 100 * count + 50, gui_y + gui_font_y, string(global.total_food) + "/" + string(global.food_consumed));
	count += 1;
	}
if global.overall_appeal > 0 then
	{
	draw_text(gui_x + 100 * count, gui_y + gui_font_y, string(100 * (1 - round(global.average_appeal/global.overall_appeal))) + "%");
	}
