/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(time < 1)
{
	time += 0.1;
	if(time >= 1)
	{
		time = 1;
	}
}

image_index = ease_get_val(ease_out_cubic(time),image_index_prev,image_index_goal);