/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(place_meeting(x,y,obj_player) or place_meeting(x,y,obj_block) or place_meeting(x,y,obj_hair))
{
	image_alpha += (0.4-image_alpha)/4;
}
else
{
	image_alpha += (1-image_alpha)/4;
}