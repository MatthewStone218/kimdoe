/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(move_time < 1)
{
	move_time += 0.05;
	
	if(move_time > 1)
	{
		move_time = 1;
	}
}

hair_x = ease_get_val(ease_out_cubic(move_time),x_prev,x_goal);
hair_y = ease_get_val(ease_out_cubic(move_time),y_prev,y_goal);

if(global.state == ST.DYING)
{
	depth = -10010;
}
else
{
	depth = -y+1;
}