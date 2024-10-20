/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

global.key = 0;

action_time = 1;

action = "none";
action_input = "none";

s_x = x;
s_y = y;

x_prev = x;
y_prev = y;

x_goal = x;
y_goal = y;

dir = "down";

hair_index = 0;
hair_x = x;
hair_y = y;

var _bgm = snd_bgm;

if(room == rm_stage_boss_phase_1 || room == rm_stage_boss_phase_2 || room == rm_stage_boss_phase_3){
	_bgm = snd_bgm_boss_2;
} else {
	_bgm = snd_bgm;
}
	
if(global.bgm_index != _bgm)
{
	start_bgm(_bgm);
}

function die()
{
	if(global.state == ST.DYING)
	{	
		global.state = ST.MOVING;
		repeat(300)
		{
			instance_create_depth(x,y,-10020,obj_ef_hair_die_2);
		}
	}
}

function kill_self()
{
	global.state = ST.DYING;
	
	instance_create_depth(x,y,-10000,obj_ef_player_die);
	
	if(instance_exists(obj_hair) && !global.player_can_attack)
	{
		with(obj_hair)
		{
			if(child == noone)
			{
				die(true);
			}
		}
	}
	else
	{
		with(obj_hair)
		{
			die(false);
		}
		
		die();
	}
}

function set_death_timer(frame)
{
	alarm[0] = frame;
}

function set_position()
{
	s_x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	s_y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}

function gain_hair()
{
	if(instance_exists(obj_hair))
	{
		var _obj = noone;
		with(obj_hair)
		{
			if(child == noone)
			{
				_obj = id;
				break;
			}
		}
		
		add_child_hair(_obj);
	}
	else
	{
		add_child_hair(id);
	}
}

function add_child_hair(_id = id)
{
	var _inst = instance_create_depth(_id.x,_id.y,depth,obj_hair);
	_inst.hair_index = instance_number(obj_hair);
	_inst.parent = _id;
	_id.child = _inst;
}

function pull_hair()
{
	with(obj_hair)
	{
		if(child == noone)
		{
			follow();
			break;
		}
	}
}

function try_move(xx,yy,dir_str)
{
	if(position_meeting(xx,yy,obj_block))
	{
		kick_block(xx,yy,dir_str);
	}
	else if(position_meeting(xx,yy,obj_block_bossfight))
	{
		kick_block_bossfight(xx,yy,dir_str);
	}
	else if(position_meeting(xx,yy,obj_enemy))
	{
		kick_enemy(xx,yy,dir_str);
	}
	else if(position_meeting(xx,yy,obj_locked_block))
	{
		if(global.key > 0)
		{
			unlock_block(xx,yy);
			move(xx,yy,dir_str);
		}
	}
	else if(!position_meeting(xx,yy,obj_sol))
	{
		move(xx,yy,dir_str);
	}
}

function unlock_block(xx,yy)
{
	var _inst = instance_place(xx,yy,obj_locked_block);
	if(instance_exists(_inst))
	{
		_inst.unlock();
	}
}

