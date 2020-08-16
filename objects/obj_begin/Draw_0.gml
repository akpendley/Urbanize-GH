gpu_set_zwriteenable(false);
draw_sprite(sprite_index, 0, x, y);
draw_sprite(spr_urbanize, 0, x, y - 200);
gpu_set_zwriteenable(true);