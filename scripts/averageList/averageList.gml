function averageList(argument0) {
	var array = argument0;
	var length = ds_list_size(array);
	var total = 0;

	for (var i = 0; i < length - 1; i++)
		{
		total += ds_list_find_value(array, i);
		}

	total = round(total/length);

	return total;


}
