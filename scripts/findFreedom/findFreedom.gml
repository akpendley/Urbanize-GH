var trapped = true;
var count = 0;
while trapped
	{
	if !place_free(x,y+count) then
		{
		count += 1;
		}
	else
		{
		y += count + 5;
		trapped = false;
		break;
		}
	}