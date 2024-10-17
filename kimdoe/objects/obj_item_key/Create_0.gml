/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
function gain()
{
	audio_stop_sound(snd_get_key);
	audio_play_sound(snd_get_key,1,0);
	instance_create_depth(x,y,depth-200,obj_ef_gain_item);
	global.key++;
	
	instance_destroy();
}