/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < obj_boss.helicopter_dis; i += 64)
{
	repeat(100)
	{
		instance_create_depth(obj_boss.x+lengthdir_x(i,obj_boss.helicopter_dir+dir)+random_range(-20,20),obj_boss.y+lengthdir_y(i,obj_boss.helicopter_dir+dir)+random_range(-20,20),depth,obj_ef_hair_die);
	}
}