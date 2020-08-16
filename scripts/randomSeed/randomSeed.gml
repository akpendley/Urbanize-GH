var range = argument[0];
var num = argument[1] + argument[2] * 65536;

var seed = obj_generator.seed + num;

random_set_seed(seed);
rand = irandom_range(0, range);

return rand;