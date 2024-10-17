/// @description Insert description here
// You can write your code in this editor

speed = 15;

function die()
{
	audio_stop_sound(snd_destroy_stone);
	audio_play_sound(snd_destroy_stone,1,0);
	repeat(6){instance_create_depth(x,y,depth,obj_ef_block_part)};
	instance_destroy();
}