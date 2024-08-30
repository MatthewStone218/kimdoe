// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function show_mattkeyboard(){
	global.__mattkeyboard_showen__ = true;
	global.__mattkeyboard_showen_frame__ = 2;
}

function hide_mattkeyboard(){
	global.__mattkeyboard_hide_frame__ = 2;
}

function set_mattkeyboard_focus(_kortext){
	global.__mattkeyboard_focus__ = _kortext;
}

function get_mattkeyboard_showen()
{
	return global.__mattkeyboard_showen__;
}

global.__mattkeyboard_showen__ = false;
global.__mattkeyboard_hide_frame__ = -1;
global.__mattkeyboard_showen_frame__ = 2;
global.__mattkeyboard_focus__ = noone;
global.__mattkeyboard_shift__ = false;
global.__mattkeyboard_init_width__ = room_width;
global.__mattkeyboard_init_height__ = room_height;

function __mattkeyboard_step__()
{
	global.__mattkeyboard_showen_frame__--;
	global.__mattkeyboard_hide_frame__--;
	if(global.__mattkeyboard_hide_frame__ == 0){global.__mattkeyboard_showen__ = false;}
	
	call_later(1,time_source_units_frames,__mattkeyboard_step__);
}

__mattkeyboard_step__();

kr_en_add_event();