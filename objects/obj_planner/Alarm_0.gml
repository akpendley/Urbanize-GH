/// @description initialize

if global.obj_player_one = id then
	{
	key = "player one";
	}
else
	{
	key = "player two";
	}
	

keyx = key + "x";
keyy = key + "y";
key_contents = key + "contents";


/* set up saving and loading
x = load_data(keyx, 0);
y = load_data(keyy, 0);
holding = load_data(key_contents, "");
holding_sprite = lookup_sprite(holding);