/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
global.player_action_speed = 0.05;
global.player_can_attack = false;

function interact()
{
	global.state = ST.SCENE_BOSS_1;
	alarm[0] = 10;
}