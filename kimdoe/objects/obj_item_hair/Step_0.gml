/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

if(time < 1)
{
	time += 0.1;
	if(time > 1){time = 1;}
	set_scale(time);
}