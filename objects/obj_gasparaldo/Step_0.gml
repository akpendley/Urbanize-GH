switch(part)
	{
	case 0:
		{
		lines = 8;
		switch(line)
			{
				case 0:str="Good day, Gregory! I am Gasparaldo, senior city planner.";break;
				case 1:str="You can call me Sir Gasparaldo.";break;
				case 2:str="Sir Alwin has been hounding me to get you an assignment.";break;
				case 3:str="It took quite some pulling of strings, but I was able to get this new project assigned to you!";break;
				case 4:str="The Planning Council wants to found a new settlement, and you'll be in charge of seeing to the settling of the first thousand or so residents.";break;
				case 5:str="However, you'll need to build an appealing city to attract those residents, as we can't rightly force people to move to your new town.";break;
				case 6:str="Anymore...";break;
				case 7:str="Off you go then! Take a look through the building plans you brought with you and get at it! I'll pop in to offer advice along the way.";break;
			}
		break;
		}
	case 1:
		{
		lines = 7;
		switch(line)
			{
				case 0:str="What's that? You didn't bring any of your plans?!";break;
				case 1:str="What?";break;
				case 2:str="You're not Gregory, Sir Alwin's apprentice?!";break;
				case 3:str="...";break;
				case 4:str="I don't think the Planning Council needs to hear of this. You look like a quick learner, I suppose.";break;
				case 5:str="First thing's first: build a road connected to the main road there on the west side of the settlement area.";break;
				case 6:str="I have already sent a wagon your way with some supplies to get you started.";break;
			}	
		break;
		}	
	case 2:
		{
		lines = 2;
		switch(line)
			{
				case 0:str="Before you have your workers break down the supply wagon build a Stockpile somewhere close at hand.";break;	
				case 1:str="Check the plan I've sent you for more details.";break;
			}
		break;	
		}	
	case 3:
		{
		lines = 7;
		switch(line)
			{
				case 0:str="It appears your leadership skills are just fine;";break;
				case 1:str="The workers haven't even rebelled yet.";break;
				case 2:str="I tell you, never let them form a labor union or it will be the end of you.";break;
				case 3:str="Jolly good, you received some definitely unspoiled food from the wagon.";break;
				case 4:str="Food is the only resource that can't be stockpiled in a stockpile: it goes in a Silo.";break;
				case 5:str="I would send you the plan for the Silo now, but it appears you don't have enough lumber to build it.";break;
				case 6:str="No matter, you can cut your own lumber from logs you fell in the woods at a Lumber Mill.";break;
			}
		break;
		}
	case 4:
		{
		lines = 5;
		switch(line)
			{
				case 0:str="Joyous occurrences! You'll notice you now have a green-shirt carpenter working at the new Lumber Mill.";break;
				case 1:str="Some buildings have their own dedicated workers, others require the use of your red-shirt builders for operation.";break;
				case 2:str="Green-shirts will work autonomously, they don't need any input from you to do their job, unlike our current relationship.";break;
				case 3:str="Have a look at this Silo plan.";break;
				case 4:str="If you can finish building it then perhaps your people won't starve tonight.";break;
			}
		break;
		}
	case 5:
		{
		lines = 5;
		switch(line)
			{
				case 0:str="All of your workers will eat their daily rations straight from the silo like the dirty peasants they are.";break;
				case 1:str="If there isn't any food, sure, they'll whine and complain but it will become a problem if the shortage persists.";break;
				case 2:str="Workers walk and work slower the hungrier they are, and they'll die if they go too long without eating.";break;
				case 3:str="You can instruct your workers to store any un-stored resources by simply reselecting them and issuing the task again.";break;
				case 4:str="Give a man 30 food in a supply wagon, he'll eat for a day. Give a man the building plans for a farm, he'll probably build farms.";break;
			}
		break;
		}
	case 6:
		{
		lines = 6;
		switch(line)
			{
				case 0:str="I've got another proverb for you:";break;
				case 1:str="You can teach a man to fish, but you can't lead him to water.";break;
				case 2:str="...";break;
				case 3:str="Perhaps that will help you one day, like these building plans.";break;
				case 4:str="You can check the plans for specifics on each of them.";break;
				case 5:str="You first true task is to build the Town Hall, after which you will be able to open your rustic villa to new residents.";break;
			}
		break;
		}
	case 7:
		{
		lines = 6;
		switch(line)
			{
				case 0:str="Wow! You really did it! That's great.";break;
				case 1:str="I always believed in you, surely.";break;
				case 2:str="Now the true challenge begins: you must convince these surly peasants that your town is worth living in.";break;
				case 3:str="I've sent you some plans for Amenity buildings. These will increase potential residents' desire for your land.";break;
				case 4:str="Use the landlord in your Town Hall to designate land parcels for sale. Once you have land for sale residents will start to purchase and develope the parcels.";break;
				case 5:str="We will speak again once you have 30 residents in your town.";break;
			}
		break;
		}
	}
	
if show_text and !global.locked then
	{
	global.locked = true;
	global.locked_time = obj_resource_tracker.alarm[0];	
	}