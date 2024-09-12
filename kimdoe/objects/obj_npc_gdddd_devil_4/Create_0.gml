/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		text: "너, 머리숱이 없구나.",
		next_struct: function(){ return obj_npc_gdddd_devil_4.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		text: "불쌍하군. 빠르게 죽여주지.",
		next_struct: function(){ return obj_npc_gdddd_devil_4.dialogue_fail[2]; }
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
		text: "안타깝지만 즐거운 이야기는 이번이 마지막이 될거다. 어떤 이야기가 듣고싶나?",
		next_struct: function(){ return obj_npc_gdddd_devil_4.dialogue_success[1]; }
	},
	{
		type: "choice",
		image: spr_dialogue_gdddd_devil,
		name: "",
		choice: [
			["군대 얘기",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_4.dialogue_success[2])}}],
			["똥 얘기",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_4.dialogue_success[2])}}],
			["딸딸이 얘기",function(){with(obj_dialogue_system){set_dialogue(obj_npc_gdddd_devil_4.dialogue_success[2])}}],
		],
		next_struct: function(){ return obj_npc_gdddd_devil_4.dialogue_success[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_gdddd_devil,
		name: "",
		text: "(사실 당신은 그보다 군똥딸에 대해 잘 알고있었지만\n그의 얘기를 끝까지 들어줬다. 그는 만족한 것처럼 보인다.)",
		next_struct: function(){ return obj_npc_gdddd_devil_4.dialogue_success[3]; }
	},
	{
		type: "code",
		image: spr_dialogue_gdddd_devil,
		name: "군똥딸의 악마",
		func: function()
		{
			unlock_stage(10);
			room_goto_f(rm_stage_9, ST.GAME);
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