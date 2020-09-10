function sfx(argument0, argument1, argument2) {
	sound = argument0;
	priority = argument1;
	loop = argument2;
	if !global.mute then
		{
		audio_play_sound(sound, priority, loop);
		}


}
