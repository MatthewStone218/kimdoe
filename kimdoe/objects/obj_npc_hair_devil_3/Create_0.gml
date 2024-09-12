/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "더 많은 모발이 필요하다. 죽여줄테니 다시 모아오도록.",
		next_struct: function(){ return obj_npc_hair_devil_3.dialogue_fail[1]; }
	},
	{
		type: "code",
		image: spr_dialogue_hair_devil,
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
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "이것 봐. 벌써 모발이 이만큼이나 모였어.",
		next_struct: function(){ return obj_npc_hair_devil_3.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		text: "도대체 얼마나 심한 탈모를 앓고있던거야?",
		next_struct: function(){ return obj_npc_hair_devil_3.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_hair_devil,
		name: "탈모의 악마",
		func: function()
		{
			unlock_stage(5);
			room_goto_f(rm_stage_4, ST.GAME);
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