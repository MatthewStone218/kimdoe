/// @description Insert description here
// You can write your code in this editor

if(!pressed_ok)
{
	if(input_check("ok"))
	{
		pressed_ok = true;
		instance_create_depth(150,400,-100,obj_joke_talmo);
		alarm[0] = 120;
	}
}