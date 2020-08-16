//set up secondary variables
sprite_index = sprite;
y_off = bbox_top - y;
xsize = (bbox_right - bbox_left + 1) div 16;
ysize = (bbox_bottom - bbox_top + 1) div 16;
var count = 0;
for (var j = 0; j < ysize; j++)
	{
	for (var i = 0; i < xsize; i++)
		{
		delay[count] = 2 * count;
		y_val[count] = 16;
		count += 1;
		}
	}
text_wood = wood_to_complete;
text_lumber = lumber_to_complete;
text_stone = stone_to_complete;
text_iron = iron_to_complete;
text_steel = steel_to_complete;
text_cement = cement_to_complete;
text_gold = gold_to_complete; 
autoset = true;

if complete_obj = obj_road and !already_placed then
	{
	window_set_cursor(cr_none);
	cursor_sprite = spr_road_horizontal_cursor;
	}