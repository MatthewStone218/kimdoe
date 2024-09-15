/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue = 
[
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지 옥에서는 아무도 못 나가 해병님",
		text: "새끼...기열!",
		next_struct: function(){ return obj_npc_boss_1.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지 옥에서는 아무도 못 나가 해병님",
		text: "지옥에 자진 입대 해놓고, 포탈을 통해 나가려고 하다니...",
		next_struct: function(){ return obj_npc_boss_1.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "지 옥에서는 아무도 못 나가 해병님",
		text: "이는 중대한 탈영 행위이나, 스스로 자진 입대한 점이 기특하여\n전우애를 통한 오도기합력 주입을 하는 것으로 용서해주겠다!",
		next_struct: function(){ return obj_npc_boss_1.dialogue[2]; }
	},
	{
		type: "choice",
		image: spr_dialogue_hea,
		name: "",
		choice: [
			["살려주세요",function(){with(obj_dialogue_system){set_dialogue(other.dialogue[3])}}],
			["악! 전우애 실시!",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_die[0])}}]
		]
	},
	{
		type: "code",
		image: spr_dialogue_hea,
		name: "지 옥에서는 아무도 못 나가 해병님",
		func: function(){
			room_goto_f(rm_stage_boss_phase_1, ST.GAME);
		}
	}
]

dialogue_die =
[
	{
		type: "text",
		name: "",
		text: "(당신은 전우애를 실시하고 지옥-해병대에 입대했다.)",
		next_struct: function(){ return obj_npc_boss_1.dialogue_die[1]; }
	},
	{
		type: "text",
		name: "",
		text: "헤이빠빠리빠! 달콤쌉싸름한 지옥 해병대의 추억이여!",
		next_struct: function(){ return obj_npc_boss_1.dialogue_die[1]; }
	},
	{
		type: "code",
		name: "",
		func: function(){
			with(obj_dialogue_system){kill_dialogue();}
			with(obj_player){kill_self();}
		}
	}
]

function interact()
{
	obj_dialogue_system.set_dialogue(dialogue[0]);
}