/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

my_state = ST.STAGE_SELECTION;

navigation =
{
	left: noone,
	right: noone,
	up: noone,
	down: noone
}

function ok()
{
	room_goto_f(my_room, my_stage_state);
}