/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		text: "너, 머리숱이 없구나.",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		text: "불쌍하군. 빠르게 죽여주지.",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_fail[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_devil_2,
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
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		text: "또 만나다니 이런 우연이! 이번에는 어떤 이야기가 듣고싶나?",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[1]; }
	},
	{
		type: "choice",
		image: spr_dialogue_devil_2,
		name: "",
		choice: [
			["군똥딸 셋 다 얘기해줘.",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_3.dialogue_success[2])}}],
			["시발 그만해",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_3.dialogue_success[4])}}],
			["기다려봐, 밥 먹으면서 듣고싶어.",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_3.dialogue_success[6])}}],
		],
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		text: "좋아. 이번 주제는 바로 콘돔딸인데...",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "",
		text: "(당신은 콘돔딸 이야기를 5시간 동안 듣고 겨우 풀려났다.)",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[8]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		text: "어...듣기 싫었으면 미안..",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[5]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "",
		text: "(그는 약간 풀이 죽었다.)",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[8]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		text: "뭘 좀 아는군! 이런 이야기는 밥먹으면서 해야 제맛이지!",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[7]; }
	},
	{
		type: "text",
		image: spr_dialogue_devil_2,
		name: "",
		text: "(당신은 군똥딸을 반찬삼아 그와 함께 즐거운 저녁시간을 보냈다.)",
		next_struct: function(){ return obj_npc_gdddd_devil_3.dialogue_success[8]; }
	},
	{
		type: "code",
		image: spr_dialogue_devil_2,
		name: "군똥딸의 악마",
		func: function()
		{
			unlock_stage(8);
			room_goto_f(rm_stage_8, ST.GAME);
		}
	},
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