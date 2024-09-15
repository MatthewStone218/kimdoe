/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "이번에도 똥겜을 클리어하지 못했군.",
		next_struct: function(){ return obj_npc_ddong_devil_4.dialogue_fail[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "",
		text: "죽여줄테니 다시 오도록.",
		next_struct: function(){ return obj_npc_ddong_devil_4.dialogue_fail[2]; }
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
		text: "아, 난 네 앞에서 초라해지는군.\n네 진한 똥내가 내 존재를 지워내는 것 같아.",
		next_struct: function(){ return obj_npc_ddong_devil_4.dialogue_success[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		text: "어쩔 수 없지. 지금부터는... 네가 똥겜의 악마다.",
		next_struct: function(){ return obj_npc_ddong_devil_4.dialogue_success[2]; }
	},
	{
		type: "code",
		image: spr_dialogue_ddong_devil,
		name: "똥겜의 악마",
		func: function(){
			unlock_stage(18);
			room_goto_f(rm_stage_boss_intro, ST.GAME);
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