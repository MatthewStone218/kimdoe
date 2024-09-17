/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
y2 = -500;

dialogue = 
[
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "모발의 요정",
		text: "안녕? 모발을 많이 모았구나.",
		next_struct: function(){ return obj_npc_boss_1.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "너는...모발의 요정?",
		next_struct: function(){ return obj_npc_boss_1.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "모발의 요정",
		text: "내가 처음에 말했지? 모근을 되찾아가려던 모든 사람이 실패했다고.\n왜 그랬을 것 같아?",
		next_struct: function(){ return obj_npc_boss_1.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_player_1,
		name: "김도",
		text: "설마...",
		next_struct: function(){ return obj_npc_boss_1.dialogue[4]; }
	},
	{
		type: "text",
		image: spr_dialogue_hea,
		name: "모발의 요정",
		text: "그래. 네가 생각하는게 맞아.\n이제 네 모발을 모두 내놔.",
		next_struct: function(){ return obj_npc_boss_1.dialogue[5]; }
	},
	{
		type: "choice",
		image: spr_dialogue_hea,
		name: "",
		choice: [
			["아니, 내가 네 모발을 가져갈거다.",function(){with(obj_dialogue_system){set_dialogue(other.dialogue[6])}}],
			["...그래. 내 모발을 모두 가져가.",function(){with(obj_dialogue_system){set_dialogue(other.dialogue_die[0])}}]
		]
	},
	{
		type: "code",
		image: spr_dialogue_hea,
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
		text: "당신은 그에게 모든 모근을 상납했다.",
		next_struct: function(){ return obj_npc_boss_1.dialogue_die[1]; }
	},
	{
		type: "text",
		name: "",
		text: "당신의 풍성한 모발에 대한 꿈은 여기서 끝을 맺었다.",
		next_struct: function(){ return obj_npc_boss_1.dialogue_die[2]; }
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