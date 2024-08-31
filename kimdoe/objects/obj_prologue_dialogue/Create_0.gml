/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue = 
[
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "당신은 어느날 모근이 풍성해지는 꿈을 꿨습니다.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "이루기 쉬운 꿈은 아니었지만,\n충분히 도전할 가치가 있어보입니다.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "당신은 지옥에서 기다리고 있는\n당신의 모근(이었던 것)을 되찾기로 합니다.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "\"기다려라, 모근 하렘이여.\"\n이렇게 당신의 모험이 시작되었습니다.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[4]; }
	},
	{
		type: "code",
		image: spr_dialogue_player_1,
		func: function()
		{
			unlock_stage(1);
			room_goto_f(rm_stage_1,ST.GAME);
		}
	}
]

obj_dialogue_system.set_dialogue(dialogue[0]);