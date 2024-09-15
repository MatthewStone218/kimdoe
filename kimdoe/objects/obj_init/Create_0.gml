/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

val_room_start = rm_main;

#macro K_real_string kor_string + text_eng_to_hangul(kor_buffer)
#macro LIVE if(live_call()){return live_result;}

#macro CM_X ((view_enabled and view_visible[0]) ? camera_get_view_x(view_camera[0]) : 0)
#macro CM_Y ((view_enabled and view_visible[0]) ? camera_get_view_y(view_camera[0]) : 0)
#macro CM_W ((view_enabled and view_visible[0]) ? camera_get_view_width(view_camera[0]) : room_width)
#macro CM_H ((view_enabled and view_visible[0]) ? camera_get_view_height(view_camera[0]) : room_height)

global.kor_mode = "ko_kr";
global.keyboard_objs = [];
global.shift_pressing = 0;
global.keyboard_kr = 1;
global.keyboard_visible = 0;

global.cell_width = 64;

global.state = ST.MAIN;

ini_open("save.ini");

global.cleared_stage = ini_read_real("system","cleared_stage",0);

ini_close();

global.stage_arr =
[
	[rm_prologue,ST.DIALOGUE,"프롤로그"],
	[rm_tutorial,ST.GAME,"모발의 요정"],
	[rm_stage_1,ST.GAME,"첫 모근"],
	[rm_stage_2,ST.GAME,"잠시 빌려가는거야"],
	[rm_stage_3,ST.GAME,"세번째 모근"],
	[rm_stage_4,ST.GAME,"탈모 박사"],
	[rm_stage_5,ST.GAME,"군똥딸"],
	[rm_stage_6,ST.GAME,"군똥딸2"],
	[rm_stage_7,ST.GAME,"햇반 가져와"],
	[rm_stage_8,ST.GAME,"마지막 군똥딸"],
	[rm_stage_9,ST.GAME,"능지 테스트"],
	[rm_stage_10,ST.GAME,"자기 객관화"],
	[rm_stage_11,ST.GAME,"신비한 지능"],
	[rm_stage_12,ST.GAME,"기적"],
	[rm_stage_13,ST.GAME,"골룸조이고"],
	[rm_stage_14,ST.GAME,"똥겜은 멀지 않다"],
	[rm_stage_15,ST.GAME,"똥겜 중독"],
	[rm_stage_16,ST.GAME,"똥겜의 왕"],
	[rm_stage_boss_intro,ST.GAME,"자진입대"],
]

texturegroup_load("ROOM_CHANGER");

scr_live_set_auto()

randomize();

room_goto(val_room_start);

enum ST
{
	MAIN,
	STAGE_SELECTION,
	PAUSE,
	DIALOGUE,
	GAME,
	MOVING,
	DYING,
	SCENE_BOSS_1
}