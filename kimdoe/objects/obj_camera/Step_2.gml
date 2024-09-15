/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
x = obj_player.s_x;
y = obj_player.s_y;

bib = max(0,bib-6);

camera_set_view_pos(view_camera[0],median(0,x-CM_W/2,room_width-CM_W)+random_range(-bib,bib),median(0,y-CM_H/2,room_height-CM_H)+random_range(-bib,bib));