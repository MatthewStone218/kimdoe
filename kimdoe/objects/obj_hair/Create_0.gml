/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

child = noone;
parent = noone;

function follow()
{
	x = parent.x;
	y = parent.y;
	if(parent.object_index == obj_hair)
	{
		with(parent){follow();}
	}
}