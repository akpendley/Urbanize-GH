audio_play_sound(snd_click, 2, false);
var bl = ds_priority_delete_max(my_dropper.my_builders);
with (bl)
	{
	if value_needed = 0 then
		{
		clearTask();
		}
	else
		{
		end_task = true;
		}
	}
my_dropper.builders_requested -= 1;
instance_destroy();