/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
LIVE
if(global.state == ST.GAME)
{
	if(action_time < 1)
	{
		action_time += 0.05;
		image_index = action_time*sprite_get_number(sprite_index);
	
		if(action_time >= 1)
		{
			action_time = 1;
		
			if(action == "move")
			{
				set_position();
			}

			switch(dir)
			{
				case "left": sprite_index = spr_player_idle_left; break;
				case "right": sprite_index = spr_player_idle_right; break;
				case "up": sprite_index = spr_player_idle_up; break;
				case "down": sprite_index = spr_player_idle_down; break;
			}
			action = "none";
		}
	}

	if(action == "move")
	{
		set_position();
	}

	if(action_input == "none")
	{
		if(input_check_pressed("left"))
		{
			action_input = "left";
		}
		else if(input_check_pressed("right"))
		{
			action_input = "right";
		}
		else if(input_check_pressed("up"))
		{
			action_input = "up";
		}
		else if(input_check_pressed("down"))
		{
			action_input = "down";
		}
	}

	if(action_time == 1)
	{
		if(action_input == "left")
		{
			action_input = "none";
		
			if(position_meeting(x-global.cell_width,y,obj_block))
			{
				kick(x-global.cell_width,y,"left");
			}
			else if(!position_meeting(x-global.cell_width,y,obj_sol))
			{
				move(x-global.cell_width,y,"left");
			}
		}
		else if(action_input == "right")
		{
			action_input = "none";
			if(position_meeting(x+global.cell_width,y,obj_block))
			{
				kick(x+global.cell_width,y,"right");
			}
			else if(!position_meeting(x+global.cell_width,y,obj_sol))
			{
				move(x+global.cell_width,y,"right");
			}
		}
		else if(action_input == "up")
		{
			action_input = "none";
			if(position_meeting(x,y-global.cell_width,obj_block))
			{
				kick(x,y-global.cell_width,"up");
			}
			else if(!position_meeting(x,y-global.cell_width,obj_sol))
			{
				move(x,y-global.cell_width,"up");
			}
		}
		else if(action_input == "down")
		{
			action_input = "none";
			if(position_meeting(x,y+global.cell_width,obj_block))
			{
				kick(x,y+global.cell_width,"down");
			}
			else if(!position_meeting(x,y+global.cell_width,obj_sol))
			{
				move(x,y+global.cell_width,"down");
			}
		}
	}
}

depth = -y;

//set_hair_pos();

hair_x = x;
hair_y = y-62;

