//set inventory, find a transport target, and set task to delivery
transport_item = target_id.mining_item;
transport_value = 1;
target_id.production_remaining -= 1;
target_id.qd_production -= 1;
transport_to_site_id = findNearestStockpileWithItem(transport_item, transport_value, true);
if transport_to_site_id = -1 then //couldn't find an empty stockpile
	{
	var reject = global.item_to_object[? transport_item];
	var reject_id = instance_create_layer(x, y, "Instances", reject);
	reject_id.rejected = true;
	if !end_task then
		{
		//remove myself from the my_builders
		ds_priority_delete_value(target_id.my_builders, id);
		target_id.builders_requested -= 1;	
		}
	repetitions_remaining = 0;
	clearTask();
	}
else
	{
	task = "mining delivery";
	pause = false;
	}