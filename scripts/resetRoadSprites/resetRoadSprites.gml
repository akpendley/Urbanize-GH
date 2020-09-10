function resetRoadSprites() {
	var top = false;
	var left = false;
	var right = false;
	var down = false;

	//top
	if collision_point(x, y - 32, obj_road, false, true) != noone then
		{
		top = true;
		}
	
	//left
	if collision_point(x - 32, y, obj_road, false, true) != noone then
		{
		left = true;
		}
	
	//right
	if collision_point(x + 32, y, obj_road, false, true) != noone then
		{
		right = true;
		}
	
	//down
	if collision_point(x, y + 32, obj_road, false, true) != noone then
		{
		down = true;
		}

	if !top and !left and !right and !down then
		return spr_road_solo;
	
	if top and !left and !right and !down then
		return spr_road_down;

	if top and left and !right and !down then
		return spr_road_bottom_right;

	if top and left and right and !down then
		return spr_road_t_down;

	if top and left and right and down then
		return spr_road_center;
	
	if top and left and !right and down then
		return spr_road_t_right;
	
	if top and !left and !right and down then
		return spr_road_vertical;
	
	if !top and left and right and down then
		return spr_road_t_top;
	
	if top and !left and right and down then
		return spr_road_t_left;
	
	if !top and left and right and !down then
		return spr_road_horizontal;
	
	if !top and left and !right and !down then
		return spr_road_right;
	
	if !top and !left and right and !down then
		return spr_road_left;
	
	if !top and !left and !right and down then
		return spr_road_up;
	
	if top and !left and right and !down then
		return spr_road_bottom_left;
	
	if !top and left and !right and down then
		return spr_road_top_right;
	
	if !top and !left and right and down then
		return spr_road_top_left;


}
