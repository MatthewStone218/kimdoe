// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function init_bgm(){
	global.bgm_index = -1;
	global.bgm = -1;
	global.stoped_bgm = [];
}

function start_bgm(bgm){
	stop_bgm();
	global.bgm = audio_play_sound(bgm,1,1);
	global.bgm_index = bgm;
}

function stop_bgm(){
	if(global.bgm != -1)
	{
		audio_sound_gain(global.bgm,0,1000);
		add_bgm_on_stoped_list(global.bgm);
		reset_bgm();
	}
}

function add_bgm_on_stoped_list(_bgm){
	array_push(global.stoped_bgm,_bgm)
}

function reset_bgm(){
	global.bgm = -1;
	global.bgm_index = -1;
}

function get_stoped_bgms()
{
	return global.stoped_bgm;
}

function remove_bgm_from_stoped_list(_bgm)
{
	array_delete(global.stoped_bgm,array_get_index(global.stoped_bgm,_bgm),1);
}

function is_bgm_playing()
{
	return global.bgm != -1;
}