/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

with(obj_ui_dialogue_character)
{
	if(id != other.id)
	{
		kill();
	}
}

die = false;

time = 0;

x = 850;
image_alpha = 0;

x_prev = x;
alpha_prev = image_alpha;
	
x_goal = 960;
alpha_goal = 1;

function kill()
{
	time = 0;
	x_prev = x;
	alpha_prev = image_alpha;
	
	x_goal = 850;
	alpha_goal = 0;
}