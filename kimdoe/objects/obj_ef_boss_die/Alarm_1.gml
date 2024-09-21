/// @description Insert description here
// You can write your code in this editor

alarm[2] = 40;
phase = 2;

for(var _dir = 0; _dir < 360; _dir += 20)
{
	instance_create_depth(obj_boss.x,obj_boss.y,-3000,obj_ef_boss_die_maker,{direction: _dir, speed: 10});
}