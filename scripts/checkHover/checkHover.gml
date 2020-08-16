if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) then
	{
	hover = true;
	}
else
	{
	hover = false;
	}
	
return hover;