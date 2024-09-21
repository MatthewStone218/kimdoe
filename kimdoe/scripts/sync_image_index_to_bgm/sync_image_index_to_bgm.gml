// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function sync_image_index_to_bgm(){
	if(is_bgm_playing())
	{
		image_index = (audio_sound_get_track_position(global.bgm)*14.7) mod sprite_get_number(sprite_index);
	}
	else
	{
		image_index += 0.1;
	}
}