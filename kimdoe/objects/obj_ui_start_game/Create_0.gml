/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

my_state = ST.MAIN;

navigation =
{
	left: noone,
	right: noone,
	up: noone,
	down: obj_ui_quit_game
}

function ok()
{
	room_goto_f(rm_stage_selection,ST.STAGE_SELECTION);
}

focused = true;
focus();