/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		text: "너, 머리숱이 없구나.",
		next_struct: function(){ return obj_npc_gdddd_devil_2.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		text: "불쌍하군. 빠르게 죽여주지.",
		next_struct: function(){ return obj_npc_gdddd_devil_2.dialogue_fail[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_gdddd_devil,
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
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		text: "다시 보는군! 여기를 지나가려면 나의 이야기를 들어야한다.\n어떤 이야기가 듣고싶나?",
		next_struct: function(){ return obj_npc_gdddd_devil_2.dialogue_success[1]; }
	},
	{
		type: "choice",
		image: spr_dialogue_gdddd_devil,
		name: "",
		choice: [
			["군대 얘기",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_2.dialogue_success[2])}}],
			["똥 얘기",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_2.dialogue_success[2])}}],
			["딸딸이 얘기",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_2.dialogue_success[2])}}],
		],
		next_struct: function(){ return obj_npc_gdddd_devil_2.dialogue_success[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_gdddd_devil,
		name: "",
		text: "(당신은 그가 군대에서 똥싸며 딸딸이 친 이야기를\n5시간 동안 듣고 겨우 풀려났다.)",
		next_struct: function(){ return obj_npc_gdddd_devil_2.dialogue_success[3]; }
	},
	{
		type: "code",
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		func: function()
		{
			unlock_stage(8);
			room_goto_f(rm_stage_7, ST.GAME);
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