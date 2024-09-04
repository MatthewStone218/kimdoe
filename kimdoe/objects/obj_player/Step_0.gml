/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

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
				instance_create_depth(x-global.cell_width,y,depth-1000,obj_ef_kick);
				dir = "left";
				action = "kick";
				action_time = 0;
				var _inst = instance_position(x-global.cell_width,y,obj_block);
				with(_inst){ kicked("left") }
				sprite_index = spr_player_kick_left;
				image_index = 0;
			}
			else if(!position_meeting(x-global.cell_width,y,obj_sol))
			{
				instance_create_depth(x,y,depth-1000,obj_ef_move);
				dir = "left";
				action = "move";
				action_time = 0;
				x_prev = x;
				y_prev = y;
				x_goal = x-global.cell_width;
				sprite_index = spr_player_move_left;
				image_index = 0;
			}
		}
		else if(action_input == "right")
		{
			action_input = "none";
			if(position_meeting(x+global.cell_width,y,obj_block))
			{
				instance_create_depth(x+global.cell_width,y,depth-1000,obj_ef_kick);
				dir = "right";
				action = "kick";
				action_time = 0;
				var _inst = instance_position(x+global.cell_width,y,obj_block);
				with(_inst){ kicked("right") }
				sprite_index = spr_player_kick_right;
				image_index = 0;
			}
			else if(!position_meeting(x+global.cell_width,y,obj_sol))
			{
				instance_create_depth(x,y,depth-1000,obj_ef_move);
				dir = "right";
				action = "move";
				action_time = 0;
				x_prev = x;
				y_prev = y;
				x_goal = x+global.cell_width;
				sprite_index = spr_player_move_right;
				image_index = 0;
			}
		}
		else if(action_input == "up")
		{
			action_input = "none";
			if(position_meeting(x,y-global.cell_width,obj_block))
			{
				instance_create_depth(x,y-global.cell_width,depth-1000,obj_ef_kick);
				dir = "up";
				action = "kick";
				action_time = 0;
				var _inst = instance_position(x,y-global.cell_width,obj_block);
				with(_inst){ kicked("up") }
				sprite_index = spr_player_kick_up;
				image_index = 0;
			}
			else if(!position_meeting(x,y-global.cell_width,obj_sol))
			{
				instance_create_depth(x,y,depth-1000,obj_ef_move);
				dir = "up";
				action = "move";
				action_time = 0;
				x_prev = x;
				y_prev = y;
				y_goal = y-global.cell_width;
				sprite_index = spr_player_move_up;
				image_index = 0;
			}
		}
		else if(action_input == "down")
		{
			action_input = "none";
			if(position_meeting(x,y+global.cell_width,obj_block))
			{
				instance_create_depth(x,y+global.cell_width,depth-1000,obj_ef_kick);
				dir = "down";
				action = "kick";
				action_time = 0;
				var _inst = instance_position(x,y+global.cell_width,obj_block);
				with(_inst){ kicked("down") }
				sprite_index = spr_player_kick_down;
				image_index = 0;
			}
			else if(!position_meeting(x,y+global.cell_width,obj_sol))
			{
				instance_create_depth(x,y,depth-1000,obj_ef_move);
				dir = "down";
				action = "move";
				action_time = 0;
				x_prev = x;
				y_prev = y;
				y_goal = y+global.cell_width;
				sprite_index = spr_player_move_down;
				image_index = 0;
			}
		}
	}
}

depth = -y;