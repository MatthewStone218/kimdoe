/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(image_index >= 2 and !attacked)
{
	attacked = true;
	if(place_meeting(x,y,obj_boss))
	{
		instance_place(x,y,obj_boss).get_hit();
	}
}