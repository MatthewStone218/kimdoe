/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

s_x = x;
s_y = y;

x_prev = x;
y_prev = y;

x_goal = x;
y_goal = y;

action = "none";
action_time = 1;

function kicked(dir)
{
	audio_stop_sound(snd_kick_stone);
	audio_play_sound(snd_kick_stone,1,0);
	switch(dir)
	{
		case "left":
			xx = x-global.cell_width;
			yy = y;
			sprite_index = spr_enemy_hit_left;
		break;
		case "right":
			xx = x+global.cell_width;
			yy = y;
			sprite_index = spr_enemy_hit_right;
		break;
		case "up":
			xx = x;
			yy = y-global.cell_width;
			sprite_index = spr_enemy_hit_up;
		break;
		case "down":
			xx = x;
			yy = y+global.cell_width;
			sprite_index = spr_enemy_hit_down;
		break;
	}
	
	instance_create_depth(x,y,depth+1,obj_ef_move);
	if(!position_meeting(xx,yy,obj_blocks))
	{
		action = "kicked";
		action_time = 0;
	
		x_prev = x;
		y_prev = y;
				
		x = xx;
		y = yy;
	
		x_goal = x;
		y_goal = y;
	}
	else
	{
		instance_destroy();
		exit;
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
}

function set_position()
{
	s_x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	s_y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}