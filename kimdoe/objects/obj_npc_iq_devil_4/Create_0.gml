/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "여전히 네 지능은 모자라보이는구나.",
		next_struct: function(){ return obj_npc_iq_devil_4.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "머리카락이라도 있었으면 좀 나았을텐데.",
		next_struct: function(){ return obj_npc_iq_devil_4.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "",
		text: "(그는 당신의 지능과 모발을 흡수했다.)",
		next_struct: function(){ return obj_npc_iq_devil_4.dialogue_fail[3]; }
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
		text: "네게 경의를 표하지.",
		next_struct: function(){ return obj_npc_iq_devil_4.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		text: "그 지능으로 이 퍼즐을 풀다니, 사람들은 이걸 기적이라 부른다.\n충분히 관찰했으니 더이상 따라다니지 않으마.",
		next_struct: function(){ return obj_npc_iq_devil_4.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_iq_devil,
		name: "능지의 악마",
		func: function(){
			unlock_stage(14);
			room_goto_f(rm_stage_13, ST.GAME);
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