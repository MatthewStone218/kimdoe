/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

text = "메인으로";

my_state = ST.PAUSE;

navigation =
{
	left: noone,
	right: noone,
	up: obj_ui_pause_resume,
	down: noone
}

function ok()
{
	room_goto_f(rm_main,ST.MAIN);
}