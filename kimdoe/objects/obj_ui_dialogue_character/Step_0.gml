/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(time < 1)
{
	time += 0.15;
	
	if(time >= 1)
	{
		time = 1;
		if(die)
		{
			instance_destroy();
		}
	}
}

x = ease_get_val(ease_out_cubic(time),x_prev,x_goal);
image_alpha = ease_get_val(ease_out_cubic(time),alpha_prev,alpha_goal);