auto_set = true;
complete_obj = global.build_objects[? basic_id];
sprite = global.build_object_sprites[? basic_id];
work_to_complete = global.work[? basic_id];
wood_to_complete = global.wood[? basic_id];
lumber_to_complete = global.lumber[? basic_id];
stone_to_complete = global.stone[? basic_id];
iron_to_complete = global.iron[? basic_id];
steel_to_complete = global.steel[? basic_id];
cement_to_complete = global.cement[? basic_id];
gold_to_complete = global.gold[? basic_id];	
icon_sprite = global.build_icon_sprites[? basic_id];
text = global.build_icon_text[? basic_id];
if tray_slot < 5 and tray_slot != 0 then //use centered text box
	{
	centering = 0;
	}
else if tray_slot = 0 then
	{
	centering = -1;
	}
else if tray_slot >= 5 then
	{
	centering = 1;
	}