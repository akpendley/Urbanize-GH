var ww = argument0;
var xx = argument1;
var yy = argument2;

for (var i = 0; i < ww; i++)
	{
	if !collision_point(xx + 16 * i, yy + 32, obj_road, false, true) or collision_point(xx + 16 * i, yy + 16, obj_road, false, true) then
		{
		return false;
		}
	}

return true;