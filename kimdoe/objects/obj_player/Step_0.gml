/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
LIVE

if(action_time < 1)
{
	action_time += global.player_action_speed;
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

if(global.state == ST.GAME)
{
	if(input_check_pressed("restart"))
	{
		kill_self();
	}
	else if(action_input == "none")
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
}

if(action_time == 1)
{
	if(action_input == "left")
	{
		action_input = "none";
		try_move(x-global.cell_width,y,"left");
	}
	else if(action_input == "right")
	{
		action_input = "none";
		try_move(x+global.cell_width,y,"right");
	}
	else if(action_input == "up")
	{
		action_input = "none";
		try_move(x,y-global.cell_width,"up");
	}
	else if(action_input == "down")
	{
		action_input = "none";
		try_move(x,y+global.cell_width,"down");
	}
}

depth = -y;

set_hair_pos();

//debug
if(keyboard_check(vk_delete) and keyboard_check(vk_control) and keyboard_check(vk_home))
{
	instance_destroy(obj_item_hair);
	x = mouse_x;
	y = mouse_y;
	s_x = x;
	s_y = y;
}