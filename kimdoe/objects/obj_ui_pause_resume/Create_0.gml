/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

my_state = ST.PAUSE;

text = "계속";

navigation =
{
	left: noone,
	right: noone,
	up: noone,
	down: obj_ui_pause_goto_main
}

function ok()
{
	global.state = obj_pause_system.prev_state;
}

focused = true;
focus();