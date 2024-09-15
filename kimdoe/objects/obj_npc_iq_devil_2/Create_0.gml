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
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "머리카락이라도 있었으면 좀 나았을텐데.",
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "",
		text: "(그는 당신의 지능과 모발을 흡수했다.)",
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_fail[3]; }
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
		text: "또 보는군.",
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "네 지능을 솔직하게 고하면 순순히 보내주지.",
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_success[2]; }
	},
	{
		type: "choice",
		image: spr_dialogue_iq_devil,
		name: "",
		choice: [
			["1",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_clear_1[0])}}],
			["100",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_clear_2[0])}}]
		]
	}
]

dialogue_clear_1 = 
[
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "솔직하군. 보내주마.",
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_clear_1[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		func: function(){
			unlock_stage(12);
			room_goto_f(rm_stage_11, ST.GAME);
		}
	}
]

dialogue_clear_2 = 
[
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "? 진심으로 그렇게 생각하는 눈빛이군.\n이것도 솔직한걸로 봐야하나...",
		next_struct: function(){ return obj_npc_iq_devil_2.dialogue_clear_2[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		func: function(){
			unlock_stage(12);
			room_goto_f(rm_stage_11, ST.GAME);
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