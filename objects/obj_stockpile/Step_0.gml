if point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height) then
	{
	hover = true;
	}
else
	{
	hover = false;
	}
	
for (var i = 0; i < array_length_1d(values); i++)
	{
	if values[i] = 0 and qd_values[i] = 0 then //if the slot is currently empty with no incoming items
		{
		slots[i] = "none";  //open the slot for a different item
		}
	}