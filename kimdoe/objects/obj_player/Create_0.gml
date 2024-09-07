/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

action_time = 1;

action = "none";
action_input = "none";

x_prev = x;
y_prev = y;

x_goal = x;
y_goal = y;

dir = "down";

hair_index = 0;
hair_x = x;
hair_y = y;

function set_position()
{
	x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
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

function move(xx,yy,_dir)
{
	instance_create_depth(x,y,depth,obj_ef_move);
	dir = _dir;
	action = "move";
	action_time = 0;
	x_prev = x;
	y_prev = y;
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
				
	pull_hair();
}

function kick(xx,yy,_dir)
{
	instance_create_depth(xx,yy,depth-1000,obj_ef_kick);
	dir = _dir;
	action = "kick";
	action_time = 0;
	var _inst = instance_position(xx,yy,obj_block);
	with(_inst){ kicked(_dir); }
	
	switch(_dir)
	{
		case "left": sprite_index = spr_player_kick_left; break;
		case "right": sprite_index = spr_player_kick_right; break;
		case "up": sprite_index = spr_player_kick_up; break;
		case "down": sprite_index = spr_player_kick_down; break;
	}
	
	image_index = 0;
}