function move(xx,yy,_dir)
{
	audio_stop_sound(snd_move);
	audio_play_sound(snd_move,1,0);
	instance_create_depth(x,y,depth,obj_ef_move);
	dir = _dir;
	action = "move";
	action_time = 0;
	x_prev = x;
	y_prev = y;
	s_x = x;
	s_y = y;
	x_goal = xx;
	y_goal = yy;
	
	switch(_dir)
	{
		case "left": sprite_index = spr_player_move_left; break;
		case "right": sprite_index = spr_player_move_right; break;
		case "up": sprite_index = spr_player_move_up; break;
		case "down": sprite_index = spr_player_move_down; break;
	}
	
	image_index = 0;
				
	if(position_meeting(xx,yy,obj_item))
	{
		with(instance_place(xx,yy,obj_item))
		{
			gain();
		}
	}
	
	if(position_meeting(xx,yy,obj_hair))
	{
		var _inst = instance_place(xx,yy,obj_hair);
		if(_inst.hair_index == 1)
		{
			if(!global.player_can_attack)
			{
				global.state = ST.DYING;
				instance_create_depth(x,y,-10000,obj_ef_player_die);
			}
			with(_inst)
			{
				die(true);
			}
		}
	}
				
	pull_hair();
	
	x = xx;
	y = yy;
	
	if(position_meeting(xx,yy,obj_hair))
	{
		if(!global.player_can_attack)
		{
			global.state = ST.DYING;
			with(instance_place(xx,yy,obj_hair))
			{
				die(true);
			}
			instance_create_depth(x,y,-10000,obj_ef_player_die);
		}
		else
		{
			with(obj_hair)
			{
				with(obj_player_attack_tile)
				{
					reset();
				}
				
				with(obj_player_attack_tile_start_point)
				{
					check();
				}
				
				with(obj_player_attack_tile)
				{
					if(get_neighbor_number() <= 3)
					{
						no_spike = true;
					}
				}
				
				with(obj_player_attack_tile)
				{
					if(no_spike){is_in_range = false;}
				}
					
				with(obj_player_attack_tile)
				{
					if(is_in_range)
					{
						instance_create_depth(x,y,-y+300,obj_player_attack_spike);
					}
				}
				
				die(false);
			}
		}
	}
	
	with(obj_npc)
	{
		if(position_meeting(x-global.cell_width,y,obj_player) or position_meeting(x+global.cell_width,y,obj_player) or position_meeting(x,y-global.cell_width,obj_player) or position_meeting(x,y+global.cell_width,obj_player))
		{
			interact();
		}
	}
	
	with(obj_switch_spike){switch_floor();}
	
	if(position_meeting(xx,yy,obj_spike))
	{
		kill_self();
	}
}

function kick_block(xx,yy,_dir)
{
	instance_create_depth(xx,yy,depth-1000,obj_ef_kick);

	play_kick_ani(_dir);

	var _inst = instance_position(xx,yy,obj_block);
	
	var _moved = false;
	with(_inst){ _moved = kicked(_dir); }
	
	if(_moved)
	{
		with(obj_switch_spike){switch_floor();}
	}
	
	if(position_meeting(x,y,obj_spike))
	{
		kill_self();
	}
}

function kick_block_bossfight(xx,yy,_dir)
{
	instance_create_depth(xx,yy,depth-1000,obj_ef_kick);

	play_kick_ani(_dir);

	instance_position(xx,yy,obj_block_bossfight).kicked(_dir);
}

function kick_enemy(xx,yy,_dir)
{
	instance_create_depth(xx,yy,depth-1000,obj_ef_kick);
	
	play_kick_ani(_dir);
	
	var _inst = instance_position(xx,yy,obj_enemy);
	
	with(_inst){ kicked(_dir); }
	
	with(obj_switch_spike){switch_floor();}
	
	if(position_meeting(x,y,obj_spike))
	{
		kill_self();
	}
}

function play_kick_ani(_dir)
{
	dir = _dir;
	action = "kick";
	action_time = 0;
	
	switch(_dir)
	{
		case "left": sprite_index = spr_player_kick_left; break;
		case "right": sprite_index = spr_player_kick_right; break;
		case "up": sprite_index = spr_player_kick_up; break;
		case "down": sprite_index = spr_player_kick_down; break;
	}
	
	image_index = 0;
}

