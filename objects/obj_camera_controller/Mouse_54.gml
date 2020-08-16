if !global.locked then
{
if !locked then
{
//clear the old selections
deselect();

draw_selection_box = true;
global.selection_box_x1 = mouse_x;
global.selection_box_y1 = mouse_y;
global.selection_box_x2 = mouse_x;
global.selection_box_y2 = mouse_y;
}
}