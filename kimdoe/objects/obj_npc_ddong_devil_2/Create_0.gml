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
		text: "네가 모발을 찾아가는 과정 자체가 마치 하나의 똥겜과 같아.",
		next_struct: function(){ return obj_npc_ddong_devil_2.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "하지만 모발을 모두 모으지 못했군..\n난 네가 똥겜을 제대로 클리어하는 모습을 보고싶다.",
		next_struct: function(){ return obj_npc_ddong_devil_2.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "",
		text: "죽여줄테니 다시 오도록.",
		next_struct: function(){ return obj_npc_ddong_devil_2.dialogue_fail[3]; }
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
		text: "네가 모발을 찾아가는 과정 자체가 마치 하나의 똥겜과 같아.",
		next_struct: function(){ return obj_npc_ddong_devil_2.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "너무 진한 똥내가 나는군. 난 더 강력한 똥겜을 원해.\n네가 똥겜을 하는 모습을 조금 더 보고싶어.",
		next_struct: function(){ return obj_npc_ddong_devil_2.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		func: function(){
			unlock_stage(16);
			room_goto_f(rm_stage_15, ST.GAME);
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