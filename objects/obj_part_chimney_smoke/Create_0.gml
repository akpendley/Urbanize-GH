depth = -y;
//Particle System
part_chimney_smoke_sys = part_system_create();
part_system_depth(part_chimney_smoke_sys, depth);

//Particle
part_chimney_smoke = part_type_create();
part_type_shape(part_chimney_smoke, pt_shape_smoke);
part_type_scale(part_chimney_smoke, 1, 1);
part_type_size(part_chimney_smoke, 0.05, 0.1, 0.0025, 0);
part_type_color2(part_chimney_smoke, make_color_rgb(20,20,20), make_color_rgb(60,60,60));
part_type_alpha2(part_chimney_smoke, 0.5, 0.2);
part_type_speed(part_chimney_smoke, 0.002, 0.01, 0, 0);
part_type_direction(part_chimney_smoke, 45, 135, 0, 0);
part_type_gravity(part_chimney_smoke, 0.01, 90);


//Particle Emitter
part_chimney_smoke_emit = part_emitter_create(part_chimney_smoke_sys);
part_emitter_region(part_chimney_smoke_sys, part_chimney_smoke_emit, x-3, x+3, y, y, ps_shape_rectangle, ps_distr_gaussian);
part_emitter_stream(part_chimney_smoke_sys, part_chimney_smoke_emit, part_chimney_smoke, 1);