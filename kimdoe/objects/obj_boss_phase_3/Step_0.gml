/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(global.state == ST.GAME)
{
	set_blend();
	
	action_speed += 0.001;
	if(action_speed >= 1.8){action_speed = 1;}
	
	action_time += action_speed/(total_action_time);
	if(action_time > 1){action_time = 1;}

	switch(action)
	{
		case "rush_attack":
			rush_attack();
		break;
		case "rush_for_helicopter":
			rush_attack();
		break;
		case "helicopter_attack_1":
			helicopter_attack_1();
		break;
		case "helicopter_attack_2":
			helicopter_attack_2();
		break;
		case "ready_block_attack":
			ready_block_attack();
		break;
		case "block_attack":
			block_attack();
		break;
		
	}

	if(action_time == 1)
	{	
		action_time = 0;
	
		switch(action)
		{
			case "cooltime":
				start_random_action();
			break;
		
			case "ready_rush_attack":
				start_rush_attack();
			break;
		
			case "rush_attack":
			case "block_attack":
				start_cooltime();
			break;
			
			case "helicopter_attack_2":
				end_helicopter_attack();
			break;
			
			case "ready_helicopter_1":
				start_rush_for_helicopter();
			break;
			
			case "rush_for_helicopter":
				start_ready_helicopter_2();
			break;
			
			case "ready_helicopter_2":
				start_helicopter_attack_1();
			break;
			
			case "helicopter_attack_1":
				start_helicopter_attack_2();
			break;
			
			case "ready_block_attack":
				start_block_attack();
			break;
		}
	}

	if(check_collision_with_player())
	{
		obj_player.kill_self();
	}
	
	hit--;
	depth = -y;
}