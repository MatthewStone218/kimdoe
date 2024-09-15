/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

hp = 100;

global.player_action_speed = 0.1;
global.player_can_attack = true;

action_speed = 1;

action = "none";
action_time = 0;
total_action_time = 60;

rush_pos = [x,y];

x_prev = x;
y_prev = y;
x_goal = x;
y_goal = y;

hit = 0;

function get_hit()
{
	if(hit <= 0)
	{
		hit = 30;
		image_blend = c_red;
		hp -= 5;
		instance_create_depth(x,y,depth-100,obj_ef_kick);
		obj_camera.bib = 20;
		action_time = 0;
		start_cooltime();
		
		if(hp <= 50)
		{
			obj_dialogue_system.set_dialogue(dialogue[0]);
		}
	}
}

function set_blend()
{
	var _red = min(color_get_red(image_blend)+25,255);
	var _green = min(color_get_green(image_blend)+25,255);
	var _blue = min(color_get_blue(image_blend)+25,255);
	image_blend = make_color_rgb(_red,_green,_blue);
}

function start_cooltime()
{
	action = "cooltime";
	total_action_time = irandom_range(20,100);
}

function start_ready_rush_attack_1()
{
	action = "ready_rush_attack";
	total_action_time = 5;
	
	var _horizontal = true;
	if(abs(x-obj_player.x) > abs(y-obj_player.y)){_horizontal = false;}
	
	var _x,_y;
	
	if(_horizontal)
	{
		_x = obj_player.x;
		_y = y;
	}
	else
	{
		_x = x;
		_y = obj_player.y;
	}
	
	var _dir = point_direction(x,y,_x,_y);
	var _dis = point_distance(x,y,_x,_y);
	
	var _inst = instance_create_depth(x+lengthdir_x(32,_dir),y+lengthdir_y(32,_dir),-3000,obj_ef_boss_attack_range);
	_inst.image_angle = _dir;
	_inst.image_xscale = _dis-32;
	
	x_prev = x;
	y_prev = y;
	x_goal = _x;
	y_goal = _y;
}

function start_ready_rush_attack_2()
{
	action = "ready_rush_attack";
	total_action_time = 40;
	
	var _x = obj_player.x;
	var _y = obj_player.y;

	
	var _dir = point_direction(x,y,_x,_y);
	var _dis = point_distance(x,y,_x,_y);
	
	var _inst = instance_create_depth(x+lengthdir_x(32,_dir),y+lengthdir_y(32,_dir),-3000,obj_ef_boss_attack_range);
	_inst.image_angle = _dir;
	_inst.image_xscale = _dis-32;
	
	x_prev = x;
	y_prev = y;
	x_goal = _x;
	y_goal = _y;
}

function start_rush_attack()
{
	action = "rush_attack";
	total_action_time = 10;
}

function rush_attack()
{
	instance_create_depth(x,y,depth+300,obj_ef_move);
	x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}

function check_collision_with_player()
{
	var _player_x = obj_player.x;
	var _player_y = obj_player.y;
	
	obj_player.x = obj_player.s_x;
	obj_player.y = obj_player.s_y;
	
	var _result = false;
	if(place_meeting(x,y,obj_player)){ _result = true; }
	
	obj_player.x = _player_x;
	obj_player.y = _player_y;
	
	return _result;
}

//start_cooltime();

dialogue = 
[
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지  옥에서는 아무도 못 나가 해병님",
		text: "아쎄이! 지금이라도 전우애를 실시하겠다면 용서해 줄 수 있다!",
		next_struct: function(){ return obj_boss_phase_2.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "지랄마! 난 널 죽이고 여길 나가겠어!",
		next_struct: function(){ return obj_boss_phase_2.dialogue[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		func: function(){
			room_goto_f(rm_stage_boss_phase_3, ST.GAME);
		}
	}
];