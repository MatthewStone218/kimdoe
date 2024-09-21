/// @description Insert description here
// You can write your code in this editor

speed = 15;

function die()
{
	repeat(6){instance_create_depth(x,y,depth,obj_ef_block_part)};
	instance_destroy();
}