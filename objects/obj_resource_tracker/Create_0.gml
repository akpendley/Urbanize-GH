gui_x = 30;
gui_y = 7;
gui_font_y = 22;
font = font_resource_tracker;
font_color = c_white;
global.total_lumber = 0;
global.total_logs = 0;
global.total_stone = 0;
global.total_bricks = 0;
global.total_iron = 0;
global.total_coal = 0;
global.total_steel = 0;
global.total_cement = 0;
global.total_food = 0;
global.total_gold = 0;
global.food_consumed = 0;
draw_stone_filter = false;
draw_fertility_filter = false;
stone_color = make_color_rgb(255,255,255);
brown = make_color_rgb(50,30,15);
global.time_seconds = 30;
global.time = 7;
alarm[0] = global.time_seconds * room_speed;
depth = -6000;
spring[0] = make_color_rgb(0,255,125);
spring[1] = make_color_rgb(255,255,255);
spring[2] = make_color_rgb(80,20,200);
global.overall_appeal = 0;
global.last_10 = ds_list_create();
global.average_appeal = averageList(global.last_10);
global.parcels_for_sale = ds_list_create();
global.city_level = 1;
global.last_appeal = 0;