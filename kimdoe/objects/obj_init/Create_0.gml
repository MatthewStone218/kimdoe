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
	[rm_stage_1,ST.GAME,"첫 모근"],
	[rm_stage_2,ST.GAME,"잠시 빌려가는거야"],
	[rm_stage_3,ST.GAME,"세번째 모근"],
	[rm_stage_4,ST.GAME,"네번째 모근"]
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
	DYING
}