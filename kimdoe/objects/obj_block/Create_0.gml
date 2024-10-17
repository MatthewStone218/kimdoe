/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

image_index = irandom(sprite_get_number(sprite_index)-1);

s_x = x;
s_y = y;

x_prev = x;
y_prev = y;

x_goal = x;
y_goal = y;

action = "none";
action_time = 1;

bib = 0;

function kicked(dir)
{
	audio_stop_sound(snd_kick_stone);
	audio_play_sound(snd_kick_stone,1,0);
	var _moved = false;
	
	switch(dir)
	{
		case "left":
			xx = x-global.cell_width;
			yy = y;
		break;
		case "right":
			xx = x+global.cell_width;
			yy = y;
		break;
		case "up":
			xx = x;
			yy = y-global.cell_width;
		break;
		case "down":
			xx = x;
			yy = y+global.cell_width;
		break;
	}
	
	instance_create_depth(x,y,depth+1,obj_ef_move);
	if(position_meeting(xx,yy,obj_blocks))
	{
		_moved = false;
		bib = 25;
	}
	else
	{
		_moved = true;
		action = "kicked";
		action_time = 0;
	
		x_prev = x;
		y_prev = y;
				
		x = xx;
		y = yy;
	
		x_goal = x;
		y_goal = y;
	}
	
	if(position_meeting(xx,yy,obj_hair))
	{
		global.state = ST.DYING;
		instance_create_depth(obj_player.x,obj_player.y,-10000,obj_ef_player_die);
		with(instance_place(xx,yy,obj_hair))
		{
			die(true);
		}
	}
	
	return _moved;
}

function set_position()
{
	s_x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	s_y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}