var target = argument0;
var interaction = argument1;
var full_xp = argument2;

if instance_exists(target)
	{
	// interaction to stats/skills
	var _stats = global.stats_used[? interaction];
	if _stats != undefined
		{
		for (var j = 0; j < array_length_1d(_stats); j++)
			{
			var s = _stats[j];
			var xp = global.xp[? interaction];
			target.stats[? s] += xp[full_xp];
			}
		}
	var _skills = global.skills_used[? interaction];
	if _skills != undefined
		{
		for (var k = 0; k < array_length_1d(_skills); k++)
			{
			var s = _skills[k];
			var xp = global.xp[? interaction];
			target.skills[? s] +=  xp[full_xp];
			}
		}
	}