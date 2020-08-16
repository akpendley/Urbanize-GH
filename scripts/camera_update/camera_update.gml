if !instance_exists(obj_timer) and !global.locked then
	{
	x += (obj_camera.xTo - x)/10;
	y += (obj_camera.yTo - y)/10;
	}
else
	{
	x += (obj_camera.xTo - x)/10;
	y += (obj_camera.yTo - y)/10;	
	}

obj_camera.xTo = obj_camera.follow.x;
obj_camera.yTo = obj_camera.follow.y;
	
var vm = matrix_build_lookat(x, y, -10000, x, y, 0, 0, 1, 0);

camera_set_view_mat(view_camera[0], vm);