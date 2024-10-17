/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

hp = 50;

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

helicopter_max_dis = 400;
helicopter_dis = 0;
helicopter_dir = 0;

blink = false;

function get_hit()
{
	if(global.state == ST.GAME)
	{
		if(hit <= 0)
		{
			hit = 30;
			hp -= 8;
			instance_create_depth(x,y,depth-100,obj_ef_kick);
			obj_camera.bib = 60;
		
			if(hp <= 0)
			{
				stop_bgm();
				global.state = ST.SCENE_BOSS_DIE;
				instance_create_depth(0,0,-100000,obj_ef_boss_die);
			}
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

function start_random_action()
{
	if(choose(true,false) && !(x == obj_player.x || y == obj_player.y))
	{
		start_ready_rush_attack_1();
	}
	else if(choose(true,false))
	{
		start_ready_rush_attack_2();
	}
	else if(choose(true, false))
	{
		start_ready_helicopter_1()
	}
	else
	{
		start_ready_block_attack();
	}
}

function start_cooltime()
{
	action = "cooltime";
	total_action_time = irandom_range(20,100);
	
	sprite_index = spr_boss_idle;
}

function start_ready_block_attack()
{
	action = "ready_block_attack";
	total_action_time = 30;
	sprite_index = spr_boss_stomp_1;
}

function ready_block_attack()
{
	image_index = ease_get_val(action_time,0,sprite_get_number(sprite_index));
}

function start_block_attack()
{
	action = "block_attack";
	total_action_time = 120;
	sprite_index = spr_boss_stomp_2;
	instance_create_depth(x,y,0,obj_ef_crack);
	
	obj_camera.bib = 50;
	
	with(obj_boss_block_attack_tile)
	{
		if(choose(true,false,false,false,false,false,false,false,false,false,false,false))
		{
			instance_create_depth(x,y,-y,obj_falling_block_bossfight);
		}
	}
}

function block_attack()
{
	image_index = ease_get_val(action_time,0,sprite_get_number(sprite_index));
}

function start_ready_helicopter_1()
{
	action = "ready_helicopter_1";
	total_action_time = 20;
	
	helicopter_dir = 0;
	helicopter_dis = 0;
	
	var _x = 448+32;
	var _y = 256+32;
	
	var _dir = point_direction(x,y,_x,_y);
	var _dis = point_distance(x,y,_x,_y);
	
	var _inst = instance_create_depth(x+lengthdir_x(32,_dir),y+lengthdir_y(32,_dir),-3000,obj_ef_boss_attack_range, {image_xscale: _dis-32});
	_inst.image_angle = _dir;
	
	x_prev = x;
	y_prev = y;
	
	x_goal = _x;
	y_goal = _y;
}

function start_ready_helicopter_2()
{
	action = "ready_helicopter_2";
	total_action_time = 60;
	
	for(var _dir = 0; _dir < 360; _dir += 90)
	{
		var _inst = instance_create_depth(x+lengthdir_x(32,_dir),y+lengthdir_y(32,_dir)-32,-3000,obj_ef_boss_attack_range_2, {image_xscale: helicopter_max_dis-32});
		_inst.image_angle = _dir;
	}
}

function start_rush_for_helicopter()
{
	action = "rush_for_helicopter";
	total_action_time = 10;
}

function start_helicopter_attack_1()
{
	action = "helicopter_attack_1";
	total_action_time = 10;
	for(var _dir = 0; _dir < 360; _dir += 90)
	{
		instance_create_depth(x,y,-4000,obj_boss_attack_helicopter_hair,{dir: _dir});
	}
}

function helicopter_attack_1()
{
	helicopter_dis = ease_get_val(ease_out_cubic(action_time),0,helicopter_max_dis);
}

function start_helicopter_attack_2()
{
	action = "helicopter_attack_2";
	total_action_time = 60*8;
	
	helicopter_dir_spd = 0;
	
	sprite_index = spr_boss_attack_helicopter;
}

function helicopter_attack_2()
{
	helicopter_dir += helicopter_dir_spd;
	helicopter_dir_spd += 0.01;
	helicopter_dir_spd = min(1.8,helicopter_dir_spd);
}

function end_helicopter_attack()
{
	start_cooltime();
	instance_destroy(obj_boss_attack_helicopter_hair);
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
	
	var _inst = instance_create_depth(x+lengthdir_x(32,_dir),y+lengthdir_y(32,_dir),-3000,obj_ef_boss_attack_range, {image_xscale: _dis-32});
	_inst.image_angle = _dir;
	
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
	
	var _inst = instance_create_depth(x+lengthdir_x(32,_dir),y+lengthdir_y(32,_dir),-3000,obj_ef_boss_attack_range, {image_xscale: _dis-32});
	_inst.image_angle = _dir;
	
	x_prev = x;
	y_prev = y;
	x_goal = _x;
	y_goal = _y;
}

function start_rush_attack()
{
	audio_stop_sound(snd_move);
	audio_play_sound(snd_move,1,0);
	action = "rush_attack";
	total_action_time = 10;
	
	var _dir = point_direction(x_prev,y_prev,x_goal,y_goal);
	if(_dir <= 45 or _dir > 360-45){sprite_index = spr_boss_dash_right;}
	else if(_dir <= 90+45 and _dir > 45){sprite_index = spr_boss_dash_up;}
	else if(_dir <= 180+45 and _dir > 90+45){sprite_index = spr_boss_dash_left;}
	else{sprite_index = spr_boss_dash_down;}
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
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "윽.. 내가.. 지다니...",
		next_struct: function(){ return obj_boss_phase_3.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "네 모발을 가져가도록 하지.",
		next_struct: function(){ return obj_boss_phase_3.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "그것만은 안돼..!!",
		next_struct: function(){ return obj_boss_phase_3.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "너는 이제 탈모의 요정이다.",
		next_struct: function(){ return obj_boss_phase_3.dialogue[4]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "크아아악!!",
		next_struct: function(){ return obj_boss_phase_3.dialogue[5]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "",
		text: "(당신은 그의 모발을 모두 뜯어갔다.)",
		next_struct: function(){ return obj_boss_phase_3.dialogue[6]; }
	},
	{
		type: "code",
		image: spr_dialogue_hair_fairy,
		func: function(){
			room_goto_f(rm_ending, ST.DIALOGUE);
		}
	}
];