/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

time = 0;

image_alpha = 0;
alpha_prev = image_alpha;
alpha_goal = 1;

dying = false;

function die()
{
	alpha_prev = image_alpha;
	alpha_goal = 0;
	dying = true;
}