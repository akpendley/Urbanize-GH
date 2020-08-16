facing = 0;
locked = true;
ysign = 1;

speed_mod = 1;
walkspeed = 4;
xprop = 0;
yprop = 0;
xtemp = 0;
ytemp = 0;

camera_controller = obj_camera_controller;

reach = 15;
stats = ds_map_create();
skills = ds_map_create();

stats[? "strength"] = 4;

skills[? "logging"] = 3;
tool = "axe";

//setup_3d_plane();