///checkPlacement(tilemap, xcells, ycells);
function checkPlacement(argument0, argument1, argument2) {
	tilemap = argument0;
	xsize = argument1;
	ysize = argument2;

	var placement_is_valid = true;

	if !place_free(x,y) or collision_rectangle(x, y + y_off, x + xsize * 16, y + y_off + ysize * 16, obj_tree, false, true) or collision_rectangle(x, y + y_off, x + xsize * 16, y + y_off + ysize * 16, obj_big_rock, false, true) or collision_rectangle(x, y + y_off, x + xsize * 16, y + y_off + ysize * 16, obj_small_tree, false, true) or collision_rectangle(x, y + y_off, x + xsize * 16, y + y_off + ysize * 16, obj_small_rock, false, true) then
		{ 
		placement_is_valid = false;
		show_debug_message("collision");
		}

	for(var j = 0; j < ysize; j++)
		{
		for(var i = 0; i < xsize; i++)
			{
			var tl = tile_get_index(tilemap_get_at_pixel(tilemap, x + i * 16, y + y_off + j * 16));
			if (tl >= 4) then
				{
				placement_is_valid = false;
				}
			}
		}
	
	return placement_is_valid


}
