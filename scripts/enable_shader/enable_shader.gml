if event_number!=0 exit;
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
shader_set(shd_zsort);
shader_enable_corner_id(true);