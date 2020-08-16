GUIHover();
if move_left then
	{
	if gui_x != open_gui_x then
		{
		gui_x -= gui_speed;
		}
	else
		{
		move_left = false;
		}
	}
	
if move_right then
	{
	if gui_x != close_gui_x then
		{
		gui_x += gui_speed;
		}
	else
		{
		move_right = false;
		with (obj_build_tab)
			{
			visible = true;
			}
		}
	}