switch(sprite_index)
{
	case spr_player_idle_down:
		if(image_index < 1)
		{
			hair_x = x-3;
			hair_y = y-70;
		}
		else if(image_index < 2)
		{
			hair_x = x-2;
			hair_y = y-70;
		}
		else if(image_index < 3)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 4)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 5)
		{
			hair_x = x+2;
			hair_y = y-70;
		}
		else if(image_index < 6)
		{
			hair_x = x+3;
			hair_y = y-70;
		}
		else if(image_index < 7)
		{
			hair_x = x+3;
			hair_y = y-70;
		}
		else if(image_index < 8)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(sprite_index < 9)
		{
			hair_x = x-2;
			hair_y = y-70;
		}
		else if(image_index < 10)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 11)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 12)
		{
			hair_x = x-3;
			hair_y = y-70;
		}
	break;
	case spr_player_idle_up:
		if(image_index < 1)
		{
			hair_x = x;
			hair_y = y-62;
		}
		else if(image_index < 2)
		{
			hair_x = x-2;
			hair_y = y-55;
		}
		else if(image_index < 3)
		{
			hair_x = x-2;
			hair_y = y-55;
		}
		else if(image_index < 4)
		{
			hair_x = x;
			hair_y = y-55;
		}
		else if(image_index < 5)
		{
			hair_x = x+2;
			hair_y = y-60;
		}
		else if(image_index < 6)
		{
			hair_x = x;
			hair_y = y-60;
		}
		else if(image_index < 7)
		{
			hair_x = x-2;
			hair_y = y-60;
		}
		else if(image_index < 8)
		{
			hair_x = x+2;
			hair_y = y-55;
		}
		else if(image_index < 9)
		{
			hair_x = x;
			hair_y = y-55;
		}
		else if(image_index < 10)
		{
			hair_x = x;
			hair_y = y-55;
		}
		else if(image_index < 11)
		{
			hair_x = x-2;
			hair_y = y-60;
		}
		else if(image_index < 12)
		{
			hair_x = x-2;
			hair_y = y-60;
		}
	break;
	case spr_player_idle_right:
		if(image_index < 1)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 2)
		{
			hair_x = x-4;
			hair_y = y-73;
		}
		else if(image_index < 3)
		{
			hair_x = x-6;
			hair_y = y-75;
		}
		else if(image_index < 4)
		{
			hair_x = x-12;
			hair_y = y-73;
		}
		else if(image_index < 5)
		{
			hair_x = x-10;
			hair_y = y-70;
		}
		else if(image_index < 6)
		{
			hair_x = x-3;
			hair_y = y-70;
		}
		else if(image_index < 7)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 8)
		{
			hair_x = x-5;
			hair_y = y-70;
		}
		else if(image_index < 9)
		{
			hair_x = x-10;
			hair_y = y-70;
		}
		else if(image_index < 10)
		{
			hair_x = x-13;
			hair_y = y-70;
		}
		else if(image_index < 11)
		{
			hair_x = x-10;
			hair_y = y-70;
		}
		else if(image_index < 12)
		{
			hair_x = x;
			hair_y = y-70;
		}
	break;
	case spr_player_idle_left:
		if(image_index < 1)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 2)
		{
			hair_x = x+4;
			hair_y = y-73;
		}
		else if(image_index < 3)
		{
			hair_x = x+6;
			hair_y = y-75;
		}
		else if(image_index < 4)
		{
			hair_x = x+12;
			hair_y = y-73;
		}
		else if(image_index < 5)
		{
			hair_x = x+10;
			hair_y = y-70;
		}
		else if(image_index < 6)
		{
			hair_x = x+3;
			hair_y = y-70;
		}
		else if(image_index < 7)
		{
			hair_x = x;
			hair_y = y-70;
		}
		else if(image_index < 8)
		{
			hair_x = x+5;
			hair_y = y-70;
		}
		else if(image_index < 9)
		{
			hair_x = x+10;
			hair_y = y-70;
		}
		else if(image_index < 10)
		{
			hair_x = x+13;
			hair_y = y-70;
		}
		else if(image_index < 11)
		{
			hair_x = x+10;
			hair_y = y-70;
		}
		else if(image_index < 12)
		{
			hair_x = x;
			hair_y = y-70;
		}
	break;
	case spr_player_kick_left:
		if(image_index < 1)
		{
			hair_x = x+15;
			hair_y = y-60;
		}
		else if(image_index < 2)
		{
			hair_x = x+15;
			hair_y = y-60;
		}
		else if(image_index < 3)
		{
			hair_x = x+15;
			hair_y = y-60;
		}
		else if(image_index < 4)
		{
			hair_x = x+15;
			hair_y = y-60;
		}
		else if(image_index < 5)
		{
			hair_x = x+12;
			hair_y = y-60;
		}
		else if(image_index < 6)
		{
			hair_x = x+3;
			hair_y = y-65;
		}
		else if(image_index < 7)
		{
			hair_x = x+14;
			hair_y = y-70;
		}
		else if(image_index < 8)
		{
			hair_x = x+5;
			hair_y = y-70;
		}
		else if(image_index < 9)
		{
			hair_x = x+2;
			hair_y = y-70;
		}
		else if(image_index < 10)
		{
			hair_x = x+2;
			hair_y = y-70;
		}
		else if(image_index < 11)
		{
			hair_x = x+2;
			hair_y = y-70;
		}
		else if(image_index < 12)
		{
			hair_x = x;
			hair_y = y-70;
		}
	break;
	case spr_player_kick_right:
		if(image_index < 1)
		{
			hair_x = x-15;
			hair_y = y-60;
		}
		else if(image_index < 2)
		{
			hair_x = x-15;
			hair_y = y-60;
		}
		else if(image_index < 3)
		{
			hair_x = x-15;
			hair_y = y-60;
		}
		else if(image_index < 4)
		{
			hair_x = x-15;
			hair_y = y-60;
		}
		else if(image_index < 5)
		{
			hair_x = x-12;
			hair_y = y-60;
		}
		else if(image_index < 6)
		{
			hair_x = x-3;
			hair_y = y-65;
		}
		else if(image_index < 7)
		{
			hair_x = x-14;
			hair_y = y-70;
		}
		else if(image_index < 8)
		{
			hair_x = x-5;
			hair_y = y-70;
		}
		else if(image_index < 9)
		{
			hair_x = x-2;
			hair_y = y-70;
		}
		else if(image_index < 10)
		{
			hair_x = x-2;
			hair_y = y-70;
		}
		else if(image_index < 11)
		{
			hair_x = x-2;
			hair_y = y-70;
		}
		else if(image_index < 12)
		{
			hair_x = x;
			hair_y = y-70;
		}
	break;
	case spr_player_kick_up:
		if(image_index < 1)
		{
			hair_x = x-2;
			hair_y = y-45;
		}
		else if(image_index < 2)
		{
			hair_x = x-2;
			hair_y = y-45;
		}
		else if(image_index < 3)
		{
			hair_x = x-2;
			hair_y = y-45;
		}
		else if(image_index < 4)
		{
			hair_x = x-2;
			hair_y = y-45;
		}
		else if(image_index < 5)
		{
			hair_x = x-2;
			hair_y = y-45;
		}
		else if(image_index < 6)
		{
			hair_x = x-2;
			hair_y = y-60;
		}
		else if(image_index < 7)
		{
			hair_x = x-2;
			hair_y = y-60;
		}
		else if(image_index < 8)
		{
			hair_x = x-2;
			hair_y = y-60;
		}
		else if(image_index < 9)
		{
			hair_x = x-2;
			hair_y = y-65;
		}
		else if(image_index < 10)
		{
			hair_x = x-2;
			hair_y = y-65;
		}
		else if(image_index < 11)
		{
			hair_x = x-2;
			hair_y = y-65;
		}
		else if(image_index < 12)
		{
			hair_x = x-2;
			hair_y = y-65;
		}
	break;
}
