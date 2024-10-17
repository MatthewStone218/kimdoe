/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
start_bgm(snd_bgm_ending);

dialogue = 
[
	{
		type: "text",
		image: spr_ending_image_1,
		bg: spr_ui_dialogue_bg_1,
		no_belt: true,
		text: "당신은 풍성한 모근 모발을 가지고 지옥에서 탈출했습니다.",
		next_struct: function(){ return obj_ending_dialogue.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_ending_image_2,
		bg: spr_ui_dialogue_bg_1,
		no_belt: true,
		text: "이제 영광은 당신의 손 안에 있습니다.",
		next_struct: function(){ return obj_ending_dialogue.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_ending_image_3,
		bg: spr_ui_dialogue_bg_1,
		no_belt: true,
		text: "당신의 모험은 이렇게 끝을 맺었습니다.",
		next_struct: function(){ return obj_ending_dialogue.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_ending_image_3,
		bg: spr_ui_dialogue_bg_1,
		no_belt: true,
		text: "축하합니다.",
		next_struct: function(){ return obj_ending_dialogue.dialogue[4]; }
	},
	{
		type: "code",
		image: spr_ending_image_3,
		bg: spr_ui_dialogue_bg_1,
		no_belt: true,
		func: function()
		{
			unlock_stage(1);
			room_goto_f(rm_credit,ST.GAME);
		}
	}
]

obj_dialogue_system.set_dialogue(dialogue[0]);