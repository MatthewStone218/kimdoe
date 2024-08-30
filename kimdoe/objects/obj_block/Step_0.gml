/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(action_time < 1)
{
	action_time += 0.15;
	
	if(action_time >= 1)
	{
		action_time = 1;
		
		if(action == "kicked")
		{
			set_position();
		}
		
		action = "none";
	}
}

if(action == "kicked")
{
	set_position();
}

bib = max(0,bib-4);