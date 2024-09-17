/// @description Insert description here
// You can write your code in this editor
//debug
if(keyboard_check(vk_delete) and keyboard_check(vk_control) and keyboard_check(vk_home))
{
	room_goto_f(rm_stage_boss_phase_1, ST.GAME);
}