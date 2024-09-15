/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
with(obj_player)
{
	action = "move";
	action_time = 0;
	x_prev = x;
	y_prev = y;
	s_x = x;
	s_y = y;
	x_goal = x - global.cell_width;
	y_goal = y;
	x = x_goal;
	y = y_goal;
}