function make_products(argument0) {
	var _interaction = argument0;
	var _products = global.products[? _interaction];

	if _products != undefined
		{
		for (var i = 0; i < array_length_1d(_products); i++) // cycle through product list and spawn objects
			{
			var _inst = instance_create_depth(x, y, depth, obj_resource);
			_inst.name = _products[i];
			}
		}


}