function set_hair_pos()
{
	hair_x = s_x;
	hair_y = s_y-31;


	switch(sprite_index)
	{
		case spr_player_idle_down:
			if(image_index < 1)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 2)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 3)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 4)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 5)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 6)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 7)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 8)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(sprite_index < 9)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 10)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 11)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
			else if(image_index < 12)
			{
				hair_x = s_x;
				hair_y = s_y-32;
			}
		break;
		case spr_player_idle_up:
			if(image_index < 1)
			{
				hair_x = s_x-2;
				hair_y = s_y-28;
			}
			else if(image_index < 2)
			{
				hair_x = s_x-1;
				hair_y = s_y-25;
			}
			else if(image_index < 3)
			{
				hair_x = s_x-1;
				hair_y = s_y-25;
			}
			else if(image_index < 4)
			{
				hair_x = s_x-1;
				hair_y = s_y-26;
			}
			else if(image_index < 5)
			{
				hair_x = s_x;
				hair_y = s_y-27;
			}
			else if(image_index < 6)
			{
				hair_x = s_x;
				hair_y = s_y-27;
			}
			else if(image_index < 7)
			{
				hair_x = s_x;
				hair_y = s_y-27;
			}
			else if(image_index < 8)
			{
				hair_x = s_x;
				hair_y = s_y-27;
			}
			else if(image_index < 9)
			{
				hair_x = s_x;
				hair_y = s_y-27;
			}
			else if(image_index < 10)
			{
				hair_x = s_x-1;
				hair_y = s_y-26;
			}
			else if(image_index < 11)
			{
				hair_x = s_x-1;
				hair_y = s_y-27;
			}
			else if(image_index < 12)
			{
				hair_x = s_x-1;
				hair_y = s_y-27;
			}
		break;
		case spr_player_idle_right:
			if(image_index < 1)
			{
				hair_x = s_x-3;
				hair_y = s_y-32;
			}
			else if(image_index < 2)
			{
				hair_x = s_x-3;
				hair_y = s_y-33;
			}
			else if(image_index < 3)
			{
				hair_x = s_x-3;
				hair_y = s_y-31;
			}
			else if(image_index < 4)
			{
				hair_x = s_x-3;
				hair_y = s_y-30;
			}
			else if(image_index < 5)
			{
				hair_x = s_x-3;
				hair_y = s_y-29;
			}
			else if(image_index < 6)
			{
				hair_x = s_x-3;
				hair_y = s_y-30;
			}
			else if(image_index < 7)
			{
				hair_x = s_x-3;
				hair_y = s_y-32;
			}
			else if(image_index < 8)
			{
				hair_x = s_x-3;
				hair_y = s_y-32;
			}
			else if(image_index < 9)
			{
				hair_x = s_x-3;
				hair_y = s_y-31;
			}
			else if(image_index < 10)
			{
				hair_x = s_x-3;
				hair_y = s_y-30;
			}
			else if(image_index < 11)
			{
				hair_x = s_x-3;
				hair_y = s_y-30;
			}
			else if(image_index < 12)
			{
				hair_x = s_x-3;
				hair_y = s_y-31;
			}
		break;
		case spr_player_idle_left:
			if(image_index < 1)
			{
				hair_x = s_x+3;
				hair_y = s_y-32;
			}
			else if(image_index < 2)
			{
				hair_x = s_x+3;
				hair_y = s_y-33;
			}
			else if(image_index < 3)
			{
				hair_x = s_x+3;
				hair_y = s_y-31;
			}
			else if(image_index < 4)
			{
				hair_x = s_x+3;
				hair_y = s_y-30;
			}
			else if(image_index < 5)
			{
				hair_x = s_x+3;
				hair_y = s_y-29;
			}
			else if(image_index < 6)
			{
				hair_x = s_x+3;
				hair_y = s_y-30;
			}
			else if(image_index < 7)
			{
				hair_x = s_x+3;
				hair_y = s_y-32;
			}
			else if(image_index < 8)
			{
				hair_x = s_x+3;
				hair_y = s_y-32;
			}
			else if(image_index < 9)
			{
				hair_x = s_x+3;
				hair_y = s_y-31;
			}
			else if(image_index < 10)
			{
				hair_x = s_x+3;
				hair_y = s_y-30;
			}
			else if(image_index < 11)
			{
				hair_x = s_x+3;
				hair_y = s_y-30;
			}
			else if(image_index < 12)
			{
				hair_x = s_x+3;
				hair_y = s_y-31;
			}
		break;
		case spr_player_kick_left:
			if(image_index < 1)
			{
				hair_x = s_x+7;
				hair_y = s_y-30;
			}
			else if(image_index < 2)
			{
				hair_x = s_x+7;
				hair_y = s_y-30;
			}
			else if(image_index < 3)
			{
				hair_x = s_x+7;
				hair_y = s_y-30;
			}
			else if(image_index < 4)
			{
				hair_x = s_x+7;
				hair_y = s_y-30;
			}
			else if(image_index < 5)
			{
				hair_x = s_x+6;
				hair_y = s_y-30;
			}
			else if(image_index < 6)
			{
				hair_x = s_x+1;
				hair_y = s_y-32;
			}
			else if(image_index < 7)
			{
				hair_x = s_x+7;
				hair_y = s_y-35;
			}
			else if(image_index < 8)
			{
				hair_x = s_x+2;
				hair_y = s_y-35;
			}
			else if(image_index < 9)
			{
				hair_x = s_x+1;
				hair_y = s_y-35;
			}
			else if(image_index < 10)
			{
				hair_x = s_x+1;
				hair_y = s_y-35;
			}
			else if(image_index < 11)
			{
				hair_x = s_x+1;
				hair_y = s_y-35;
			}
			else if(image_index < 12)
			{
				hair_x = s_x;
				hair_y = s_y-35;
			}
		break;
		case spr_player_kick_right:
			if(image_index < 1)
			{
				hair_x = s_x-7;
				hair_y = s_y-30;
			}
			else if(image_index < 2)
			{
				hair_x = s_x-7;
				hair_y = s_y-30;
			}
			else if(image_index < 3)
			{
				hair_x = s_x-7;
				hair_y = s_y-30;
			}
			else if(image_index < 4)
			{
				hair_x = s_x-7;
				hair_y = s_y-30;
			}
			else if(image_index < 5)
			{
				hair_x = s_x-6;
				hair_y = s_y-30;
			}
			else if(image_index < 6)
			{
				hair_x = s_x-1;
				hair_y = s_y-32;
			}
			else if(image_index < 7)
			{
				hair_x = s_x-7;
				hair_y = s_y-35;
			}
			else if(image_index < 8)
			{
				hair_x = s_x-2;
				hair_y = s_y-35;
			}
			else if(image_index < 9)
			{
				hair_x = s_x-1;
				hair_y = s_y-35;
			}
			else if(image_index < 10)
			{
				hair_x = s_x-1;
				hair_y = s_y-35;
			}
			else if(image_index < 11)
			{
				hair_x = s_x-1;
				hair_y = s_y-35;
			}
			else if(image_index < 12)
			{
				hair_x = s_x;
				hair_y = s_y-35;
			}
		break;
		case spr_player_kick_up:
			if(image_index < 1)
			{
				hair_x = s_x-1;
				hair_y = s_y-22;
			}
			else if(image_index < 2)
			{
				hair_x = s_x-1;
				hair_y = s_y-22;
			}
			else if(image_index < 3)
			{
				hair_x = s_x-1;
				hair_y = s_y-22;
			}
			else if(image_index < 4)
			{
				hair_x = s_x-1;
				hair_y = s_y-22;
			}
			else if(image_index < 5)
			{
				hair_x = s_x-1;
				hair_y = s_y-22;
			}
			else if(image_index < 6)
			{
				hair_x = s_x-1;
				hair_y = s_y-30;
			}
			else if(image_index < 7)
			{
				hair_x = s_x-1;
				hair_y = s_y-30;
			}
			else if(image_index < 8)
			{
				hair_x = s_x-1;
				hair_y = s_y-30;
			}
			else if(image_index < 9)
			{
				hair_x = s_x-1;
				hair_y = s_y-32;
			}
			else if(image_index < 10)
			{
				hair_x = s_x-1;
				hair_y = s_y-32;
			}
			else if(image_index < 11)
			{
				hair_x = s_x-1;
				hair_y = s_y-32;
			}
			else if(image_index < 12)
			{
				hair_x = s_x-1;
				hair_y = s_y-32;
			}
		break;
	}
}