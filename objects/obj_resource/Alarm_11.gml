var interaction = action_received + " " + name;

if global.required_levels[? interaction] != undefined // make sure the interaction is defined, otherwise no interaction takes place
	{
	switch(action_received)
		{
		case "chop":
			hits--;
			if (hits > 0)
				{
				give_interaction_xp(receiver, interaction, 0);
				}
			else
				{
				var product = global.products[? interaction];
				make_products(interaction);
				give_interaction_xp(receiver, interaction, 1);
				instance_destroy();
				}	
			break;
		}
	}