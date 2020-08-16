if up and step < 60 then
	{
	step += 1;
	y -= 8;
	}
if down and step > 0 then
	{
	step -= 1;
	y += 8;
	}
if up and step = 60 then
	{
	up = false;
	instance_create_layer(x, y + 100, "Instances", obj_continue);
	}
if down and step = 0 then
	{
	down = false;
	instance_activate_all();
	obj_timer.fade_to_color = true;
	instance_destroy();
	}