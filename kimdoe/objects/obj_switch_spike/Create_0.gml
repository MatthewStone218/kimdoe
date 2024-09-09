/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

sprite_index = spr_switch_spike;

time = 0;

function switch_floor()
{
	time = 0;
	
	if(pushed)
	{
		mask_index = spr_switch_spike_empty_mask;
		image_index_prev = image_index;
		image_index_goal = 0;
	}
	else
	{
		mask_index = spr_switch_spike_full_mask;
		image_index_prev = image_index;
		image_index_goal = sprite_get_number(sprite_index)-1;
	}
	
	pushed = !pushed;
}