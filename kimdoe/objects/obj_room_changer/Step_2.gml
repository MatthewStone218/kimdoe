/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(step == 1)
{
	if(image_index >= 25)
	{
		room_goto(next_room);
		step = 2;
	}
}
x = CM_X;
y = CM_Y;
image_xscale = CM_W/sprite_get_width(sprite_index);
image_yscale = CM_H/sprite_get_height(sprite_index);