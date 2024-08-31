/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(ef_time < 1)
{
	ef_time += 0.15;
	
	if(ef_time >= 1)
	{
		ef_time = 1;
	}
	
	image_xscale = ease_get_val(ease_out_cubic(ef_time),xscale_prev,xscale_goal);
	image_yscale = ease_get_val(ease_out_cubic(ef_time),yscale_prev,yscale_goal);
	image_alpha = ease_get_val(ease_out_cubic(ef_time),alpha_prev,alpha_goal);
}