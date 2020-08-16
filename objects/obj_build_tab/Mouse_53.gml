if !global.locked then
{
if hover and !activated then
	{
	audio_play_sound(snd_click, 2, false);
	with (obj_build_site) //if you are currently attempting to place an obj, then destroy it and open the tray
		{
		if follow_mouse then
			instance_destroy();
		}
	with (obj_build_tab)
		{
		if id != other.id then
			{
			visible = false;
			}
		}
	tray = instance_create_layer(0, 0, global.gui_layer, obj_build_tray);
	tray.my_tab = id;
	tray.list = list;
	activated = true;
	move_left = true;
	move_right = false;
	}
else if hover and activated then
	{
	audio_play_sound(snd_click, 2, false);
	tray.move_right = true;
	tray.move_left = false;
	tray.death = true;
	move_left = false;
	move_right = true;
	activated = false;
	}
}