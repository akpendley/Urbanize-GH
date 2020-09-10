function updateLast10(argument0) {
	var newest = argument0;

	ds_list_add(global.last_10, newest);
	if ds_list_size(global.last_10) > 10 then
		{
		ds_list_delete(global.last_10, 0);
		}
	global.average_appeal = averageList(global.last_10);


}
