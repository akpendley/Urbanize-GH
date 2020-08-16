window_set_cursor(cr_default);
cursor_sprite = -1;
if instance_exists(lp1) then
	{
	with lp1
		instance_destroy();
	with lp2
		instance_destroy();
	with rp1
		instance_destroy();
	with rp2
		instance_destroy();	
	}
