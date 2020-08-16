if auto_set then
	{
	if instance_exists(my_tray) then
		{
		gui_x = my_tray.gui_x + x_sep;
		gui_y = my_tray.gui_y + y_sep + y_slot * tray_slot;
		inactive = my_tray.icons_inactive;
		}
	else
		{
		instance_destroy();
		}
		
	GUIHover();	
	}