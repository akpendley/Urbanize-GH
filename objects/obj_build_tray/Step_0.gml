if move_left
	{
	if !icons_inactive
		{
		icons_inactive = true;
		}
	if (gui_x != open_gui_x)
		{
		gui_x -= gui_speed;
		}
	else
		{
		move_left = false;
		
		/////////////////// TUTORIAL MODE ///////////////////////
		if instance_exists(obj_gasparaldo)
			{
			if obj_gasparaldo.part = 1 && obj_gasparaldo.line = 0 && obj_gasparaldo.show_text = false
				{
				obj_gasparaldo.show_text = true;
				instance_create_layer(0,0,"Instances",obj_next_text);
				}
			}
		/////////////////// TUTORIAL MODE ///////////////////////
		}
	}

if move_right
	{
	if !icons_inactive
		{
		icons_inactive = true;
		}
	if (gui_x != close_gui_x)
		{
		gui_x += gui_speed;
		}
	else
		{
		move_right = false;
		}
	}

if death && gui_x = close_gui_x
	{
	instance_destroy();
	}

if icons_inactive && !death && !move_left && !move_right && !global.locked
	{
	icons_inactive = false;
	}
	
if global.locked
	{
	icons_inactive = true;
	}