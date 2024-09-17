/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

var _prev_obj = noone;

ini_open("save.ini");

global.cleared_stage = ini_read_real("system","cleared_stage",0);

ini_close();

for(var i = 0; i < min(array_length(global.stage_arr),global.cleared_stage+1); i++)
{
	var _inst = instance_create_layer(960,540+i*160,"stage_selection",obj_ui_stage_selection,{my_room: global.stage_arr[i][0], my_stage_state: global.stage_arr[i][1],  text: global.stage_arr[i][2]});
	
	if(i == 0)
	{
		_inst.focused = true;
		_inst.focus();
	}
	else
	{
		_prev_obj.navigation.down = _inst;
		_inst.navigation.up = _prev_obj;
	}
	
	_prev_obj = _inst;
}