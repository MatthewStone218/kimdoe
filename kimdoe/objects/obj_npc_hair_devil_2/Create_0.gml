/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
global.player_action_speed = 0.05;
global.player_can_attack = false;

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "더 많은 모발이 필요하다. 죽여줄테니 다시 모아오도록.",
		next_struct: function(){ return obj_npc_hair_devil_2.dialogue_fail[1]; }
	},
	{
		type: "code",
		image: spr_dialogue_hair_devil,
		func: function()
		{
			with(obj_player){with(obj_dialogue_system){kill_dialogue();} kill_self();}
		}
	}
]

dialogue_success = 
[
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "잘 모아왔군. 이제 모두 내놔라. 내가 안전하게 보관해주마 크크",
		next_struct: function(){ return obj_npc_hair_devil_2.dialogue_success[1]; }
	},
	{
		type: "choice",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		choice: [
			["못 믿겠어. 내가 가지고 있을래.",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_die[0])}}],
			["돌려주는거.. 맞지..?",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_clear[0])}}]
		]
	}
]

dialogue_die = 
[
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "뭐? 그렇다면 억지로 뺏어가는 수 밖에.",
		next_struct: function(){ return obj_npc_hair_devil_2.dialogue_die[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		func: function(){
			with(obj_dialogue_system){kill_dialogue();}
			with(obj_player){kill_self();}
		}
	}
]

dialogue_clear = 
[
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "그래. 잠시 빌려가는거야. 네가 죽을 때 즈음에 다시 돌려주마 크크",
		next_struct: function(){ return obj_npc_hair_devil_2.dialogue_clear[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		func: function(){
			unlock_stage(4);
			room_goto_f(rm_stage_3, ST.GAME);
		}
	}
]

function interact()
{
	if(instance_number(obj_item_hair) == 0)
	{
		obj_dialogue_system.set_dialogue(dialogue_success[0]);
	}
	else
	{
		obj_dialogue_system.set_dialogue(dialogue_fail[0]);
	}
}