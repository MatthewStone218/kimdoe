/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(os_browser != browser_not_a_browser)
{
	alarm[0] = 1;
	fps_count++;
	
	fps_accumulated += fps;
	density_prev = density;

	if(fps_count == 10)
	{
		if(fps_accumulated/fps_count < 55)
		{
			density = max(density-0.1,1);
		}
		fps_accumulated = 0;
		fps_count = 0;
	}
}