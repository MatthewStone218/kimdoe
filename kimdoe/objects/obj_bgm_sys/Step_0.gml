/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

var _bgms = get_stoped_bgms();

for(var i = 0; i < array_length(_bgms); i++)
{
	if(audio_sound_get_gain(_bgms[i]) == 0)
	{
		audio_stop_sound(_bgms[i]);
		remove_bgm_from_stoped_list();
	}
}