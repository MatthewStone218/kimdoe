/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "더 많은 모발이 필요하다. 죽여줄테니 다시 모아오도록.",
		next_struct: function(){ return obj_npc_hair_devil_4.dialogue_fail[1]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		func: function()
		{
			unlock_stage(2);
			with(obj_player){with(obj_dialogue_system){kill_dialogue();} kill_self();}
		}
	}
]

dialogue_success = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "모발을 쫒다보니 여기까지 와버렸군. 이제부터는 다른 악마의 영역이야.",
		next_struct: function(){ return obj_npc_hair_devil_4.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		text: "안타깝지만 난 여기 남지. 이제 너 스스로 모발을 찾아가도록 해.",
		next_struct: function(){ return obj_npc_hair_devil_4.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		name: "탈모의 악마",
		func: function()
		{
			unlock_stage(5);
			room_goto_f(rm_stage_5, ST.GAME);
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