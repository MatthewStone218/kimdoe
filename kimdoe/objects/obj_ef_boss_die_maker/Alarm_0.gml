/// @description Insert description here
// You can write your code in this editor

alarm[0] = 5;
audio_stop_sound(snd_destroy_stone);
audio_play_sound(snd_destroy_stone,1,0);
instance_create_depth(x,y,-3000,obj_ef_kick);