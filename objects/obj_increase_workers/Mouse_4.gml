if my_dropper.builders_requested < instance_number(obj_citizen) then
	{
	audio_play_sound(snd_click, 2, false);
	ds_priority_add(global.worklist, my_dropper, priority);
	my_dropper.builders_requested += 1;
	}