/// findNearestStockpileWithItem(item, value, dropoff);
function findNearestStockpileWithItem(argument0, argument1, argument2) {
	var item = argument0;
	var value = argument1;
	var dropoff = argument2;
	var stockpile = 0;

	if instance_number(obj_stockpile) > 0 then
		{
		//get all of the stockpiles
		for (var i = 0; i < instance_number(obj_stockpile); i += 1)
			{
			stockpiles[i] = instance_find(obj_stockpile,i);
			}
		//sort by distance from citizen
		if array_length_1d(stockpiles) > 1 then
			{
			for (var i = 0; i < array_length_1d(stockpiles) - 1; i++)
				{
				for (var j = 0; j < array_length_1d(stockpiles) - 1; j++)
					{
					if distance_to_object(stockpiles[j]) > distance_to_object(stockpiles[j+1]) then
						{
						var temp = stockpiles[j];
						stockpiles[j] = stockpiles[j+1];
						stockpiles[j+1] = temp;
						}
					}
				}
			}

		if dropoff then
			{
			//check each stockpile to see if it has a) a slot available to fill or b) a matching slot with capacity remaining
			var found = false;
			for (var i = 0; i < array_length_1d(stockpiles); i++)
				{
				//check if there is already a slot with the item
				for (var j = 0; j < array_length_1d(stockpiles[i].slots); j++)
					{
					if (stockpiles[i].slots[j] = item) then
						{
						if (stockpiles[i].values[j] + stockpiles[i].qd_values[j] <= 100 - value) then
							{
							stockpiles[i].qd_values[j] += value;
							stockpile = stockpiles[i];
							slot = j;
							return stockpile;
							}
						}
					}
				//if not then check again to see if there are any empty slots
				//splitting the check into 2 "for" loops prevents prematurely selecting an empty slot when a later slot has the sought item
				for (var j = 0; j < array_length_1d(stockpiles[i].slots); j++)
					{
					if (stockpiles[i].slots[j] = "none") then
						{
						stockpiles[i].slots[j] = item;
						stockpiles[i].qd_values[j] += value;
						stockpile = stockpiles[i];
						slot = j;
						return stockpile;
						}				
					}
				}
			return -1;
			}
		else
			{
			//check each stockpile to see if it has the item
			var found = false;
			for (var i = 0; i < array_length_1d(stockpiles); i++)
				{
				for (var j = 0; j < array_length_1d(stockpiles[i].slots); j++)
					{
					if (stockpiles[i].slots[j] = item) then
						{
						if (stockpiles[i].values[j] - stockpiles[i].qd_withdraw[j] >= value) then
							{
							stockpiles[i].qd_withdraw[j] += value;
							stockpile = stockpiles[i];
							slot = j;
							return stockpile;
							}
						}
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
