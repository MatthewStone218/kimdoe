/// @description Insert description here
// You can write your code in this editor
alarm[11] = 5;
audio_stop_sound(snd_died);
audio_play_sound(snd_died,1,0,0.5);
obj_boss.blink = !obj_boss.blink;