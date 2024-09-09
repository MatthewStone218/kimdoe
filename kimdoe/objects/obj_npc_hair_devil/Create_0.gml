/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue_fail = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "넌 뭐야? 형편없는 모발을 가지고있군.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "사내가 적어도 모발이 5m는 넘어야지.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "죽어라. 흉측한 것.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "이렇게 당신의 모험이 시작됩니다...!",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[4]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		func: function()
		{
			unlock_stage(2);
			room_goto_f(rm_stage_2,ST.GAME);
		}
	}
]

function interact()
{
	if(instance_number(obj_hair) == 0)
	{
		obj_dialogue_system.set_dialogue(dialogue_fail[0]);
	}
}