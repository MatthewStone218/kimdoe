/// @description Insert description here
// You can write your code in this editor

instance_destroy(obj_boss_attack_helicopter_hair);

depth = -10000;

phase = 0;

image_alpha = 0.7;

image_xscale = 960;
image_yscale = 540;
obj_camera.bib = 200;

obj_boss.image_blend = c_white;
obj_boss.image_speed = 0;
obj_boss.sprite_index = spr_boss_die;

alarm[0] = 120;

alarm[10] = 10;