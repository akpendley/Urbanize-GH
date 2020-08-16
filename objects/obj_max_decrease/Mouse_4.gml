switch(stat)
	{
	case "lumber":
		{
		if global.max_lumber > 9 then
			{
			global.max_lumber-=10; 
			audio_play_sound(snd_click, 2, false);
			break;
			}
		else
			{
			global.max_lumber = 0; 
			break;
			}
		}
	}