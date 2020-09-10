/// findNearestSilo(value, dropoff);
function findNearestSilo(argument0, argument1) {

	var value = argument0;
	var dropoff = argument1;
	var silo = 0;

	//get all of the silos
	for (var i = 0; i < instance_number(obj_grain_silo); i += 1)
		{
		silos[i] = instance_find(obj_grain_silo,i);
		}
	//sort by distance from citizen
	if instance_number(obj_grain_silo) > 0 then
		{
		if array_length_1d(silos) > 1 then
			{
			for (var i = 0; i < array_length_1d(silos) - 1; i++)
				{
				for (var j = 0; j < array_length_1d(silos) - 1; j++)
					{
					if distance_to_object(silos[j]) > distance_to_object(silos[j+1]) then
						{
						var temp = silos[j];
						silos[j] = silos[j+1];
						silos[j+1] = temp;
						}
					}
				}
			}

		if dropoff then
			{
			//check each silo to see if it has capacity remaining
			var found = false;
			for (var i = 0; i < array_length_1d(silos); i++)
				{
				if (silos[i].value + silos[i].qd_value <= silos[i].max_value - value) then
					{
					silos[i].qd_value += value;
					silo = silos[i];
					return silo;
					}
				}
			return -1;
			}
		else
			{
			//check each silo to see if it has food
			var found = false;
			for (var i = 0; i < array_length_1d(silos); i++)
				{
				if (silos[i].value - silos[i].qd_withdraw >= value) then
					{
					silos[i].qd_withdraw += value;
					silo = silos[i];
					return silo;
					}
				}
			return -1;	
			}
		}
	else
		{
		return -1;
		}


}
