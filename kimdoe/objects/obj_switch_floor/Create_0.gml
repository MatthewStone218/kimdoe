/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
time = 0;

function switch_floor()
{
	if(pushed)
	{
		mask_index = spr_switch_floor_empty_mask;
		prev_y = y;
		goal_y = ystart;
	}
	else
	{
		mask_index = spr_switch_floor_full_mask;
		prev_y = y;
		goal_y = ystart+32;
	}
	
	pushed = !pushed;
}