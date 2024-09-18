/// @description Insert description here
// You can write your code in this editor
//debug
if(keyboard_check(vk_delete) and keyboard_check(vk_control) and keyboard_check(vk_home))
{
	//show_message($"치트 작동: 스테이지 올 클리어");
	//unlock_stage(18);
	room_goto_f(rm_ending, ST.GAME);
}