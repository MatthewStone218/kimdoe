/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
global.player_action_speed = 0.05;
global.player_can_attack = false;

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "음? 이 냄새는..?",
		next_struct: function(){ return obj_npc_ddong_devil_1.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "너에게선 진득한 똥겜의 향기가 나는군.\n나와 함께 골룸을 조이고 즐기자.",
		next_struct: function(){ return obj_npc_ddong_devil_1.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "",
		text: "(당신은 20시간동안 그와 함께 골룸을 플레이했다.)",
		next_struct: function(){ return obj_npc_ddong_devil_1.dialogue_fail[3]; }
	},
	{
		type: "code",
		image: spr_dialogue_ddong_devil,
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
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "음? 이 냄새는..?",
		next_struct: function(){ return obj_npc_ddong_devil_1.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "너에게선 진한 똥겜의 향기가 나는구나.\n마치 지금도 똥겜을 플레이하는 것 같은 냄새야.\n흥미롭군.",
		next_struct: function(){ return obj_npc_ddong_devil_1.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		func: function(){
			unlock_stage(15);
			room_goto_f(rm_stage_14, ST.GAME);
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