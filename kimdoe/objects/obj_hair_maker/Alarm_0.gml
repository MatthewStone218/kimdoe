/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

alarm[0] = random_range(300,1200);

if(!position_meeting(x,y,obj_hair) && !position_meeting(x,y,obj_player))
{
	instance_create_depth(x,y,-y+100,obj_item_hair);
}