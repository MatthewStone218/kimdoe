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
		text: "그 잠깐의 영광은 며칠간 잊히지 않고 당신의 머리를 맴돌았습니다.",
		next_struct: function(){ return obj_prologue_dialogue.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		text: "당신은 결국 지옥에 쳐들어가 죽어버린 모근들을 되찾아오기로 결심했습니다.",
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
			unlock_stage(1);
			room_goto_f(rm_stage_1,ST.GAME);
		}
	}
]

obj_dialogue_system.set_dialogue(dialogue[0]);