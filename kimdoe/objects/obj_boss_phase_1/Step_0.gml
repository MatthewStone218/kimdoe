/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(global.state == ST.GAME)
{
	action_speed += 0.001;
	
	action_time += action_speed/(total_action_time);
	if(action_time > 1){action_time = 1;}

	switch(action)
	{
		case "rush_attack":
			rush_attack();
		break;
	}

	if(action_time == 1)
	{	
		action_time = 0;
	
		switch(action)
		{
			case "cooltime":
				if(choose(true,false) && !(x == obj_player.x || y == obj_player.y))
				{
					start_ready_rush_attack_1();
				}
				else
				{
					start_ready_rush_attack_2();
				}
			break;
		
			case "ready_rush_attack":
				start_rush_attack();
			break;
		
			case "rush_attack":
				start_cooltime();
			break;
		}
	}

	if(check_collision_with_player())
	{
		obj_player.kill_self();
	}
}

depth = -y;