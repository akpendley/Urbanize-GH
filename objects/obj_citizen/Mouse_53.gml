if !global.locked then
{
if checkHover() and !selected then
	{
	selected = true;
	}
else if selected then
	{
	selected = false;
	manual_input = true;
	goto_x = mouse_x;
	goto_y = mouse_y;
	}
}