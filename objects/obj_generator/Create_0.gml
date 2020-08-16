autoset = false;
step = 0;
progress = "Generating Land";
global.locked = false;
global.mute = false;
global.player_one = noone;
alarm[0] = 3;

global.interactions = ds_map_create();
global.required_levels = ds_map_create();
global.stats_used = ds_map_create();
global.skills_used = ds_map_create();
global.products = ds_map_create();
global.xp = ds_map_create();
global.sprites = ds_map_create();

global.interactions[? "axe tree"] = "chop";
global.interactions[? "axe fallen tree"] = "chop";

global.required_levels[? "chop tree"] = 3;
global.required_levels[? "chop fallen tree"] = 3;

global.stats_used[? "chop tree"] = ["logging"];
global.stats_used[? "chop fallen tree"] = ["logging"];

global.skills_used[? "chop tree"] = ["strength"];
global.skills_used[? "chop fallen tree"] = ["strength"];

global.xp[? "chop tree"] = [1, 15];
global.xp[? "chop fallen tree"] = [1, 8];

global.products[? "chop tree"] = ["fallen tree"];
global.products[? "chop fallen tree"] = ["log"];

global.sprites[? "tree"] = spr_tree;
global.sprites[? "log"] = spr_log;