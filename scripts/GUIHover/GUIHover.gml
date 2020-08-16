if visible and (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), gui_x, gui_y, gui_x + gui_width, gui_y + gui_height)) then
	{
	hover = true;
	return true;
	}
else
	{
	hover = false;
	return false;
	}
	