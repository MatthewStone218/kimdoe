/// @description Insert description here
// You can write your code in this editor

image_alpha -= 0.01;

if(phase == 1)
{
	instance_create_depth(obj_boss.x+random_range(-100,100),obj_boss.y+random_range(-100,100),-3000,obj_ef_kick);
}