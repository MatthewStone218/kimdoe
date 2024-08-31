/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

var _inst = noone;

with(obj_ui_stage_selection)
{
	if(focused)
	{
		_inst = id;
		break;
	}
}

y += (_inst.y-y)/3;

camera_set_view_pos(view_camera[0],0,y-CM_H/2);