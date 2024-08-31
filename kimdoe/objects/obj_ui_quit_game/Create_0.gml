/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

my_state = ST.MAIN;

navigation =
{
	left: noone,
	right: noone,
	up: obj_ui_start_game,
	down: noone
}

function ok()
{
	game_end();
}