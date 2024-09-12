/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

dialogue = 
[
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "안녕? 혹시 이곳에서 모발들을 찾고있니?",
		next_struct: function(){ return obj_npc_hair_fairy.dialogue[1]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "너처럼 모발을 되찾기 위해 많은 사람들이 왔었지.\n모두 실패했지만.",
		next_struct: function(){ return obj_npc_hair_fairy.dialogue[2]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "모발이 풍성해진 상태로 살아나가고 싶다면, 이것만 지키면 돼.",
		next_struct: function(){ return obj_npc_hair_fairy.dialogue[3]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "1.머리와 연결된 모발을 밟거나 돌로 깔아 뭉개지 않을 것.\n2.어떤 방법으로든 죽지 않을 것.",
		next_struct: function(){ return obj_npc_hair_fairy.dialogue[4]; }
	},
	{
		type: "text",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		text: "간단하지? 그럼 열심히 해서 나처럼 풍성해져봐~",
		next_struct: function(){ return obj_npc_hair_fairy.dialogue[5]; }
	},
	{
		type: "code",
		image: spr_dialogue_hair_fairy,
		name: "모발의 요정",
		func: function(){
			unlock_stage(2);
			room_goto_f(rm_stage_1, ST.GAME);
		}
	}
]

function interact()
{
	obj_dialogue_system.set_dialogue(dialogue[0]);
}