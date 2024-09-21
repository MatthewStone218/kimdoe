/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(action_time < 1)
{
	action_time += 0.05;
	
	if(action == "kicked")
	{
		image_index = action_time*sprite_get_number(sprite_index);
	}
	
	if(action_time >= 1)
	{
		action_time = 1;
		
		if(action == "kicked")
		{
			set_position();
		}
		
		sprite_index = spr_enemy;
		
		action = "none";
	}
}

if(action == "kicked")
{
	set_position();
}
else if(action == "none")
{
	sync_image_index_to_bgm();
}

depth = -y;