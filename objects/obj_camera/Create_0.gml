x_res = 96;
y_res = 54;
x_cres = x_res;
x_yres = y_res;

zoom_level = 10

// camera
///// ENABLE FOR 3D
//gpu_set_ztestenable(true);
//gpu_set_zwriteenable(true);

camera = camera_create();
view_enabled = true;
view_set_visible(0, true);

vm = matrix_build_lookat(x, y, -10000, x, y, 0, 0, 1, 0);
pm = matrix_build_projection_ortho(x_res * zoom_level, y_res * zoom_level, 1, 32000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_set_camera(0, camera);

camera_set_update_script(camera, camera_update);
follow = obj_camera_controller;
xTo = x;
yTo = y;

//layer_script_end("Background", enable_shader);
//layer_script_end("Instances", disable_shader);