/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

xscale_prev = 0.8;
yscale_prev = 0.8;
alpha_prev = 0.8;

xscale_goal = 0.8;
yscale_goal = 0.8;
alpha_goal = 0.8;

ef_time = 1;

image_xscale = 0.8;
image_yscale = 0.8;
image_alpha = 0.8;

function focus()
{
	ef_time = 0;

	xscale_prev = image_xscale;
	yscale_prev = image_yscale;
	alpha_prev = image_alpha;

	xscale_goal = 1;
	yscale_goal = 1;
	alpha_goal = 1;
}

function lose_focus()
{
	ef_time = 0;

	xscale_prev = image_xscale;
	yscale_prev = image_yscale;
	alpha_prev = image_alpha;

	xscale_goal = 0.8;
	yscale_goal = 0.8;
	alpha_goal = 0.8;
}