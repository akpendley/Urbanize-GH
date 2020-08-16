depth = -1;

/////////////////// TUTORIAL MODE /////////////////////////
if instance_exists(obj_gasparaldo)
	{
	if obj_gasparaldo.part = 7 and !obj_gasparaldo.show_text
		{
		obj_gasparaldo.show_text = true;
		instance_create_layer(0,0,"Instances",obj_next_text);
		}
	}
////////////////// TUTORIAL MODE //////////////////////////

if instance_exists(obj_generator)
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}	
	
hover = false;
my_buttons[0] = instance_create_layer(x,y,"Instances",obj_landlord);
my_buttons[0].visible = false;
global.overall_appeal += 10;