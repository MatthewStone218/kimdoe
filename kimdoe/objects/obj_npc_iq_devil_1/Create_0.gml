/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		text: "네가 이 퍼즐을 푸는걸 아까부터 봤는데, 네 지능은 네 모발만큼이나 모자라보이는구나.",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		text: "모발과 지능 모두 내가 잘 써주지.",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_fail[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_3,
		name: "",
		text: "(그는 당신의 지능과 모발을 흡수했다.)",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_fail[3]; }
	},
	{
		type: "code",
		image: spr_dialogue_devil_3,
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
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		text: "네가 이 퍼즐을 푸는걸 아까부터 봤는데, 네 지능은 네 모발만큼이나 모자라보이는구나.",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		text: "그 쓸데 없어보이는 모발을 모두 내놓으면 순순히 보내주지.",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_success[2]; }
	},
	{
		type: "choice",
		image: spr_dialogue_devil_3,
		name: "",
		choice: [
			["내 모발을 다 가져가.",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_clear_1[0])}}],
			["차라리 날 죽여라!",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_clear_2[0])}}]
		]
	}
]

dialogue_clear_1 = 
[
	{
		type: "text",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		text: "장난이야.\n모발을 잃은 네 모습은 너무 추할 것 같아 보기가 두렵거든.",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_clear_1[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		func: function(){
			unlock_stage(10);
			room_goto_f(rm_stage_10, ST.GAME);
		}
	}
]

dialogue_clear_2 = 
[
	{
		type: "text",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		text: "장난이야. 그냥 지나가도 돼.",
		next_struct: function(){ return obj_npc_iq_devil_1.dialogue_clear_2[1]; }
	}
	,
	{
		type: "code",
		image: spr_dialogue_devil_3,
		name: "능지의 악마",
		func: function(){
			unlock_stage(10);
			room_goto_f(rm_stage_10, ST.GAME);
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