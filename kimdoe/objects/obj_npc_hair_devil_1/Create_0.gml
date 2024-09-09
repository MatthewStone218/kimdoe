/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "넌 뭐야? 형편없는 모발을 가지고있군.",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "사내가 적어도 모발이 10m는 넘어야지.",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "죽어라. 흉측한 것.",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_fail[3]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		func: function()
		{
			unlock_stage(2);
			with(obj_player){with(obj_dialogue_system){kill_dialogue();} kill_self();}
		}
	}
]

dialogue_success = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "음? 넌... 아주 유혹적인 모발을 가지고있군..",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "모두 뽑아버리고 싶을 정도야.",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_success[2]; }
	},
	{
		type: "choice",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		choice: [
			["뽑아보든가!",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_die[0])}}],
			["내가 모근을 찾는 걸 도와주지 않겠어?",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_clear[0])}}]
		],
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_success[3]; }
	}
]

dialogue_die = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "나야 좋지.",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_die[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_player_1,
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
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "그래. 모았다가 한번에 뽑아야 더 절망적인 법이지.\n먼저 가서 기다리고 있겠다.",
		next_struct: function(){ return obj_npc_hair_devil_1.dialogue_clear[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		func: function(){
			unlock_stage(2);
			room_goto_f(rm_stage_2, ST.GAME);
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