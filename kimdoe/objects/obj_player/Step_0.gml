/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(action_time < 1)
{
	action_time += 0.15;
	image_index = action_time*sprite_get_number(sprite_index);
	
	if(action_time >= 1)
	{
		action_time = 1;
		sprite_index = spr_player_idle;
		action = "none";
	}
}

if(action == "move")
{
	x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}

if(action_input == "none")
{
	if(input_check_pressed("left"))
	{
		action_input = "left";
		show_debug_message(action_input)
	}
	else if(input_check_pressed("right"))
	{
		action_input = "right";
		show_debug_message(action_input)
	}
	else if(input_check_pressed("up"))
	{
		action_input = "up";
		show_debug_message(action_input)
	}
	else if(input_check_pressed("down"))
	{
		action_input = "down";
		show_debug_message(action_input)
	}
}

if(action_time == 1)
{
	if(action_input == "left")
	{
		action_input = "none";
		
		if(position_meeting(x-global.cell_width,y,obj_block))
		{
			action = "kick";
			action_time = 0;
			var _inst = instance_position(x-global.cell_width,y,obj_block);
			with(_inst){ kick("left") }
			sprite_index = spr_player_kick;
			image_index = 0;
		}
		else if(!position_meeting(x-global.cell_width,y,obj_sol))
		{
			action = "move";
			action_time = 0;
			x_prev = x;
			y_prev = y;
			x_goal = x-global.cell_width;
			sprite_index = spr_player_move;
			image_index = 0;
		}
	}
	else if(action_input == "right")
	{
		action_input = "none";
		if(position_meeting(x+global.cell_width,y,obj_block))
		{
			action = "kick";
			action_time = 0;
			var _inst = instance_position(x+global.cell_width,y,obj_block);
			with(_inst){ kick("right") }
			sprite_index = spr_player_kick;
			image_index = 0;
		}
		else if(!position_meeting(x+global.cell_width,y,obj_sol))
		{
			action = "move";
			action_time = 0;
			x_prev = x;
			y_prev = y;
			x_goal = x+global.cell_width;
			sprite_index = spr_player_move;
			image_index = 0;
		}
	}
	else if(action_input == "up")
	{
		action_input = "none";
		if(position_meeting(x,y-global.cell_width,obj_block))
		{
			action = "kick";
			action_time = 0;
			var _inst = instance_position(x,y-global.cell_width,obj_block);
			with(_inst){ kick("up") }
			sprite_index = spr_player_kick;
			image_index = 0;
		}
		else if(!position_meeting(x,y-global.cell_width,obj_sol))
		{
			action = "move";
			action_time = 0;
			x_prev = x;
			y_prev = y;
			y_goal = y-global.cell_width;
			sprite_index = spr_player_move;
			image_index = 0;
		}
	}
	else if(action_input == "down")
	{
		action_input = "none";
		if(position_meeting(x,y+global.cell_width,obj_block))
		{
			action = "kick";
			action_time = 0;
			var _inst = instance_position(x,y+global.cell_width,obj_block);
			with(_inst){ kick("down") }
			sprite_index = spr_player_kick;
			image_index = 0;
		}
		else if(!position_meeting(x,y+global.cell_width,obj_sol))
		{
			action = "move";
			action_time = 0;
			x_prev = x;
			y_prev = y;
			y_goal = y+global.cell_width;
			sprite_index = spr_player_move;
			image_index = 0;
		}
	}
}