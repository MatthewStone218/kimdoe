/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
global.player_action_speed = 0.05;

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "여전히 네 지능은 모자라보이는구나.",
		next_struct: function(){ return obj_npc_iq_devil_3.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "머리카락이라도 있었으면 좀 나았을텐데.",
		next_struct: function(){ return obj_npc_iq_devil_3.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "",
		text: "(그는 당신의 지능과 모발을 흡수했다.)",
		next_struct: function(){ return obj_npc_iq_devil_3.dialogue_fail[3]; }
	},
	{
		type: "code",
		image: spr_dialogue_iq_devil,
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
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "네 지능은 참 흥미로워.\n모발과 관련된 일에 대해서만 약 2배의 지능을 발휘하고있어.",
		next_struct: function(){ return obj_npc_iq_devil_3.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "흠. 네가 다음 퍼즐을 푸는 모습을 봐야겠어.",
		next_struct: function(){ return obj_npc_iq_devil_3.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		func: function(){
			unlock_stage(13);
			room_goto_f(rm_stage_12, ST.GAME);
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