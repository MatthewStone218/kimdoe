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

global.cell_width = 100;

scr_live_set_auto()

randomize();

room_goto(val_room_start);