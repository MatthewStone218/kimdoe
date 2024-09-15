/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

alarm[0] = 60*40;

global.player_action_speed = 0.1;
global.player_can_attack = false;

hp = 100;

action_speed = 1;

action = "cooltime";
action_time = 0;
total_action_time = 60;

rush_pos = [x,y];

x_prev = x;
y_prev = y;
x_goal = x;
y_goal = y;

function get_hit(){}

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

start_cooltime();

dialogue = 
[
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지  옥에서는 아무도 못 나가 해병님",
		text: "새끼...기열!",
		next_struct: function(){ return obj_boss_phase_1.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지  옥에서는 아무도 못 나가 해병님",
		text: "용서해주겠다고 했음에도 불구하고\n전우애를 실시하지 않고 도망다니는 찐빠를 내다니...",
		next_struct: function(){ return obj_boss_phase_1.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지  옥에서는 아무도 못 나가 해병님",
		text: "이는 명백한 하극상이다!",
		next_struct: function(){ return obj_boss_phase_1.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지  옥에서는 아무도 못 나가 해병님",
		text: "따라서 네놈을 해병 수육으로 가공함으로써 처벌하도록 하겠다!",
		next_struct: function(){ return obj_boss_phase_1.dialogue[4]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "젠장... 어떻게 해야 이녀석을 해치울 수 있지?\n발로 차려고 다가갔다간 따이고 말거야...",
		next_struct: function(){ return obj_boss_phase_1.dialogue[5]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "전 탈모의 악마",
		text: "네 악마의 권능을 사용해라 이택기!",
		next_struct: function(){ return obj_boss_phase_1.dialogue[6]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "뭐야? 언제 따라온거야 탈모의 악마?",
		next_struct: function(){ return obj_boss_phase_1.dialogue[7]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "전 탈모의 악마",
		text: "난 더 이상 탈모의 악마가 아니다.\n네가 탈모의 악마지.",
		next_struct: function(){ return obj_boss_phase_1.dialogue[8]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "그래서 권능이란건 무슨 얘기야?",
		next_struct: function(){ return obj_boss_phase_1.dialogue[9]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "전 탈모의 악마",
		text: "네놈이 네 악마의 자리를 모두 차지하면서 얻은 능력을 말하는거다.",
		next_struct: function(){ return obj_boss_phase_1.dialogue[10]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "전 탈모의 악마",
		text: "네 머리카락으로 저녀석을 감싸라.\n그러면 녀석을 공격할 수 있어.",
		next_struct: function(){ return obj_boss_phase_1.dialogue[11]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "저녀석을 감싸라고?",
		next_struct: function(){ return obj_boss_phase_1.dialogue[12]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "전 탈모의 악마",
		text: "그래. 너는 더이상 네 머리카락을 밟아도 죽지 않아.\n오히려 범위 안에 있는 적을 공격할 수 있지.",
		next_struct: function(){ return obj_boss_phase_1.dialogue[13]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "알겠어. 한번 해볼게.",
		next_struct: function(){ return obj_boss_phase_1.dialogue[14]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		func: function(){
			room_goto_f(rm_stage_boss_phase_2, ST.GAME);
		}
	}
];