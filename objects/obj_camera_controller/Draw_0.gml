if !global.locked then
{
if !locked then
{
if draw_selection_box then
	{
	draw_set_color(c_red);
	draw_rectangle(global.selection_box_x1, global.selection_box_y1, global.selection_box_x2, global.selection_box_y2, true);
	}
}
}