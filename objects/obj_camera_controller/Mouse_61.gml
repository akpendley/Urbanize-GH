if (cam.zoom_level < 30) {
	cam.zoom_level++;
}

cam.zoom_level = clamp(cam.zoom_level, 1, 30);

var vm = matrix_build_lookat(x, y, -10000, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(cam.x_res * cam.zoom_level, cam.y_res * cam.zoom_level, 1, 32000);
camera_set_view_mat(cam.camera, vm);
camera_set_proj_mat(cam.camera, pm);