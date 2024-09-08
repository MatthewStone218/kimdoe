/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(global.state == ST.DYING or global.state == ST.MOVING)
{
	if(!instance_exists(obj_hair))
	{
		image_speed = 1;
	}
}
else
{
	image_speed = 0;
}

if(image_index >= 24)
{
	room_goto_f(room, ST.GAME);
}